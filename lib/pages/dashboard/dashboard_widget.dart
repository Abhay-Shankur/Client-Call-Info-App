import 'package:call_info/main.dart';
import 'package:call_info/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dashboard_model.dart';
import '../components/grid/grid_widget.dart';
import 'cal_log_service.dart'; // import the CallLogService
import 'package:call_log/call_log.dart'; // import CallLogEntry
// for DateFormat
import 'package:fl_chart/fl_chart.dart';

export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Variables to store call log counts
  int incomingCalls = 0;
  int outgoingCalls = 0;
  int missedCalls = 0;
  int totalCalls = 0;

  // Variable to store the list of call logs
  List<CallLogEntry> callLogs = [];

  // Variables for 7-day call history graph
  List<FlSpot> lineChartData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());
    _model.initState(context);

    // Retrieve and classify call logs on init
    _retrieveCallLogs();
    // Retrieve call logs for the past week
    _retrieveCallLogsForWeek();
  }

  Future<void> _retrieveCallLogs() async {
    CallLogService callLogService = CallLogService();
    Map<String, int> callCounts = await callLogService.retrieveAndClassifyCallLogs();
    List<CallLogEntry> logs = await callLogService.retrieveTodayCallLogs();

    setState(() {
      incomingCalls = callCounts['incomingCalls'] ?? 0;
      outgoingCalls = callCounts['outgoingCalls'] ?? 0;
      missedCalls = callCounts['missedCalls'] ?? 0;
      totalCalls = callCounts['totalCalls'] ?? 0;
      callLogs = logs;
    });
  }

  Future<void> _retrieveCallLogsForWeek() async {
    CallLogService callLogService = CallLogService();
    List<CallLogEntry> logs = await callLogService.retrievePastWeekCallLogs();

    Map<String, int> dailyCallCounts = {};
    for (var i = 0; i < 7; i++) {
      DateTime day = DateTime.now().subtract(Duration(days: i));
      String dayLabel = DateFormat('EEEE').format(day);
      dailyCallCounts[dayLabel] = 0;
    }

    for (var log in logs) {
      DateTime logDate = DateTime.fromMillisecondsSinceEpoch(log.timestamp!);
      String dayLabel = DateFormat('EEEE').format(logDate);
      if (dailyCallCounts.containsKey(dayLabel)) {
        dailyCallCounts[dayLabel] = dailyCallCounts[dayLabel]! + 1;
      }
    }

    List<String> days = dailyCallCounts.keys.toList().reversed.toList();
    List<double> callCounts = dailyCallCounts.values
        .toList()
        .reversed
        .toList()
        .map((e) => e.toDouble())
        .toList();

    setState(() {
      lineChartData = List.generate(callCounts.length, (index) {
        return FlSpot(index.toDouble(), callCounts[index]);
      });
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: MyTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                        child: Text(
                          'Dashboard',
                          textAlign: TextAlign.center,
                          style: MyTheme.of(context)
                              .titleMedium
                              .override(
                            fontFamily: 'Readex Pro',
                            color: MyTheme.of(context).primaryText,
                            fontSize: 35,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: FlutterFlowIconButton(
                          borderColor:
                          MyTheme.of(context).secondaryBackground,
                          borderRadius: 20,
                          fillColor:
                          MyTheme.of(context).secondaryBackground,
                          icon: Icon(
                            Icons.account_circle_outlined,
                            color: MyTheme.of(context).primaryText,
                            size: 40,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouteKeys.settingsPage);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                '     Find Your Daily Call Summary Here..',
                style: MyTheme.of(context).labelMedium,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GridWidget(
                      calls: incomingCalls.toString(),
                      callType: 'Incoming Calls',
                    ),
                  ),
                  Expanded(
                    child: GridWidget(
                      calls: outgoingCalls.toString(),
                      callType: 'Outgoing Calls',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GridWidget(
                      calls: missedCalls.toString(),
                      callType: 'Missed Calls',
                    ),
                  ),
                  Expanded(
                    child: GridWidget(
                      calls: totalCalls.toString(),
                      callType: 'Total Calls',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: MyTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x34090F13),
                        offset: Offset(0.0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Call Logs',
                          style: MyTheme.of(context)
                              .titleMedium
                              .override(
                            fontFamily: 'Readex Pro',
                            color: MyTheme.of(context).primaryText,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: MyTheme.of(context).primaryText,
                        ),
                        SizedBox(
                          height: 290,
                          child: SingleChildScrollView(
                            child: Column(
                              children: callLogs.map((log) {
                                return Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 0),
                                      child: ListTile(
                                        dense: true,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        contentPadding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        leading: Icon(
                                          log.callType == CallType.incoming
                                              ? Icons.call_received
                                              : log.callType ==
                                              CallType.outgoing
                                              ? Icons.call_made
                                              : Icons.call_missed,
                                          color: MyTheme.of(context)
                                              .primary,
                                        ),
                                        title: Text(
                                          log.name ?? log.number ?? 'Unknown',
                                          style: MyTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        subtitle: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                log.number?.isNotEmpty == true
                                                    ? log.number!
                                                    : 'Unknown',
                                                style: MyTheme.of(
                                                    context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'Readex Pro',
                                                  color:
                                                  MyTheme.of(
                                                      context)
                                                      .secondaryText,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(log.timestamp!)),
                                              style: MyTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                color: MyTheme.of(
                                                    context)
                                                    .secondaryText,
                                              ),
                                            ),
                                          ],
                                        ),
                                        // trailing: Text(
                                        //   '${log.duration ?? 0} sec',
                                        //   style: MyTheme.of(context)
                                        //       .bodyMedium,
                                        // ),
                                      ),
                                    ),
                                    Divider(
                                      height: 2,
                                      color:
                                      MyTheme.of(context).accent2,
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 16, 10, 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: MyTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x34090F13),
                        offset: Offset(0.0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '7-Day Call History',
                          style: MyTheme.of(context)
                              .titleMedium
                              .override(
                            fontFamily: 'Readex Pro',
                            color: MyTheme.of(context).primaryText,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: MyTheme.of(context).primaryText,
                        ),
                        const SizedBox(height: 10),
                        if (isLoading) const Center(child: CircularProgressIndicator()) else Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SizedBox(
                            height: 220,
                            child: LineChart(
                              LineChartData(
                                gridData: FlGridData(
                                  show: true,
                                  drawHorizontalLine: true,
                                  getDrawingHorizontalLine: (value) {
                                    return FlLine(
                                      color: const Color(0xff37434d),
                                      strokeWidth: 1,
                                    );
                                  },
                                  drawVerticalLine: true,
                                  getDrawingVerticalLine: (value) {
                                    return FlLine(
                                      color: const Color(0xff37434d),
                                      strokeWidth: 1,
                                    );
                                  },
                                ),
                                titlesData: FlTitlesData(
                                  show: true,
                                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      interval: 1,
                                      getTitlesWidget: (value, meta) {
                                        const days = [
                                          'Mon',
                                          'Tue',
                                          'Wed',
                                          'Thu',
                                          'Fri',
                                          'Sat',
                                          'Sun'
                                        ];
                                        return Padding(
                                          padding: const EdgeInsets.only(top:3),
                                          child: Text(
                                            days[value.toInt()],
                                            style: const TextStyle(
                                              color: Color(0xff68737d),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      interval: 1,
                                      getTitlesWidget: (value, meta) {
                                        if (value == 0) {
                                          return const Text('0', style: TextStyle(
                                              color: Color(0xff67727d),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12));
                                        } else if (value % 5 == 0) {
                                          return Text('${value.toInt()}', style: const TextStyle(
                                              color: Color(0xff67727d),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12));
                                        }
                                        return const Text('');
                                      },
                                      reservedSize: 28,
                                      // margin: 8,
                                    ),
                                  ),
                                ),
                                borderData: FlBorderData(
                                  show: true,
                                  border: Border.all(
                                      color: const Color(0xff37434d),
                                      width: 1),
                                ),
                                minX: 0,
                                maxX: 6,
                                minY: 0,
                                maxY: lineChartData.isNotEmpty
                                    ? (lineChartData
                                    .map((spot) => spot.y)
                                    .reduce((a, b) =>
                                a > b ? a : b) +
                                    2)
                                    .roundToDouble()
                                    : 10,
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: lineChartData,
                                    isCurved: true,
                                    color:Colors.blue,
                                    barWidth: 2,
                                    isStrokeCapRound: true,
                                    dotData: FlDotData(show: false),
                                    belowBarData: BarAreaData(show: false),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
