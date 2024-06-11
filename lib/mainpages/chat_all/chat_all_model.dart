import '/components/navbar/navbar_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_all_widget.dart' show ChatAllWidget;
import 'package:flutter/material.dart';

class ChatAllModel extends FlutterFlowModel<ChatAllWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NAVBAR component.
  late NavbarModel navbarModel;
  // Model for SideNav component.
  late SideNavModel sideNavModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
    sideNavModel.dispose();
  }
}
