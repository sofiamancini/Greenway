import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/new_goals_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'new_goals_list_model.dart';
export 'new_goals_list_model.dart';

class NewGoalsListWidget extends StatefulWidget {
  const NewGoalsListWidget({super.key});

  @override
  State<NewGoalsListWidget> createState() => _NewGoalsListWidgetState();
}

class _NewGoalsListWidgetState extends State<NewGoalsListWidget> {
  late NewGoalsListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewGoalsListModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'newGoals_List'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<GoalsRecord>>(
      stream: queryGoalsRecord(
        queryBuilder: (goalsRecord) => goalsRecord
            .where(
              'user',
              isEqualTo: currentUserReference,
            )
            .where(
              'deleted',
              isEqualTo: false,
            ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<GoalsRecord> newGoalsListGoalsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: const BoxDecoration(),
                          child: AuthUserStreamWidget(
                            builder: (context) => ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.network(
                                currentUserPhoto,
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Screenshot_6-removebg-preview_2.png',
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Goals',
                      style:
                          FlutterFlowTheme.of(context).displayMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                    ),
                    if ((newGoalsListGoalsRecordList.isNotEmpty) == false)
                      Container(
                        width: double.infinity,
                        height: 138.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFF97B381),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Set your first goal to begin tracking!',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: StreamBuilder<List<GoalsRecord>>(
                            stream: queryGoalsRecord(
                              queryBuilder: (goalsRecord) => goalsRecord
                                  .where(
                                    'user',
                                    isEqualTo: currentUserReference,
                                  )
                                  .where(
                                    'deleted',
                                    isEqualTo: false,
                                  ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<GoalsRecord> listViewGoalsRecordList =
                                  snapshot.data!;

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewGoalsRecordList.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 20.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewGoalsRecord =
                                      listViewGoalsRecordList[listViewIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'NEW_GOALS_LIST_Container_m7q8l2tg_ON_TAP');
                                      logFirebaseEvent('new_goals_navigate_to');

                                      context.pushNamed(
                                        'Main',
                                        queryParameters: {
                                          'goalType': serializeParam(
                                            '',
                                            ParamType.String,
                                          ),
                                          'targetOutput': serializeParam(
                                            '',
                                            ParamType.String,
                                          ),
                                          'timeFrame': serializeParam(
                                            '',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: NewGoalsWidget(
                                      key: Key(
                                          'Keym7q_${listViewIndex}_of_${listViewGoalsRecordList.length}'),
                                      goalsDocument: listViewGoalsRecord,
                                      goalType: listViewGoalsRecord.goalType,
                                      delete: () async {},
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(1.0, 1.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.add,
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'NEW_GOALS_LIST_PAGE_add_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_navigate_to');

                          context.pushNamed('NewGoal');
                        },
                      ),
                    ),
                  ].divide(const SizedBox(height: 25.0)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
