import '/flutter_flow/flutter_flow_util.dart';
import 'forgotpass_widget.dart' show ForgotpassWidget;
import 'package:flutter/material.dart';

class ForgotpassModel extends FlutterFlowModel<ForgotpassWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
