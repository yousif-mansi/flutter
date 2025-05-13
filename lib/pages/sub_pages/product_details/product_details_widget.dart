import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/emtpy_state/emtpy_state_widget.dart';
import '/components/gradient_button/gradient_button_widget.dart';
import '/components/review_modal_create/review_modal_create_widget.dart';
import '/components/top_nav/top_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'product_details_model.dart';
export 'product_details_model.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({
    super.key,
    required this.productRef,
  });

  final ProductsRecord? productRef;

  static String routeName = 'productDetails';
  static String routePath = '/productDetails';

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget>
    with TickerProviderStateMixin {
  late ProductDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.productRef?.userRef != currentUserReference) {
        await ActivityRecord.collection.doc().set({
          ...createActivityRecordData(
            title: 'New viewed item!',
            content:
                '${currentUserDisplayName} has viewed your item ${widget.productRef?.name}',
            sentAt: getCurrentTimestamp,
            productRef: widget.productRef?.reference,
          ),
          ...mapToFirestore(
            {
              'userList': [widget.productRef?.userRef],
              'unreadByUser': [widget.productRef?.userRef],
            },
          ),
        });
      } else {
        return;
      }
    });

    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
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
            begin: Offset(0.0, -70.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
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
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
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
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 175.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 175.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 175.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 150.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'listViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 250.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 250.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 250.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.topNavModel,
                updateCallback: () => safeSetState(() {}),
                child: TopNavWidget(),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 4.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            constraints: BoxConstraints(
                              maxWidth: 1170.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2.0,
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 12.0, 0.0, 12.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 44.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  wrapWithModel(
                                                    model: _model
                                                        .gradientButtonModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: GradientButtonWidget(
                                                      action: () async {
                                                        context.pushNamed(
                                                          MainHomePageWidget
                                                              .routeName,
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      0),
                                                            ),
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Icon(
                                                      Icons
                                                          .chevron_right_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 16.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      height: 32.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
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
                                                          'Product Details',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'rowOnPageLoadAnimation']!),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 4.0, 140.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 2.0,
                                                  color: Color(0x520E151B),
                                                  offset: Offset(
                                                    0.0,
                                                    1.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(16.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      16.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Hero(
                                                                  tag: widget
                                                                      .productRef!
                                                                      .photoUrl,
                                                                  transitionOnUserGestures:
                                                                      true,
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    child: Image
                                                                        .network(
                                                                      widget
                                                                          .productRef!
                                                                          .photoUrl,
                                                                      width:
                                                                          400.0,
                                                                      height:
                                                                          400.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (responsiveVisibility(
                                                                context:
                                                                    context,
                                                                phone: false,
                                                                tablet: false,
                                                              ))
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              widget.productRef!.name,
                                                                              style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                    font: FlutterFlowTheme.of(context).headlineLarge,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              12.0,
                                                                              0.0,
                                                                              12.0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              formatNumber(
                                                                                widget.productRef?.price,
                                                                                formatType: FormatType.decimal,
                                                                                decimalType: DecimalType.automatic,
                                                                                currency: '\$',
                                                                              ),
                                                                              '0.00',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  font: FlutterFlowTheme.of(context).titleLarge,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              24.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              widget.productRef?.description,
                                                                              'It\'s the perfect mix: a splash of heritage Nike running and a whole lot of comfort. The fast-paced look also includes a revamped Air unit window to energize your every step.',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: FlutterFlowTheme.of(context).labelLarge,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Divider(
                                                                          height:
                                                                              36.0,
                                                                          thickness:
                                                                              1.0,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                        ),
                                                                        Text(
                                                                          'Shoe Size',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                font: FlutterFlowTheme.of(context).labelMedium,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              12.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              FlutterFlowChoiceChips(
                                                                            options: [
                                                                              ChipData('Size 8'),
                                                                              ChipData('Size 9'),
                                                                              ChipData('Size 10'),
                                                                              ChipData('Size 11'),
                                                                              ChipData('Size 12'),
                                                                              ChipData('Size 13')
                                                                            ],
                                                                            onChanged: (val) =>
                                                                                safeSetState(() => _model.choiceChipsValue1 = val?.firstOrNull),
                                                                            selectedChipStyle:
                                                                                ChipStyle(
                                                                              backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    font: FlutterFlowTheme.of(context).titleSmall,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                              iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                              iconSize: 18.0,
                                                                              elevation: 4.0,
                                                                            ),
                                                                            unselectedChipStyle:
                                                                                ChipStyle(
                                                                              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: FlutterFlowTheme.of(context).labelLarge,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                              iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                              iconSize: 18.0,
                                                                              elevation: 0.0,
                                                                            ),
                                                                            chipSpacing:
                                                                                8.0,
                                                                            rowSpacing:
                                                                                12.0,
                                                                            multiselect:
                                                                                false,
                                                                            initialized:
                                                                                _model.choiceChipsValue1 != null,
                                                                            alignment:
                                                                                WrapAlignment.start,
                                                                            controller: _model.choiceChipsValueController1 ??=
                                                                                FormFieldController<List<String>>(
                                                                              [
                                                                                'Size 8'
                                                                              ],
                                                                            ),
                                                                            wrapped:
                                                                                true,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              12.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Color',
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  font: FlutterFlowTheme.of(context).labelMedium,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              12.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              FlutterFlowChoiceChips(
                                                                            options: [
                                                                              ChipData('Gray'),
                                                                              ChipData('White'),
                                                                              ChipData('Black & Charcoal'),
                                                                              ChipData('Blue & White')
                                                                            ],
                                                                            onChanged: (val) =>
                                                                                safeSetState(() => _model.choiceChipsValue2 = val?.firstOrNull),
                                                                            selectedChipStyle:
                                                                                ChipStyle(
                                                                              backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    font: FlutterFlowTheme.of(context).titleSmall,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                              iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                              iconSize: 18.0,
                                                                              elevation: 4.0,
                                                                            ),
                                                                            unselectedChipStyle:
                                                                                ChipStyle(
                                                                              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: FlutterFlowTheme.of(context).labelLarge,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                              iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                              iconSize: 18.0,
                                                                              elevation: 0.0,
                                                                            ),
                                                                            chipSpacing:
                                                                                8.0,
                                                                            rowSpacing:
                                                                                12.0,
                                                                            multiselect:
                                                                                false,
                                                                            initialized:
                                                                                _model.choiceChipsValue2 != null,
                                                                            alignment:
                                                                                WrapAlignment.start,
                                                                            controller: _model.choiceChipsValueController2 ??=
                                                                                FormFieldController<List<String>>(
                                                                              [
                                                                                'Gray'
                                                                              ],
                                                                            ),
                                                                            wrapped:
                                                                                true,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ).animateOnPageLoad(
                                                                            animationsMap['columnOnPageLoadAnimation1']!),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          tabletLandscape:
                                                              false,
                                                          desktop: false,
                                                        ))
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        12.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  widget
                                                                      .productRef!
                                                                      .name,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .override(
                                                                        font: FlutterFlowTheme.of(context)
                                                                            .headlineLarge,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          12.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      formatNumber(
                                                                        widget
                                                                            .productRef
                                                                            ?.price,
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.automatic,
                                                                        currency:
                                                                            '\$',
                                                                      ),
                                                                      '0.00',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .override(
                                                                          font:
                                                                              FlutterFlowTheme.of(context).titleLarge,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          24.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      widget
                                                                          .productRef
                                                                          ?.description,
                                                                      'It\'s the perfect mix: a splash of heritage Nike running and a whole lot of comfort. The fast-paced look also includes a revamped Air unit window to energize your every step.',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          font:
                                                                              FlutterFlowTheme.of(context).labelLarge,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Divider(
                                                                  height: 36.0,
                                                                  thickness:
                                                                      1.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                                Text(
                                                                  'Shoe Size',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: FlutterFlowTheme.of(context)
                                                                            .labelMedium,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child:
                                                                      FlutterFlowChoiceChips(
                                                                    options: [
                                                                      ChipData(
                                                                          'Size 8'),
                                                                      ChipData(
                                                                          'Size 9'),
                                                                      ChipData(
                                                                          'Size 10'),
                                                                      ChipData(
                                                                          'Size 11'),
                                                                      ChipData(
                                                                          'Size 12'),
                                                                      ChipData(
                                                                          'Size 13')
                                                                    ],
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.choiceChipsValue3 =
                                                                                val?.firstOrNull),
                                                                    selectedChipStyle:
                                                                        ChipStyle(
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            font:
                                                                                FlutterFlowTheme.of(context).titleSmall,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      iconColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      iconSize:
                                                                          18.0,
                                                                      elevation:
                                                                          4.0,
                                                                    ),
                                                                    unselectedChipStyle:
                                                                        ChipStyle(
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            font:
                                                                                FlutterFlowTheme.of(context).labelLarge,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      iconColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      iconSize:
                                                                          18.0,
                                                                      elevation:
                                                                          0.0,
                                                                    ),
                                                                    chipSpacing:
                                                                        8.0,
                                                                    rowSpacing:
                                                                        12.0,
                                                                    multiselect:
                                                                        false,
                                                                    initialized:
                                                                        _model.choiceChipsValue3 !=
                                                                            null,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    controller: _model
                                                                            .choiceChipsValueController3 ??=
                                                                        FormFieldController<
                                                                            List<String>>(
                                                                      [
                                                                        'Size 8'
                                                                      ],
                                                                    ),
                                                                    wrapped:
                                                                        true,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Color',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              FlutterFlowTheme.of(context).labelMedium,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child:
                                                                      FlutterFlowChoiceChips(
                                                                    options: [
                                                                      ChipData(
                                                                          'Gray'),
                                                                      ChipData(
                                                                          'White'),
                                                                      ChipData(
                                                                          'Black & Charcoal'),
                                                                      ChipData(
                                                                          'Blue & White')
                                                                    ],
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.choiceChipsValue4 =
                                                                                val?.firstOrNull),
                                                                    selectedChipStyle:
                                                                        ChipStyle(
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            font:
                                                                                FlutterFlowTheme.of(context).titleSmall,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      iconColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      iconSize:
                                                                          18.0,
                                                                      elevation:
                                                                          4.0,
                                                                    ),
                                                                    unselectedChipStyle:
                                                                        ChipStyle(
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            font:
                                                                                FlutterFlowTheme.of(context).labelLarge,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      iconColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      iconSize:
                                                                          18.0,
                                                                      elevation:
                                                                          0.0,
                                                                    ),
                                                                    chipSpacing:
                                                                        8.0,
                                                                    rowSpacing:
                                                                        12.0,
                                                                    multiselect:
                                                                        false,
                                                                    initialized:
                                                                        _model.choiceChipsValue4 !=
                                                                            null,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    controller: _model
                                                                            .choiceChipsValueController4 ??=
                                                                        FormFieldController<
                                                                            List<String>>(
                                                                      ['Gray'],
                                                                    ),
                                                                    wrapped:
                                                                        true,
                                                                  ),
                                                                ),
                                                              ],
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'columnOnPageLoadAnimation2']!),
                                                          ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      16.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                  SellerDetailsWidget
                                                                      .routeName);
                                                            },
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        0.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      1.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            12.0,
                                                                            8.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                                                                        width:
                                                                            70.0,
                                                                        height:
                                                                            70.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'Randy Alcorn',
                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                    font: FlutterFlowTheme.of(context).titleLarge,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  '240 Sales',
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        font: FlutterFlowTheme.of(context).bodySmall,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 2.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  'San Antonio, Tx.',
                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        font: FlutterFlowTheme.of(context).labelMedium,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    if (responsiveVisibility(
                                                                      context:
                                                                          context,
                                                                      phone:
                                                                          false,
                                                                    ))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child: RatingBar
                                                                            .builder(
                                                                          onRatingUpdate: (newValue) =>
                                                                              safeSetState(() => _model.ratingBarValue = newValue),
                                                                          itemBuilder: (context, index) =>
                                                                              Icon(
                                                                            Icons.star_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                          direction:
                                                                              Axis.horizontal,
                                                                          initialRating: _model.ratingBarValue ??=
                                                                              4.0,
                                                                          unratedColor:
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                          itemCount:
                                                                              5,
                                                                          itemSize:
                                                                              24.0,
                                                                          glowColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      ),
                                                                    Icon(
                                                                      Icons
                                                                          .chevron_right_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'containerOnPageLoadAnimation1']!),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Ratings',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            font:
                                                                                FlutterFlowTheme.of(context).titleLarge,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'textOnPageLoadAnimation1']!),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Read the ratings for this product below',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              font: FlutterFlowTheme.of(context).labelMedium,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ).animateOnPageLoad(
                                                                              animationsMap['textOnPageLoadAnimation2']!),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  barrierColor:
                                                                      Colors
                                                                          .transparent,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(context)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              double.infinity,
                                                                          child:
                                                                              ReviewModalCreateWidget(
                                                                            productRef:
                                                                                widget.productRef!,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                        () {}));
                                                              },
                                                              text:
                                                                  'Leave Review',
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 44.0,
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      font: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50.0),
                                                                hoverColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                hoverTextColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                hoverElevation:
                                                                    3.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      12.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: PagedListView<
                                                              DocumentSnapshot<
                                                                  Object?>?,
                                                              ReviewsRecord>(
                                                            pagingController: _model
                                                                .setListViewController(
                                                              ReviewsRecord
                                                                  .collection
                                                                  .where(
                                                                    'productRef',
                                                                    isEqualTo: widget
                                                                        .productRef
                                                                        ?.reference,
                                                                  )
                                                                  .orderBy(
                                                                      'dateCreated',
                                                                      descending:
                                                                          true),
                                                            ),
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            reverse: false,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            builderDelegate:
                                                                PagedChildBuilderDelegate<
                                                                    ReviewsRecord>(
                                                              // Customize what your widget looks like when it's loading the first page.
                                                              firstPageProgressIndicatorBuilder:
                                                                  (_) => Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              // Customize what your widget looks like when it's loading another page.
                                                              newPageProgressIndicatorBuilder:
                                                                  (_) => Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              noItemsFoundIndicatorBuilder:
                                                                  (_) => Center(
                                                                child:
                                                                    Container(
                                                                  width: 300.0,
                                                                  height: 200.0,
                                                                  child:
                                                                      EmtpyStateWidget(
                                                                    title:
                                                                        'No Reviews',
                                                                    bodyText:
                                                                        'No reviews exist for this product.',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          90.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              itemBuilder: (context,
                                                                  _,
                                                                  listViewIndex) {
                                                                final listViewReviewsRecord = _model
                                                                        .listViewPagingController!
                                                                        .itemList![
                                                                    listViewIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          12.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          4.0,
                                                                          4.0,
                                                                          12.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                8.0,
                                                                                12.0,
                                                                                8.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                FutureBuilder<UsersRecord>(
                                                                                  future: UsersRecord.getDocumentOnce(listViewReviewsRecord.userRefReviewer!),
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

                                                                                    final rowUsersRecord = snapshot.data!;

                                                                                    return Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsets.all(2.0),
                                                                                          child: Container(
                                                                                            width: 44.0,
                                                                                            height: 44.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                              shape: BoxShape.rectangle,
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsets.all(2.0),
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                child: Image.network(
                                                                                                  valueOrDefault<String>(
                                                                                                    rowUsersRecord.photoUrl,
                                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/f-f-enterprise-e-comm-2v20bm/assets/97jg5r238nfr/appIcon@2x.png',
                                                                                                  ),
                                                                                                  width: 70.0,
                                                                                                  height: 70.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  rowUsersRecord.displayName,
                                                                                                  'Ghost User',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                      font: FlutterFlowTheme.of(context).bodyLarge,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    rowUsersRecord.email,
                                                                                                    'casper@ghost.com',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        font: FlutterFlowTheme.of(context).labelMedium,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Overall',
                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                            font: FlutterFlowTheme.of(context).labelSmall,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                          child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              formatNumber(
                                                                                                listViewReviewsRecord.rating,
                                                                                                formatType: FormatType.decimal,
                                                                                                decimalType: DecimalType.automatic,
                                                                                              ),
                                                                                              '0',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                  font: FlutterFlowTheme.of(context).headlineMedium,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Icon(
                                                                                          Icons.star_rounded,
                                                                                          color: Color(0xFF4B39EF),
                                                                                          size: 20.0,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                AutoSizeText(
                                                                              valueOrDefault<String>(
                                                                                listViewReviewsRecord.reviewName,
                                                                                '--',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                4.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                AutoSizeText(
                                                                              valueOrDefault<String>(
                                                                                listViewReviewsRecord.reviewDescription,
                                                                                '--',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    font: FlutterFlowTheme.of(context).labelMedium,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'listViewOnPageLoadAnimation']!),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 32.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 5.0,
                                              sigmaY: 2.0,
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              height: 80.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 160.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child:
                                                          FlutterFlowCountController(
                                                        decrementIconBuilder:
                                                            (enabled) => FaIcon(
                                                          FontAwesomeIcons
                                                              .minus,
                                                          color: enabled
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .alternate
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                          size: 20.0,
                                                        ),
                                                        incrementIconBuilder:
                                                            (enabled) => FaIcon(
                                                          FontAwesomeIcons.plus,
                                                          color: enabled
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                          size: 20.0,
                                                        ),
                                                        countBuilder: (count) =>
                                                            Text(
                                                          count.toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                font: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        count: _model
                                                            .countControllerValue ??= 1,
                                                        updateCount: (count) =>
                                                            safeSetState(() =>
                                                                _model.countControllerValue =
                                                                    count),
                                                        stepSize: 1,
                                                      ),
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        FFAppState().addToCart(
                                                            widget.productRef!
                                                                .reference);
                                                        FFAppState()
                                                            .addToCartPriceSummary(widget
                                                                    .productRef!
                                                                    .price *
                                                                (_model
                                                                    .countControllerValue!));
                                                        FFAppState()
                                                            .addToCartItems(
                                                                CartItemStruct(
                                                          itemRef: widget
                                                              .productRef
                                                              ?.reference,
                                                          quanity: _model
                                                              .countControllerValue,
                                                          totalPrice: widget
                                                                  .productRef!
                                                                  .price *
                                                              (_model
                                                                  .countControllerValue!),
                                                        ));
                                                        safeSetState(() {});
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'You have added ${widget.productRef?.name} to your cart!',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                          ),
                                                        );
                                                      },
                                                      text: 'Add to Cart',
                                                      options: FFButtonOptions(
                                                        width: 150.0,
                                                        height: 50.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 2.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation2']!),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
