import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_goal_widget.dart' show EditGoalWidget;
import 'package:flutter/material.dart';

class EditGoalModel extends FlutterFlowModel<EditGoalWidget> {
  ///  Local state fields for this page.

  bool editingMode = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for CarbonGoal widget.
  String? carbonGoalValue;
  FormFieldController<String>? carbonGoalValueController;
  // State field(s) for Frequency widget.
  String? frequencyValue;
  FormFieldController<String>? frequencyValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
