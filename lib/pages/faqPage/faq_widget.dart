import 'package:call_info/theme/MyTheme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/pages/components/f_a_q_list_item/f_a_q_list_item_widget.dart';
import 'package:flutter/material.dart';

import 'faq_model.dart';
export 'faq_model.dart';

class FaqWidget extends StatefulWidget {
  const FaqWidget({super.key});

  @override
  State<FaqWidget> createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {
  late FaqModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FaqModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1F4F8),
        appBar: AppBar(
          backgroundColor: MyTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: MyTheme.of(context).primaryText,
              size: 30,
            ),
            onPressed: () async {
              //TODO
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Call Logs',
            style: MyTheme.of(context).titleLarge,
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 16),
                  child: Text(
                    'Frequently Asked Questions',
                    style: MyTheme.of(context).headlineMedium.override(
                      fontFamily: 'Sora',
                      color: Color(0xFF14181B),
                      fontSize: 32,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.fAQListItemModel1,
                  updateCallback: () => setState(() {}),
                  child: FAQListItemWidget(
                    faqTitle: 'How do I log in?',
                    faqContent:
                    'To log in, navigate to the Login page and enter your registered email address and password. If you\'ve forgotten your password, you can reset it by clicking the \'Forgot Password\' link.',
                  ),
                ),
                wrapWithModel(
                  model: _model.fAQListItemModel2,
                  updateCallback: () => setState(() {}),
                  child: FAQListItemWidget(
                    faqTitle: 'How can I edit my profile?',
                    faqContent:
                    'Once logged in, go to the Profile Page and click on the \'Edit Profile\' option. From there, you can update your personal information, profile picture, and other details.',
                  ),
                ),
                wrapWithModel(
                  model: _model.fAQListItemModel3,
                  updateCallback: () => setState(() {}),
                  child: FAQListItemWidget(
                    faqTitle: 'What should I do if I encounter an error?',
                    faqContent:
                    'If you encounter any errors, please try refreshing the page or logging out and logging back in. If the problem persists, you can contact our support team through the \'Support\' option in the app.',
                  ),
                ),
                wrapWithModel(
                  model: _model.fAQListItemModel4,
                  updateCallback: () => setState(() {}),
                  child: FAQListItemWidget(
                    faqTitle: 'How do I deactivate my account?',
                    faqContent:
                    'To deactivate your account, please go to the \'Settings\' section of your Profile Page and select the \'Deactivate Account\' option. Follow the steps provided to confirm the deactivation.',
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
