import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'new_goals_model.dart';
export 'new_goals_model.dart';

class NewGoalsWidget extends StatefulWidget {
  const NewGoalsWidget({
    super.key,
    required this.delete,
    required this.goalsDocument,
    required this.goalType,
  });

  final Future Function()? delete;
  final GoalsRecord? goalsDocument;
  final String? goalType;

  @override
  State<NewGoalsWidget> createState() => _NewGoalsWidgetState();
}

class _NewGoalsWidgetState extends State<NewGoalsWidget> {
  late NewGoalsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewGoalsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 356.0,
      height: 41.0,
      decoration: const BoxDecoration(
        color: Color(0xFF97B381),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              5.0,
            ),
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 130.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget.goalsDocument?.goalType,
                  '\"\"',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.edit,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('NEW_GOALS_COMP_edit_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_navigate_to');

                    context.pushNamed(
                      'EditGoal',
                      queryParameters: {
                        'goalsDocument': serializeParam(
                          widget.goalsDocument?.reference,
                          ParamType.DocumentReference,
                        ),
                        'goalType': serializeParam(
                          valueOrDefault<String>(
                            widget.goalsDocument?.goalType,
                            '\"\"',
                          ),
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  },
                ),
                FlutterFlowIconButton(
                  borderRadius: 8.0,
                  borderWidth: 2.0,
                  buttonSize: 40.0,
                  icon: FaIcon(
                    FontAwesomeIcons.trash,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('NEW_GOALS_COMP_trash_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_alert_dialog');
                    var confirmDialogResponse = await showDialog<bool>(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('Delete'),
                              content: const Text(
                                  'Are you sure you want to delete this goal?'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, false),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, true),
                                  child: const Text('Confirm'),
                                ),
                              ],
                            );
                          },
                        ) ??
                        false;
                    logFirebaseEvent('IconButton_backend_call');
                    await widget.goalsDocument!.reference.delete();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
