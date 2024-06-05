import 'package:app/main.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'vendor_item_model.dart';
export 'vendor_item_model.dart';

class VendorItemWidget extends StatefulWidget {
  const VendorItemWidget({
    super.key,
    required this.id,
    required this.value
  });

  final String id;
  final Map<String,dynamic> value;


  @override
  State<VendorItemWidget> createState() => _VendorItemWidgetState();
}

class _VendorItemWidgetState extends State<VendorItemWidget> {
  late VendorItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VendorItemModel());
    // initDetails();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder(
  //     future: _model.getDetails(widget.id!),
  //     builder: (context, snapshot) {
  //       if(snapshot.connectionState == ConnectionState.done) {
  //         return Padding(
  //           padding: const EdgeInsets.all(8),
  //           child: Row(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsetsDirectional.fromSTEB(1, 1, 1, 1),
  //                 child: ClipRRect(
  //                   borderRadius: BorderRadius.circular(6),
  //                   child: Image.network(
  //                     // 'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
  //                     _model.image,
  //                     width: 80,
  //                     height: 80,
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //               ),
  //               Expanded(
  //                 child: Padding(
  //                   padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 4, 0),
  //                   child: Column(
  //                     mainAxisSize: MainAxisSize.max,
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         _model.name,
  //                         style: GoogleFonts.getFont(
  //                           'Outfit',
  //                           color: const Color(0xFF0F1113),
  //                           fontWeight: FontWeight.normal,
  //                           fontSize: 20,
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 8, 0),
  //                         child: AutoSizeText(
  //                           _model.phone,
  //                           textAlign: TextAlign.start,
  //                           style: GoogleFonts.getFont(
  //                             'Plus Jakarta Sans',
  //                             color: const Color(0xFF57636C),
  //                             fontWeight: FontWeight.w500,
  //                             fontSize: 14,
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               Column(
  //                 mainAxisSize: MainAxisSize.max,
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 crossAxisAlignment: CrossAxisAlignment.end,
  //                 children: [
  //                   const Padding(
  //                     padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
  //                     child: Icon(
  //                       Icons.chevron_right_rounded,
  //                       color: Color(0xFF57636C),
  //                       size: 24,
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 4, 8),
  //                     child: Text(
  //                       'Subscription',
  //                       textAlign: TextAlign.end,
  //                       style: GoogleFonts.getFont(
  //                         'Plus Jakarta Sans',
  //                         color: widget.id == 'true'
  //                             ? FlutterFlowTheme.of(context).success
  //                             : FlutterFlowTheme.of(context).warning,
  //                         fontWeight: FontWeight.w500,
  //                         fontSize: 14,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ].addToStart(const SizedBox(width: 5)),
  //           ),
  //         );
  //       }
  //       return Container();
  //     }
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // debugPrint(widget.value.toString());
    return InkWell(
      onTap: () {
        debugPrint("Tapped on ${widget.id}");
        navigator.currentState!.pushNamed(RouteKeys.vendorDetails, arguments: widget.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(1, 1, 1, 1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/placeholder_image.jpg', // Ensure you have a placeholder image in your assets
                  image: widget.value["Profile"]?["imageFile"] ??
                      'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  fadeInDuration: const Duration(milliseconds: 500),
                  fadeOutDuration: const Duration(milliseconds: 500),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 4, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.value["Profile"]["businessName"]?? 'Vendor Name',
                      style: GoogleFonts.getFont(
                        'Outfit',
                        color: const Color(0xFF0F1113),
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 8, 0),
                      child: AutoSizeText(
                        widget.value["Profile"]["vendorContact"] ?? 'Vendor Phone',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.getFont(
                          'Plus Jakarta Sans',
                          color: const Color(0xFF57636C),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: Icon(
                    Icons.chevron_right_rounded,
                    color: Color(0xFF57636C),
                    size: 24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 4, 8),
                  child: Text(
                    'Subscription',
                    textAlign: TextAlign.end,
                    style: GoogleFonts.getFont(
                      'Plus Jakarta Sans',
                      color: widget.id == 'true'
                          ? FlutterFlowTheme.of(context).success
                          : FlutterFlowTheme.of(context).warning,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ].addToStart(const SizedBox(width: 5)),
        ),
      ),
    );
  }
}
