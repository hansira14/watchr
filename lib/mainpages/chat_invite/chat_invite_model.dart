import '/flutter_flow/flutter_flow_util.dart';
import 'chat_invite_widget.dart' show ChatInviteWidget;
import 'package:flutter/material.dart';

class ChatInviteModel extends FlutterFlowModel<ChatInviteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
