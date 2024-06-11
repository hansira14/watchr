import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'download_i_d_model.dart';
export 'download_i_d_model.dart';

class DownloadIDWidget extends StatefulWidget {
  const DownloadIDWidget({
    super.key,
    required this.all,
    required this.neww,
  });

  final int? all;
  final int? neww;

  @override
  State<DownloadIDWidget> createState() => _DownloadIDWidgetState();
}

class _DownloadIDWidgetState extends State<DownloadIDWidget> {
  late DownloadIDModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DownloadIDModel());

    _model.newonlyValue = true;
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 450.0,
          height: 250.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_left,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Download IDs',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Open Sans',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            _model.count.toString(),
                            '0',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Open Sans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          '/',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Open Sans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        if (_model.isAll)
                          Text(
                            valueOrDefault<String>(
                              widget.all?.toString(),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Open Sans',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        if (!_model.isAll)
                          Text(
                            valueOrDefault<String>(
                              widget.neww?.toString(),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Open Sans',
                                  letterSpacing: 0.0,
                                ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      final firestoreBatch = FirebaseFirestore.instance.batch();
                      try {
                        _model.count = 0;
                        if (_model.newonlyValue!) {
                          _model.newonly = await queryVoterRecordOnce(
                            queryBuilder: (voterRecord) => voterRecord
                                .where(
                                  'generatedID',
                                  isNotEqualTo: true,
                                )
                                .where(
                                  'affiliation',
                                  isEqualTo: 'Hugpong',
                                ),
                          );
                          while (_model.count < _model.newonly!.length) {
                            await actions.generatedIDweb(
                              _model.newonly![_model.count].lname,
                              _model.newonly![_model.count].fname,
                              _model.newonly![_model.count].reference.id,
                              _model.newonly![_model.count].voterprecinct,
                              _model.newonly![_model.count].voterbarangay,
                              _model.newonly![_model.count].seqno,
                            );

                            firestoreBatch.update(
                                _model.newonly![_model.count].reference,
                                createVoterRecordData(
                                  generatedID: true,
                                ));
                            _model.count = _model.count + 1;
                            setState(() {});
                          }
                        } else {
                          _model.allvoters = await queryVoterRecordOnce(
                            queryBuilder: (voterRecord) => voterRecord.where(
                              'affiliation',
                              isEqualTo: 'Hugpong',
                            ),
                          );
                          while (_model.count < _model.allvoters!.length) {
                            await actions.generatedIDweb(
                              _model.allvoters![_model.count].lname,
                              _model.allvoters![_model.count].fname,
                              _model.allvoters![_model.count].reference.id,
                              _model.allvoters![_model.count].voterprecinct,
                              _model.allvoters![_model.count].voterbarangay,
                              _model.allvoters![_model.count].seqno,
                            );

                            firestoreBatch.update(
                                _model.allvoters![_model.count].reference,
                                createVoterRecordData(
                                  generatedID: true,
                                ));
                            _model.count = _model.count + 1;
                            setState(() {});
                          }
                        }
                      } finally {
                        await firestoreBatch.commit();
                      }

                      setState(() {});
                    },
                    text: 'Start',
                    options: FFButtonOptions(
                      width: 330.0,
                      height: 43.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Open Sans',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(60.0, 15.0, 60.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New members only',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Open Sans',
                                    color: const Color(0xB2100F0F),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Switch.adaptive(
                          value: _model.newonlyValue!,
                          onChanged: (newValue) async {
                            setState(() => _model.newonlyValue = newValue);
                            if (newValue) {
                              _model.isAll = false;
                              setState(() {});
                            } else {
                              _model.isAll = true;
                              setState(() {});
                            }
                          },
                          activeColor: FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).accent1,
                          inactiveTrackColor: const Color(0x41100F0F),
                          inactiveThumbColor: const Color(0xAFA44849),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: 100.0,
                height: 9.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
