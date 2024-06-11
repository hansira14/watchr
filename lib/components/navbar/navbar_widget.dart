import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/no_internet/no_internet_widget.dart';
import '/components/voter_checkin/voter_checkin_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({
    super.key,
    int? page,
  }) : page = page ?? 0;

  final int page;

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  late NavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 75.0,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.transparent,
          ),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 0.0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 10.0,
                                color: Color(0x1A57636C),
                                offset: Offset(
                                  0.0,
                                  -10.0,
                                ),
                                spreadRadius: 0.1,
                              )
                            ],
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -0.2),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.space_dashboard_rounded,
                          color: valueOrDefault<Color>(
                            widget.page == 1
                                ? FlutterFlowTheme.of(context).primary
                                : const Color(0xFF9299A1),
                            const Color(0xFF9299A1),
                          ),
                          size: 20.0,
                        ),
                        onPressed: () async {
                          if (valueOrDefault(currentUserDocument?.type, '') ==
                              'Scanner') {
                            context.pushNamed('DashboardScanner');
                          } else {
                            context.pushNamed('DASHBOARD');
                          }

                          await currentUserReference!
                              .update(createUsersRecordData(
                            lastAction: getCurrentTimestamp,
                          ));
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.people_alt_rounded,
                          color: valueOrDefault<Color>(
                            widget.page == 2
                                ? FlutterFlowTheme.of(context).primary
                                : const Color(0xFF9299A1),
                            const Color(0xFF9299A1),
                          ),
                          size: 20.0,
                        ),
                        onPressed: () async {
                          context.pushNamed('Voters');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            lastAction: getCurrentTimestamp,
                          ));
                        },
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, -0.79),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 17.0),
                              child: Container(
                                width: 70.0,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 10.0,
                                          color: Color(0x1A57636C),
                                          offset: Offset(
                                            0.0,
                                            -10.0,
                                          ),
                                          spreadRadius: 0.1,
                                        )
                                      ],
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Builder(
                                      builder: (context) => Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 60.0,
                                          icon: Icon(
                                            FFIcons.kwatchrLogo06,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            final firestoreBatch =
                                                FirebaseFirestore.instance
                                                    .batch();
                                            try {
                                              _model.scanID =
                                                  await FlutterBarcodeScanner
                                                      .scanBarcode(
                                                '#C62828', // scanning line color
                                                'Cancel', // cancel button text
                                                true, // whether to show the flash icon
                                                ScanMode.QR,
                                              );

                                              _model.net = await actions
                                                  .checkInternetConnection();
                                              if (_model.net!) {
                                                FFAppState().pendingscan = 0;
                                                _model.updatePage(() {});

                                                firestoreBatch.update(
                                                    functions
                                                        .getDocumentReference(
                                                            _model.scanID),
                                                    createVoterRecordData(
                                                      hasVoted: true,
                                                      votedTime:
                                                          getCurrentTimestamp,
                                                    ));

                                                firestoreBatch.update(
                                                    currentUserReference!, {
                                                  ...mapToFirestore(
                                                    {
                                                      'scans':
                                                          FieldValue.increment(
                                                              1),
                                                    },
                                                  ),
                                                });
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          const AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child:
                                                          const VoterCheckinWidget(),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              } else {
                                                FFAppState().pendingscan =
                                                    FFAppState().pendingscan +
                                                        1;
                                                _model.updatePage(() {});
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          const AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: const NoInternetWidget(),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));

                                                firestoreBatch.update(
                                                    functions
                                                        .getDocumentReference(
                                                            _model.scanID),
                                                    createVoterRecordData(
                                                      hasVoted: true,
                                                      votedTime:
                                                          getCurrentTimestamp,
                                                    ));

                                                firestoreBatch.update(
                                                    currentUserReference!, {
                                                  ...mapToFirestore(
                                                    {
                                                      'scans':
                                                          FieldValue.increment(
                                                              1),
                                                    },
                                                  ),
                                                });
                                              }

                                              firestoreBatch.update(
                                                  currentUserReference!,
                                                  createUsersRecordData(
                                                    lastAction:
                                                        getCurrentTimestamp,
                                                  ));
                                            } finally {
                                              await firestoreBatch.commit();
                                            }

                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.chat_rounded,
                          color: valueOrDefault<Color>(
                            widget.page == 3
                                ? FlutterFlowTheme.of(context).primary
                                : const Color(0xFF9299A1),
                            const Color(0xFF9299A1),
                          ),
                          size: 20.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(
                            'Chat_All',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );

                          await currentUserReference!
                              .update(createUsersRecordData(
                            lastAction: getCurrentTimestamp,
                          ));
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.settings,
                          color: valueOrDefault<Color>(
                            widget.page == 4
                                ? FlutterFlowTheme.of(context).primary
                                : const Color(0xFF9299A1),
                            const Color(0xFF9299A1),
                          ),
                          size: 20.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(
                            'Settings',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );

                          await currentUserReference!
                              .update(createUsersRecordData(
                            lastAction: getCurrentTimestamp,
                          ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
