import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'voter_edit_widget.dart' show VoterEditWidget;
import 'package:flutter/material.dart';

class VoterEditModel extends FlutterFlowModel<VoterEditWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for seq widget.
  FocusNode? seqFocusNode;
  TextEditingController? seqTextController;
  String? Function(BuildContext, String?)? seqTextControllerValidator;
  // State field(s) for code widget.
  FocusNode? codeFocusNode;
  TextEditingController? codeTextController;
  String? Function(BuildContext, String?)? codeTextControllerValidator;
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
  FocusNode? sitioFocusNode;
  TextEditingController? sitioTextController;
  String? Function(BuildContext, String?)? sitioTextControllerValidator;
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
    seqFocusNode?.dispose();
    seqTextController?.dispose();

    codeFocusNode?.dispose();
    codeTextController?.dispose();

    yourNameFocusNode1?.dispose();
    yourNameTextController1?.dispose();

    yourNameFocusNode2?.dispose();
    yourNameTextController2?.dispose();

    yourNameFocusNode3?.dispose();
    yourNameTextController3?.dispose();

    sitioFocusNode?.dispose();
    sitioTextController?.dispose();
  }
}
