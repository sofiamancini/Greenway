import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/main_blank_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'main_model.dart';
export 'main_model.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({
    super.key,
    String? goalType,
    String? targetOutput,
    String? timeFrame,
  })  : goalType = goalType ?? 'Goal',
        targetOutput = targetOutput ?? '100',
        timeFrame = timeFrame ?? 'daily';

  final String goalType;
  final String targetOutput;
  final String timeFrame;

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  late MainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Main'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MAIN_PAGE_Main_ON_INIT_STATE');
      logFirebaseEvent('Main_update_page_state');
      _model.goalType = _model.goalType;
      safeSetState(() {});
    });

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
        queryBuilder: (goalsRecord) => goalsRecord.where(Filter.or(
          Filter(
            'user',
            isEqualTo: currentUserReference,
          ),
          Filter(
            'deleted',
            isEqualTo: false,
          ),
        )),
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
        List<GoalsRecord> mainGoalsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Container(
                height: double.infinity,
                decoration: const BoxDecoration(),
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
                    List<GoalsRecord> pageViewGoalsRecordList = snapshot.data!;

                    return SizedBox(
                      width: double.infinity,
                      height: 813.0,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 40.0),
                            child: PageView.builder(
                              controller: _model.pageViewController ??=
                                  PageController(
                                      initialPage: max(
                                          0,
                                          min(
                                              0,
                                              pageViewGoalsRecordList.length -
                                                  1))),
                              scrollDirection: Axis.horizontal,
                              itemCount: pageViewGoalsRecordList.length,
                              itemBuilder: (context, pageViewIndex) {
                                final pageViewGoalsRecord =
                                    pageViewGoalsRecordList[pageViewIndex];
                                return MainBlankWidget(
                                  key: Key(
                                      'Key772_${pageViewIndex}_of_${pageViewGoalsRecordList.length}'),
                                  goalType: pageViewGoalsRecord.goalType,
                                  targetOutput:
                                      pageViewGoalsRecord.targetOutput,
                                  timeFrame: pageViewGoalsRecord.timeFrame,
                                  goalsDocument: pageViewGoalsRecord,
                                );
                              },
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: smooth_page_indicator.SmoothPageIndicator(
                                controller: _model.pageViewController ??=
                                    PageController(
                                        initialPage: max(
                                            0,
                                            min(
                                                0,
                                                pageViewGoalsRecordList.length -
                                                    1))),
                                count: pageViewGoalsRecordList.length,
                                axisDirection: Axis.horizontal,
                                onDotClicked: (i) async {
                                  await _model.pageViewController!
                                      .animateToPage(
                                    i,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                  safeSetState(() {});
                                },
                                effect: smooth_page_indicator.SlideEffect(
                                  spacing: 8.0,
                                  radius: 8.0,
                                  dotWidth: 8.0,
                                  dotHeight: 8.0,
                                  dotColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  activeDotColor:
                                      FlutterFlowTheme.of(context).primary,
                                  paintStyle: PaintingStyle.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
