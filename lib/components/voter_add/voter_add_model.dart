import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'voter_add_widget.dart' show VoterAddWidget;
import 'package:flutter/material.dart';

class VoterAddModel extends FlutterFlowModel<VoterAddWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for sitio widget.
  FocusNode? sitioFocusNode1;
  TextEditingController? sitioTextController1;
  String? Function(BuildContext, String?)? sitioTextController1Validator;
  // State field(s) for sitio widget.
  FocusNode? sitioFocusNode2;
  TextEditingController? sitioTextController2;
  String? Function(BuildContext, String?)? sitioTextController2Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode1;
  TextEditingController? yourNameTextController1;
  String? Function(BuildContext, String?)? yourNameTextController1Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode2;
  TextEditingController? yourNameTextController2;
  String? Function(BuildContext, String?)? yourNameTextController2Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode3;
  TextEditingController? yourNameTextController3;
  String? Function(BuildContext, String?)? yourNameTextController3Validator;
  // State field(s) for sitio widget.
  FocusNode? sitioFocusNode3;
  TextEditingController? sitioTextController3;
  String? Function(BuildContext, String?)? sitioTextController3Validator;
  // State field(s) for precinct widget.
  String? precinctValue;
  FormFieldController<String>? precinctValueController;
  // State field(s) for status widget.
  String? statusValue;
  FormFieldController<String>? statusValueController;
  // State field(s) for barangay widget.
  String? barangayValue;
  FormFieldController<String>? barangayValueController;
  // State field(s) for partylist widget.
  String? partylistValue;
  FormFieldController<String>? partylistValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    sitioFocusNode1?.dispose();
    sitioTextController1?.dispose();

    sitioFocusNode2?.dispose();
    sitioTextController2?.dispose();

    yourNameFocusNode1?.dispose();
    yourNameTextController1?.dispose();

    yourNameFocusNode2?.dispose();
    yourNameTextController2?.dispose();

    yourNameFocusNode3?.dispose();
    yourNameTextController3?.dispose();

    sitioFocusNode3?.dispose();
    sitioTextController3?.dispose();
  }
}
