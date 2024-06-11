import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'download_i_d_widget.dart' show DownloadIDWidget;
import 'package:flutter/material.dart';

class DownloadIDModel extends FlutterFlowModel<DownloadIDWidget> {
  ///  Local state fields for this component.

  int count = 0;

  bool isAll = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<VoterRecord>? newonly;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<VoterRecord>? allvoters;
  // State field(s) for newonly widget.
  bool? newonlyValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
