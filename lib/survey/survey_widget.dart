import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'survey_model.dart';
export 'survey_model.dart';

class SurveyWidget extends StatefulWidget {
  const SurveyWidget({super.key});

  @override
  State<SurveyWidget> createState() => _SurveyWidgetState();
}

class _SurveyWidgetState extends State<SurveyWidget> {
  late SurveyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SurveyModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Survey'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(1.0, -1.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('SURVEY_PAGE_Icon_ydp8l5rk_ON_TAP');
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed('Main');
                    },
                    child: Icon(
                      Icons.close_sharp,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                ),
                Text(
                  'Help us improve your experience!',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'How is your experience with our app so far? ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    RatingBar.builder(
                      onRatingUpdate: (newValue) =>
                          safeSetState(() => _model.ratingBarValue = newValue),
                      itemBuilder: (context, index) => const Icon(
                        Icons.star_rounded,
                        color: Color(0xFB6ADA0F),
                      ),
                      direction: Axis.horizontal,
                      initialRating: _model.ratingBarValue ??= 0.0,
                      unratedColor: FlutterFlowTheme.of(context).accent1,
                      itemCount: 5,
                      itemSize: 30.0,
                      glowColor: const Color(0xFB6ADA0F),
                    ),
                  ].divide(const SizedBox(height: 7.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'How likely would you recommend this app to your friend?',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('SURVEY_PAGE_1_BTN_ON_TAP');
                            logFirebaseEvent('Button_update_page_state');
                            _model.rating = 1;
                            safeSetState(() {});
                          },
                          text: '1',
                          options: FFButtonOptions(
                            width: 34.0,
                            height: 35.0,
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: _model.rating.toString() == '1'
                                ? FlutterFlowTheme.of(context).secondaryText
                                : Colors.transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('SURVEY_PAGE_2_BTN_ON_TAP');
                            logFirebaseEvent('Button_update_page_state');
                            _model.rating = 2;
                            safeSetState(() {});
                          },
                          text: '2',
                          options: FFButtonOptions(
                            width: 34.0,
                            height: 35.0,
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: _model.rating.toString() == '2'
                                ? FlutterFlowTheme.of(context).secondaryText
                                : Colors.transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('SURVEY_PAGE_3_BTN_ON_TAP');
                            logFirebaseEvent('Button_update_page_state');
                            _model.rating = 3;
                            safeSetState(() {});
                          },
                          text: '3',
                          options: FFButtonOptions(
                            width: 34.0,
                            height: 35.0,
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: _model.rating.toString() == '3'
                                ? FlutterFlowTheme.of(context).secondaryText
                                : Colors.transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('SURVEY_PAGE_4_BTN_ON_TAP');
                            logFirebaseEvent('Button_update_page_state');
                            _model.rating = 4;
                            safeSetState(() {});
                          },
                          text: '4',
                          options: FFButtonOptions(
                            width: 34.0,
                            height: 35.0,
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: _model.rating.toString() == '4'
                                ? FlutterFlowTheme.of(context).secondaryText
                                : Colors.transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('SURVEY_PAGE_5_BTN_ON_TAP');
                            logFirebaseEvent('Button_update_page_state');
                            _model.rating = 5;
                            safeSetState(() {});
                          },
                          text: '5',
                          options: FFButtonOptions(
                            width: 34.0,
                            height: 35.0,
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: _model.rating.toString() == '5'
                                ? FlutterFlowTheme.of(context).secondaryText
                                : Colors.transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('SURVEY_PAGE_6_BTN_ON_TAP');
                            logFirebaseEvent('Button_update_page_state');
                            _model.rating = 6;
                            safeSetState(() {});
                          },
                          text: '6',
                          options: FFButtonOptions(
                            width: 34.0,
                            height: 35.0,
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: _model.rating.toString() == '6'
                                ? FlutterFlowTheme.of(context).secondaryText
                                : Colors.transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('SURVEY_PAGE_7_BTN_ON_TAP');
                            logFirebaseEvent('Button_update_page_state');
                            _model.rating = 7;
                            safeSetState(() {});
                          },
                          text: '7',
                          options: FFButtonOptions(
                            width: 34.0,
                            height: 35.0,
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: _model.rating.toString() == '7'
                                ? FlutterFlowTheme.of(context).secondaryText
                                : Colors.transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('SURVEY_PAGE_8_BTN_ON_TAP');
                            logFirebaseEvent('Button_update_page_state');
                            _model.rating = 8;
                            safeSetState(() {});
                          },
                          text: '8',
                          options: FFButtonOptions(
                            width: 34.0,
                            height: 35.0,
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: _model.rating.toString() == '8'
                                ? FlutterFlowTheme.of(context).secondaryText
                                : Colors.transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('SURVEY_PAGE_9_BTN_ON_TAP');
                            logFirebaseEvent('Button_update_page_state');
                            _model.rating = 9;
                            safeSetState(() {});
                          },
                          text: '9',
                          options: FFButtonOptions(
                            width: 34.0,
                            height: 35.0,
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: _model.rating.toString() == '9'
                                ? FlutterFlowTheme.of(context).secondaryText
                                : Colors.transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('SURVEY_PAGE_10_BTN_ON_TAP');
                            logFirebaseEvent('Button_update_page_state');
                            _model.rating = 10;
                            safeSetState(() {});
                          },
                          text: '10',
                          options: FFButtonOptions(
                            width: 34.0,
                            height: 35.0,
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: _model.rating.toString() == '10'
                                ? FlutterFlowTheme.of(context).secondaryText
                                : Colors.transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ],
                    ),
                  ].divide(const SizedBox(height: 10.0)),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('SURVEY_PAGE_SUBMIT_BTN_ON_TAP');
                      logFirebaseEvent('Button_backend_call');

                      await currentUserReference!.update(createUsersRecordData(
                        satisfactionRating: _model.ratingBarValue?.round(),
                        recommendationRating: _model.rating,
                        email: '',
                      ));
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('newGoals_List');
                    },
                    text: 'Submit',
                    options: FFButtonOptions(
                      width: 200.0,
                      height: 38.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFF97B381),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter Tight',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                      elevation: 5.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryText,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 30.0)),
            ),
          ),
        ),
      ),
    );
  }
}
