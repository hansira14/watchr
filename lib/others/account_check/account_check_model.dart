import '/flutter_flow/flutter_flow_util.dart';
import 'account_check_widget.dart' show AccountCheckWidget;
import 'package:flutter/material.dart';

class AccountCheckModel extends FlutterFlowModel<AccountCheckWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
