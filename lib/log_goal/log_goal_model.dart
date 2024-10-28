import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'log_goal_widget.dart' show LogGoalWidget;
import 'package:flutter/material.dart';

class LogGoalModel extends FlutterFlowModel<LogGoalWidget> {
  ///  Local state fields for this page.

  String selectedOption = '\"\"';

  ///  State fields for stateful widgets in this page.

  // State field(s) for ActionOptions widget.
  String? actionOptionsValue;
  FormFieldController<String>? actionOptionsValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TimeField widget.
  FocusNode? timeFieldFocusNode;
  TextEditingController? timeFieldTextController;
  String? Function(BuildContext, String?)? timeFieldTextControllerValidator;
  // State field(s) for IntensityDropDown widget.
  String? intensityDropDownValue;
  FormFieldController<String>? intensityDropDownValueController;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    timeFieldFocusNode?.dispose();
    timeFieldTextController?.dispose();
  }
}
