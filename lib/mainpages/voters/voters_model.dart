import '/backend/backend.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'voters_widget.dart' show VotersWidget;
import 'package:flutter/material.dart';

class VotersModel extends FlutterFlowModel<VotersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SideNav component.
  late SideNavModel sideNavModel;
  bool firestoreRequestCompleted = false;
  String? firestoreRequestLastUniqueKey;
  // State field(s) for searchmobile1 widget.
  FocusNode? searchmobile1FocusNode;
  TextEditingController? searchmobile1TextController;
  String? Function(BuildContext, String?)? searchmobile1TextControllerValidator;
  List<VoterRecord> simpleSearchResults1 = [];
  // State field(s) for searchmobile2 widget.
  FocusNode? searchmobile2FocusNode;
  TextEditingController? searchmobile2TextController;
  String? Function(BuildContext, String?)? searchmobile2TextControllerValidator;
  List<UsersRecord> simpleSearchResults2 = [];
  // State field(s) for barangaymobile widget.
  String? barangaymobileValue;
  FormFieldController<String>? barangaymobileValueController;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for searchweb1 widget.
  FocusNode? searchweb1FocusNode;
  TextEditingController? searchweb1TextController;
  String? Function(BuildContext, String?)? searchweb1TextControllerValidator;
  List<VoterRecord> simpleSearchResults3 = [];
  // State field(s) for barangayweb1 widget.
  String? barangayweb1Value;
  FormFieldController<String>? barangayweb1ValueController;
  // State field(s) for searchweb2 widget.
  FocusNode? searchweb2FocusNode;
  TextEditingController? searchweb2TextController;
  String? Function(BuildContext, String?)? searchweb2TextControllerValidator;
  List<VoterRecord> simpleSearchResults4 = [];
  // State field(s) for barangayweb2 widget.
  String? barangayweb2Value;
  FormFieldController<String>? barangayweb2ValueController;
  // State field(s) for searchweb3 widget.
  FocusNode? searchweb3FocusNode;
  TextEditingController? searchweb3TextController;
  String? Function(BuildContext, String?)? searchweb3TextControllerValidator;
  List<UsersRecord> simpleSearchResults5 = [];
  // Model for NAVBAR component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    searchmobile1FocusNode?.dispose();
    searchmobile1TextController?.dispose();

    searchmobile2FocusNode?.dispose();
    searchmobile2TextController?.dispose();

    tabBarController?.dispose();
    searchweb1FocusNode?.dispose();
    searchweb1TextController?.dispose();

    searchweb2FocusNode?.dispose();
    searchweb2TextController?.dispose();

    searchweb3FocusNode?.dispose();
    searchweb3TextController?.dispose();

    navbarModel.dispose();
  }

  /// Additional helper methods.
  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
