import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'new_goal_widget.dart' show NewGoalWidget;
import 'package:flutter/material.dart';

class NewGoalModel extends FlutterFlowModel<NewGoalWidget> {
  ///  Local state fields for this page.

  String selectedOption = '\"\"';

  String goalType = 'Action';

  ///  State fields for stateful widgets in this page.

  // State field(s) for AddAction widget.
  String? addActionValue;
  FormFieldController<String>? addActionValueController;
  // State field(s) for EtcField widget.
  FocusNode? etcFieldFocusNode;
  TextEditingController? etcFieldTextController;
  String? Function(BuildContext, String?)? etcFieldTextControllerValidator;
  // State field(s) for CarbonGoal widget.
  String? carbonGoalValue;
  FormFieldController<String>? carbonGoalValueController;
  // State field(s) for Frequency widget.
  String? frequencyValue;
  FormFieldController<String>? frequencyValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    etcFieldFocusNode?.dispose();
    etcFieldTextController?.dispose();
  }
}
