import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_orders/empty_orders_widget.dart';
import '/components/top_nav/top_nav_widget.dart';
import '/dropdowns/dropdown_menu/dropdown_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'main_order_history_model.dart';
export 'main_order_history_model.dart';

class MainOrderHistoryWidget extends StatefulWidget {
  const MainOrderHistoryWidget({super.key});

  static String routeName = 'mainOrderHistory';
  static String routePath = '/mainOrderHistory';

  @override
  State<MainOrderHistoryWidget> createState() => _MainOrderHistoryWidgetState();
}

class _MainOrderHistoryWidgetState extends State<MainOrderHistoryWidget>
    with TickerProviderStateMixin {
  late MainOrderHistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainOrderHistoryModel());

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-60.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 60.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'listViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 80.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                title: Text(
                  'Order History',
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        font: FlutterFlowTheme.of(context).displaySmall,
                        letterSpacing: 0.0,
                      ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  wrapWithModel(
                    model: _model.topNavModel,
                    updateCallback: () => safeSetState(() {}),
                    child: TopNavWidget(),
                  ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 1170.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                        ))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 0.0, 0.0),
                            child: Text(
                              'Order History',
                              style: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    font: FlutterFlowTheme.of(context)
                                        .headlineLarge,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 0.0, 12.0),
                          child: Text(
                            'Pending Orders',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  letterSpacing: 0.0,
                                ),
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation1']!),
                        ),
                        if (currentUserReference != null)
                          StreamBuilder<List<OrdersRecord>>(
                            stream: queryOrdersRecord(
                              queryBuilder: (ordersRecord) => ordersRecord
                                  .where(
                                    'userPurchased',
                                    isEqualTo: currentUserReference,
                                  )
                                  .orderBy('created_at', descending: true),
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
                              List<OrdersRecord> listViewOrdersRecordList =
                                  snapshot.data!;
                              if (listViewOrdersRecordList.isEmpty) {
                                return Center(
                                  child: Container(
                                    width: 300.0,
                                    height: 350.0,
                                    child: EmptyOrdersWidget(
                                      title: 'No Pending Orders',
                                      bodyText:
                                          'You don\'t have any pending orders right now, go and checkout some products!',
                                    ),
                                  ),
                                );
                              }

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewOrdersRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewOrdersRecord =
                                      listViewOrdersRecordList[listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 12.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          OrderHistoryDetailsWidget.routeName,
                                          queryParameters: {
                                            'orderRef': serializeParam(
                                              listViewOrdersRecord,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'orderRef': listViewOrdersRecord,
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x520E151B),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      listViewOrdersRecord.name,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                font: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                  Text(
                                                    formatNumber(
                                                      listViewOrdersRecord
                                                          .amount,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                      currency: '\$',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          font: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Builder(
                                                    builder: (context) =>
                                                        Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderRadius: 20.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        hoverColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        hoverIconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        icon: Icon(
                                                          Icons.more_vert,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          await showAlignedDialog(
                                                            barrierColor: Colors
                                                                .transparent,
                                                            context: context,
                                                            isGlobal: false,
                                                            avoidOverflow: true,
                                                            targetAnchor:
                                                                AlignmentDirectional(
                                                                        -1.0,
                                                                        1.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                            followerAnchor:
                                                                AlignmentDirectional(
                                                                        -1.0,
                                                                        -1.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                            builder:
                                                                (dialogContext) {
                                                              return Material(
                                                                color: Colors
                                                                    .transparent,
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      DropdownMenuWidget(
                                                                    orderRef:
                                                                        listViewOrdersRecord,
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 8.0),
                                                child: Text(
                                                  'Ordered on: ${dateTimeFormat("MMMEd", listViewOrdersRecord.createdAt)}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        font:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Divider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 8.0),
                                                    child: Text(
                                                      'Number of Items: ${listViewOrdersRecord.itemsOrdered.length.toString()}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 32.0,
                                                    decoration: BoxDecoration(
                                                      color: () {
                                                        if (listViewOrdersRecord
                                                                .status ==
                                                            'Pending') {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .accent3;
                                                        } else if (listViewOrdersRecord
                                                                .status ==
                                                            'Accepted') {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .accent2;
                                                        } else {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .accent1;
                                                        }
                                                      }(),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color: () {
                                                          if (listViewOrdersRecord
                                                                  .status ==
                                                              'Pending') {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary;
                                                          } else if (listViewOrdersRecord
                                                                  .status ==
                                                              'Accepted') {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary;
                                                          } else {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .primary;
                                                          }
                                                        }(),
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Text(
                                                        listViewOrdersRecord
                                                            .status,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  color: () {
                                                                    if (listViewOrdersRecord
                                                                            .status ==
                                                                        'Pending') {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary;
                                                                    } else if (listViewOrdersRecord
                                                                            .status ==
                                                                        'Accepted') {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary;
                                                                    } else {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary;
                                                                    }
                                                                  }(),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation']!),
                                  );
                                },
                              );
                            },
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 0.0, 0.0),
                          child: Text(
                            'This Month',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  letterSpacing: 0.0,
                                ),
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation2']!),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 32.0),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 8.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x520E151B),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          child: Image.network(
                                            'https://static.nike.com/a/images/f_auto,b_rgb:f5f5f5,w_440/cf6886fd-72b6-4a08-a3a8-bb5a92508fd0/air-max-270-mens-shoes-KkLcGR.png',
                                            width: 80.0,
                                            height: 80.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'New Release',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        font:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Feb 15, 2022',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          font: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '\$126.20',
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                font:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 8.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x520E151B),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          child: Image.network(
                                            'https://static.nike.com/a/images/f_auto,b_rgb:f5f5f5,w_440/wzitsrb4oucx9jukxsmc/air-max-90-mens-shoes-6n3vKB.png',
                                            width: 80.0,
                                            height: 80.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Nike Airmax 90',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        font:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Feb 15, 2022',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          font: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '\$222.50',
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                font:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ).animateOnPageLoad(
                              animationsMap['listViewOnPageLoadAnimation']!),
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
  }
}
