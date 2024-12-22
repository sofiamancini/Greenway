import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'scanned_item_model.dart';
export 'scanned_item_model.dart';

class ScannedItemWidget extends StatefulWidget {
  const ScannedItemWidget({
    super.key,
    required this.items,
    required this.delete,
  });

  final ItemsRecord? items;
  final Future Function()? delete;

  @override
  State<ScannedItemWidget> createState() => _ScannedItemWidgetState();
}

class _ScannedItemWidgetState extends State<ScannedItemWidget> {
  late ScannedItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScannedItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: 356.0,
        height: 41.0,
        decoration: BoxDecoration(
          color: const Color(0xFF97B381),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                5.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              constraints: const BoxConstraints(
                maxWidth: 325.0,
              ),
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.items?.itemName,
                    'Unknown item',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
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
                logFirebaseEvent('SCANNED_ITEM_COMP_trash_ICN_ON_TAP');
                if (widget.items?.deleted == true) {
                  logFirebaseEvent('IconButton_backend_call');
                  await widget.items!.reference.delete();
                } else {
                  logFirebaseEvent('IconButton_execute_callback');
                  await widget.delete?.call();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
