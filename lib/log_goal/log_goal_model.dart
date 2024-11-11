import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'log_goal_widget.dart' show LogGoalWidget;
import 'package:flutter/material.dart';

class LogGoalModel extends FlutterFlowModel<LogGoalWidget> {
  ///  Local state fields for this page.

  String selectedOption = '\"\"';

  String selectedAction = '\"\"';

  bool isDropDownLocked = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ActionType widget.
  String? actionTypeValue;
  FormFieldController<String>? actionTypeValueController;
  // State field(s) for CarbonActionOptions widget.
  String? carbonActionOptionsValue;
  FormFieldController<String>? carbonActionOptionsValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for WaterActionOptions widget.
  String? waterActionOptionsValue;
  FormFieldController<String>? waterActionOptionsValueController;
  // State field(s) for TimeField widget.
  FocusNode? timeFieldFocusNode;
  TextEditingController? timeFieldTextController;
  String? Function(BuildContext, String?)? timeFieldTextControllerValidator;
  // State field(s) for ElectricityField widget.
  FocusNode? electricityFieldFocusNode;
  TextEditingController? electricityFieldTextController;
  String? Function(BuildContext, String?)?
      electricityFieldTextControllerValidator;
  // State field(s) for WasteField widget.
  FocusNode? wasteFieldFocusNode;
  TextEditingController? wasteFieldTextController;
  String? Function(BuildContext, String?)? wasteFieldTextControllerValidator;
  // State field(s) for LoadsField widget.
  FocusNode? loadsFieldFocusNode;
  TextEditingController? loadsFieldTextController;
  String? Function(BuildContext, String?)? loadsFieldTextControllerValidator;
  // State field(s) for OtherField widget.
  FocusNode? otherFieldFocusNode;
  TextEditingController? otherFieldTextController;
  String? Function(BuildContext, String?)? otherFieldTextControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    timeFieldFocusNode?.dispose();
    timeFieldTextController?.dispose();

    electricityFieldFocusNode?.dispose();
    electricityFieldTextController?.dispose();

    wasteFieldFocusNode?.dispose();
    wasteFieldTextController?.dispose();

    loadsFieldFocusNode?.dispose();
    loadsFieldTextController?.dispose();

    otherFieldFocusNode?.dispose();
    otherFieldTextController?.dispose();
  }
}
