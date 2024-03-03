import 'package:call_info/theme/MyTheme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

import 'package:flutter/material.dart';

import 'social_media_icon_model.dart';
export 'social_media_icon_model.dart';

class SocialMediaIconWidget extends StatefulWidget {
  const SocialMediaIconWidget({
    super.key,
    required this.iconName,
    this.iconAction,
  });

  final Widget? iconName;
  final Future Function()? iconAction;

  @override
  State<SocialMediaIconWidget> createState() => _SocialMediaIconWidgetState();
}

class _SocialMediaIconWidgetState extends State<SocialMediaIconWidget> {
  late SocialMediaIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialMediaIconModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowIconButton(
      borderColor: MyTheme.of(context).alternate,
      borderRadius: 12,
      borderWidth: 1,
      buttonSize: 48,
      fillColor: MyTheme.of(context).secondaryBackground,
      icon: widget.iconName!,
      onPressed: () async {
        // TODO: await launchURL('');
      },
    );
  }
}
