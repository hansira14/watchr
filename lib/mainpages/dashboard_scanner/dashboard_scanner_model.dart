import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dashboard_scanner_widget.dart' show DashboardScannerWidget;
import 'package:flutter/material.dart';

class DashboardScannerModel extends FlutterFlowModel<DashboardScannerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - checkInternetConnection] action in Icon widget.
  bool? net;
  // Model for NAVBAR component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navbarModel.dispose();
  }
}
