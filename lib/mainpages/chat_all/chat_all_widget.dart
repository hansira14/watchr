import '/components/navbar/navbar_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_all_model.dart';
export 'chat_all_model.dart';

class ChatAllWidget extends StatefulWidget {
  const ChatAllWidget({super.key});

  @override
  State<ChatAllWidget> createState() => _ChatAllWidgetState();
}

class _ChatAllWidgetState extends State<ChatAllWidget> {
  late ChatAllModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatAllModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            ))
              Expanded(
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 20.0, 10.0, 10.0),
                          child: Text(
                            'All chats',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 0.0),
                            child: StreamBuilder<List<ChatsRecord>>(
                              stream: queryChatsRecord(
                                queryBuilder: (chatsRecord) => chatsRecord
                                    .where(
                                      'users',
                                      arrayContains: currentUserReference,
                                    )
                                    .orderBy('last_message_time',
                                        descending: true),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitPulse(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<ChatsRecord> listViewChatsRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewChatsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewChatsRecord =
                                        listViewChatsRecordList[listViewIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: StreamBuilder<FFChatInfo>(
                                        stream: FFChatManager.instance
                                            .getChatInfo(
                                                chatRecord:
                                                    listViewChatsRecord),
                                        builder: (context, snapshot) {
                                          final chatInfo = snapshot.data ??
                                              FFChatInfo(listViewChatsRecord);
                                          return FFChatPreview(
                                            onTap: () => context.pushNamed(
                                              'Chat_Convo',
                                              queryParameters: {
                                                'chatUser': serializeParam(
                                                  chatInfo.otherUsers.length ==
                                                          1
                                                      ? chatInfo
                                                          .otherUsersList.first
                                                      : null,
                                                  ParamType.Document,
                                                ),
                                                'chatRef': serializeParam(
                                                  chatInfo.chatRecord.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'chatUser': chatInfo.otherUsers
                                                            .length ==
                                                        1
                                                    ? chatInfo
                                                        .otherUsersList.first
                                                    : null,
                                              },
                                            ),
                                            lastChatText:
                                                chatInfo.chatPreviewMessage(),
                                            lastChatTime: listViewChatsRecord
                                                .lastMessageTime,
                                            seen: listViewChatsRecord
                                                .lastMessageSeenBy
                                                .contains(currentUserReference),
                                            title: chatInfo.chatPreviewTitle(),
                                            userProfilePic:
                                                chatInfo.chatPreviewPic(),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            unreadColor: const Color(0xFF670D0D),
                                            titleTextStyle: GoogleFonts.getFont(
                                              'DM Sans',
                                              color: listViewChatsRecord
                                                      .lastMessageSeenBy
                                                      .contains(
                                                          currentUserReference)
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                            ),
                                            dateTextStyle: GoogleFonts.getFont(
                                              'DM Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12.0,
                                            ),
                                            previewTextStyle:
                                                GoogleFonts.getFont(
                                              'DM Sans',
                                              color: listViewChatsRecord
                                                      .lastMessageSeenBy
                                                      .contains(
                                                          currentUserReference)
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12.0,
                                            ),
                                            contentPadding: const EdgeInsets.all(3.0),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: wrapWithModel(
                        model: _model.navbarModel,
                        updateCallback: () => setState(() {}),
                        child: const NavbarWidget(
                          page: 3,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.8,
                      child: Align(
                        alignment: const AlignmentDirectional(0.9, -0.97),
                        child: FlutterFlowIconButton(
                          borderRadius: 20.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.mark_chat_unread,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            context.pushNamed(
                              'Chat_Invite',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.rightToLeft,
                                ),
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
            ))
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.sideNavModel,
                      updateCallback: () => setState(() {}),
                      child: const SideNavWidget(
                        screen: 3,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'All chats',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 2.0, 0.0, 0.0),
                                child: StreamBuilder<List<ChatsRecord>>(
                                  stream: queryChatsRecord(
                                    queryBuilder: (chatsRecord) => chatsRecord
                                        .where(
                                          'users',
                                          arrayContains: currentUserReference,
                                        )
                                        .orderBy('last_message_time',
                                            descending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitPulse(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<ChatsRecord> listViewChatsRecordList =
                                        snapshot.data!;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listViewChatsRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewChatsRecord =
                                            listViewChatsRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: StreamBuilder<FFChatInfo>(
                                            stream: FFChatManager.instance
                                                .getChatInfo(
                                                    chatRecord:
                                                        listViewChatsRecord),
                                            builder: (context, snapshot) {
                                              final chatInfo = snapshot.data ??
                                                  FFChatInfo(
                                                      listViewChatsRecord);
                                              return FFChatPreview(
                                                onTap: () => context.pushNamed(
                                                  'Chat_Convo',
                                                  queryParameters: {
                                                    'chatUser': serializeParam(
                                                      chatInfo.otherUsers
                                                                  .length ==
                                                              1
                                                          ? chatInfo
                                                              .otherUsersList
                                                              .first
                                                          : null,
                                                      ParamType.Document,
                                                    ),
                                                    'chatRef': serializeParam(
                                                      chatInfo
                                                          .chatRecord.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'chatUser': chatInfo
                                                                .otherUsers
                                                                .length ==
                                                            1
                                                        ? chatInfo
                                                            .otherUsersList
                                                            .first
                                                        : null,
                                                  },
                                                ),
                                                lastChatText: chatInfo
                                                    .chatPreviewMessage(),
                                                lastChatTime:
                                                    listViewChatsRecord
                                                        .lastMessageTime,
                                                seen: listViewChatsRecord
                                                    .lastMessageSeenBy
                                                    .contains(
                                                        currentUserReference),
                                                title:
                                                    chatInfo.chatPreviewTitle(),
                                                userProfilePic:
                                                    chatInfo.chatPreviewPic(),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                unreadColor: const Color(0xFF670D0D),
                                                titleTextStyle:
                                                    GoogleFonts.getFont(
                                                  'DM Sans',
                                                  color: listViewChatsRecord
                                                          .lastMessageSeenBy
                                                          .contains(
                                                              currentUserReference)
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText
                                                      : Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.0,
                                                ),
                                                dateTextStyle:
                                                    GoogleFonts.getFont(
                                                  'DM Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12.0,
                                                ),
                                                previewTextStyle:
                                                    GoogleFonts.getFont(
                                                  'DM Sans',
                                                  color: listViewChatsRecord
                                                          .lastMessageSeenBy
                                                          .contains(
                                                              currentUserReference)
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText
                                                      : Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12.0,
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.all(3.0),
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 10.0, 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'User list',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 2.0, 0.0, 0.0),
                                child: StreamBuilder<List<UsersRecord>>(
                                  stream: queryUsersRecord(
                                    queryBuilder: (usersRecord) =>
                                        usersRecord.orderBy('display_name'),
                                    limit: 50,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitPulse(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<UsersRecord> listViewUsersRecordList =
                                        snapshot.data!
                                            .where(
                                                (u) => u.uid != currentUserUid)
                                            .toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listViewUsersRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewUsersRecord =
                                            listViewUsersRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 2.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 70.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'Chat_Convo',
                                                    queryParameters: {
                                                      'chatUser':
                                                          serializeParam(
                                                        listViewUsersRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'chatUser':
                                                          listViewUsersRecord,
                                                    },
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Card(
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(2.0),
                                                        child: Container(
                                                          width: 48.0,
                                                          height: 48.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            listViewUsersRecord
                                                                .photoUrl,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              listViewUsersRecord
                                                                  .displayName,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewUsersRecord
                                                                    .type,
                                                                'user',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
