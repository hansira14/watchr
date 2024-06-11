import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bargraph_widget.dart' show BargraphWidget;
import 'package:flutter/material.dart';

class BargraphModel extends FlutterFlowModel<BargraphWidget> {
  ///  Local state fields for this page.

  bool refresh = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SideNav component.
  late SideNavModel sideNavModel;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
  }
}
