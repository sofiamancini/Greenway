import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/scanner/scanned_item/scanned_item_widget.dart';
import 'package:flutter/material.dart';
import 'deleted_items_model.dart';
export 'deleted_items_model.dart';

class DeletedItemsWidget extends StatefulWidget {
  const DeletedItemsWidget({super.key});

  @override
  State<DeletedItemsWidget> createState() => _DeletedItemsWidgetState();
}

class _DeletedItemsWidgetState extends State<DeletedItemsWidget> {
  late DeletedItemsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeletedItemsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'deleted_items'});
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
            padding: const EdgeInsets.all(8.0),
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
                    'Deleted Items',
                    style: FlutterFlowTheme.of(context).displayMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
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
                            isEqualTo: true,
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
                                  'DELETED_ITEMS_Container_kol2w5zi_ON_TAP');
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
                                  'Keykol_${listViewIndex}_of_${listViewItemsRecordList.length}'),
                              items: listViewItemsRecord,
                              delete: () async {
                                logFirebaseEvent(
                                    'DELETED_ITEMS_Container_kol2w5zi_CALLBAC');
                                logFirebaseEvent('scanned_item_backend_call');

                                await listViewItemsRecord.reference
                                    .update(createItemsRecordData(
                                  deleted: false,
                                ));
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ].divide(const SizedBox(height: 25.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
