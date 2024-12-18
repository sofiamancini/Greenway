import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'scanner_main_widget.dart' show ScannerMainWidget;
import 'package:flutter/material.dart';

class ScannerMainModel extends FlutterFlowModel<ScannerMainWidget> {
  ///  Local state fields for this page.

  DateTime? time;

  ///  State fields for stateful widgets in this page.

  var productnum = '';
  // Stores action output result for [Backend Call - API (OpenFoodFacts)] action in Button widget.
  ApiCallResponse? apiResultezv;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ItemsRecord? record;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
