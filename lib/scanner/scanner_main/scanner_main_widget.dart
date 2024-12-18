import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/scanner/scanned_item/scanned_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'scanner_main_model.dart';
export 'scanner_main_model.dart';

class ScannerMainWidget extends StatefulWidget {
  const ScannerMainWidget({super.key});

  @override
  State<ScannerMainWidget> createState() => _ScannerMainWidgetState();
}

class _ScannerMainWidgetState extends State<ScannerMainWidget> {
  late ScannerMainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScannerMainModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'scanner_main'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ItemsRecord>>(
      stream: queryItemsRecord(
        queryBuilder: (itemsRecord) => itemsRecord
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
        List<ItemsRecord> scannerMainItemsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
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
                        'Items',
                        style:
                            FlutterFlowTheme.of(context).displayMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                      ),
                      if ((scannerMainItemsRecordList.isNotEmpty) == false)
                        Container(
                          width: double.infinity,
                          height: 138.0,
                          decoration: BoxDecoration(
                            color: const Color(0x9997B381),
                            borderRadius: BorderRadius.circular(16.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Text(
                                  'You Haven’t Scanned Anything Yet!',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                              ),
                              Text(
                                'Scanned Items Go Here.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ].divide(const SizedBox(height: 10.0)),
                          ),
                        ),
                      StreamBuilder<List<ItemsRecord>>(
                        stream: queryItemsRecord(
                          queryBuilder: (itemsRecord) => itemsRecord
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
                          List<ItemsRecord> listViewItemsRecordList =
                              snapshot.data!;

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewItemsRecordList.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 20.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewItemsRecord =
                                  listViewItemsRecordList[listViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'SCANNER_MAIN_Container_0t0ldke3_ON_TAP');
                                  logFirebaseEvent('scanned_item_navigate_to');

                                  context.pushNamed(
                                    'Detail_page',
                                    queryParameters: {
                                      'itemdetail': serializeParam(
                                        listViewItemsRecord,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'itemdetail': listViewItemsRecord,
                                    },
                                  );
                                },
                                child: ScannedItemWidget(
                                  key: Key(
                                      'Key0t0_${listViewIndex}_of_${listViewItemsRecordList.length}'),
                                  items: listViewItemsRecord,
                                  delete: () async {
                                    logFirebaseEvent(
                                        'SCANNER_MAIN_Container_0t0ldke3_CALLBACK');
                                    logFirebaseEvent(
                                        'scanned_item_backend_call');

                                    await listViewItemsRecord.reference
                                        .update(createItemsRecordData(
                                      deleted: true,
                                    ));
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'SCANNER_MAIN_PAGE_SCAN_BTN_ON_TAP');
                            var shouldSetState = false;
                            logFirebaseEvent('Button_scan_barcode_q_r_code');
                            _model.productnum =
                                await FlutterBarcodeScanner.scanBarcode(
                              '#C62828', // scanning line color
                              'Cancel', // cancel button text
                              true, // whether to show the flash icon
                              ScanMode.BARCODE,
                            );

                            shouldSetState = true;
                            if (_model.productnum != '-1') {
                              logFirebaseEvent('Button_backend_call');
                              _model.apiResultezv =
                                  await OpenFoodFactsCall.call(
                                productnum: _model.productnum,
                              );

                              shouldSetState = true;
                              if ((_model.apiResultezv?.succeeded ?? true)) {
                                logFirebaseEvent('Button_backend_call');

                                var itemsRecordReference =
                                    ItemsRecord.collection.doc();
                                await itemsRecordReference
                                    .set(createItemsRecordData(
                                  itemName: (OpenFoodFactsCall.name(
                                                (_model.apiResultezv
                                                        ?.jsonBody ??
                                                    ''),
                                              ) ==
                                              '') ||
                                          (OpenFoodFactsCall.name(
                                                (_model.apiResultezv
                                                        ?.jsonBody ??
                                                    ''),
                                              ) ==
                                              'null') ||
                                          (OpenFoodFactsCall.name(
                                                (_model.apiResultezv
                                                        ?.jsonBody ??
                                                    ''),
                                              ) ==
                                              '\"\"')
                                      ? OpenFoodFactsCall.altname(
                                          (_model.apiResultezv?.jsonBody ?? ''),
                                        )
                                      : OpenFoodFactsCall.name(
                                          (_model.apiResultezv?.jsonBody ?? ''),
                                        ),
                                  scannedTime: getCurrentTimestamp,
                                  user: currentUserReference,
                                  deleted: false,
                                  image: OpenFoodFactsCall.image(
                                    (_model.apiResultezv?.jsonBody ?? ''),
                                  ),
                                  ecoScore: OpenFoodFactsCall.ecoscore(
                                            (_model.apiResultezv?.jsonBody ??
                                                ''),
                                          ).toString() ==
                                          'null'
                                      ? null
                                      : OpenFoodFactsCall.ecoscore(
                                          (_model.apiResultezv?.jsonBody ?? ''),
                                        )?.toString(),
                                  nova: OpenFoodFactsCall.novascore(
                                            (_model.apiResultezv?.jsonBody ??
                                                ''),
                                          ) ==
                                          'null'
                                      ? null
                                      : OpenFoodFactsCall.novascore(
                                          (_model.apiResultezv?.jsonBody ?? ''),
                                        ),
                                  nutrition: OpenFoodFactsCall.nutriscore(
                                    (_model.apiResultezv?.jsonBody ?? ''),
                                  ),
                                ));
                                _model.record = ItemsRecord.getDocumentFromData(
                                    createItemsRecordData(
                                      itemName: (OpenFoodFactsCall.name(
                                                    (_model.apiResultezv
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) ==
                                                  '') ||
                                              (OpenFoodFactsCall.name(
                                                    (_model.apiResultezv
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) ==
                                                  'null') ||
                                              (OpenFoodFactsCall.name(
                                                    (_model.apiResultezv
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) ==
                                                  '\"\"')
                                          ? OpenFoodFactsCall.altname(
                                              (_model.apiResultezv?.jsonBody ??
                                                  ''),
                                            )
                                          : OpenFoodFactsCall.name(
                                              (_model.apiResultezv?.jsonBody ??
                                                  ''),
                                            ),
                                      scannedTime: getCurrentTimestamp,
                                      user: currentUserReference,
                                      deleted: false,
                                      image: OpenFoodFactsCall.image(
                                        (_model.apiResultezv?.jsonBody ?? ''),
                                      ),
                                      ecoScore: OpenFoodFactsCall.ecoscore(
                                                (_model.apiResultezv
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString() ==
                                              'null'
                                          ? null
                                          : OpenFoodFactsCall.ecoscore(
                                              (_model.apiResultezv?.jsonBody ??
                                                  ''),
                                            )?.toString(),
                                      nova: OpenFoodFactsCall.novascore(
                                                (_model.apiResultezv
                                                        ?.jsonBody ??
                                                    ''),
                                              ) ==
                                              'null'
                                          ? null
                                          : OpenFoodFactsCall.novascore(
                                              (_model.apiResultezv?.jsonBody ??
                                                  ''),
                                            ),
                                      nutrition: OpenFoodFactsCall.nutriscore(
                                        (_model.apiResultezv?.jsonBody ?? ''),
                                      ),
                                    ),
                                    itemsRecordReference);
                                shouldSetState = true;
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'Detail_page',
                                  queryParameters: {
                                    'itemdetail': serializeParam(
                                      _model.record,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'itemdetail': _model.record,
                                  },
                                );
                              } else {
                                logFirebaseEvent('Button_show_snack_bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Error: Unable to find the product!',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                              }

                              if (shouldSetState) safeSetState(() {});
                              return;
                            } else {
                              if (shouldSetState) safeSetState(() {});
                              return;
                            }

                            if (shouldSetState) safeSetState(() {});
                          },
                          text: 'Scan',
                          options: FFButtonOptions(
                            width: 200.0,
                            height: 57.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF97B381),
                            textStyle: FlutterFlowTheme.of(context)
                                .displayMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            elevation: 5.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(height: 25.0)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
