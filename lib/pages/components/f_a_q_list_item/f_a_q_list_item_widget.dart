import 'package:call_info/theme/MyTheme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'f_a_q_list_item_model.dart';
export 'f_a_q_list_item_model.dart';

class FAQListItemWidget extends StatefulWidget {
  const FAQListItemWidget({
    super.key,
    required this.faqTitle,
    required this.faqContent,
  });

  final String? faqTitle;
  final String? faqContent;

  @override
  State<FAQListItemWidget> createState() => _FAQListItemWidgetState();
}

class _FAQListItemWidgetState extends State<FAQListItemWidget> {
  late FAQListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FAQListItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
      child: Material(
        color: Colors.transparent,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.faqTitle,
                    'faqTitle',
                  ),
                  style: GoogleFonts.getFont(
                    'Inter',
                    color: const Color(0xFF14181B),
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.faqContent,
                      'faqContent',
                    ),
                    style: MyTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: const Color(0xFF14181B),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
