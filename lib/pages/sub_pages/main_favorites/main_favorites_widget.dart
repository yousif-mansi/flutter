import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/loading_list/loading_list_widget.dart';
import '/components/product_list_view/product_list_view_widget.dart';
import '/components/top_nav/top_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'main_favorites_model.dart';
export 'main_favorites_model.dart';

class MainFavoritesWidget extends StatefulWidget {
  const MainFavoritesWidget({super.key});

  static String routeName = 'mainFavorites';
  static String routePath = '/mainFavorites';

  @override
  State<MainFavoritesWidget> createState() => _MainFavoritesWidgetState();
}

class _MainFavoritesWidgetState extends State<MainFavoritesWidget> {
  late MainFavoritesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainFavoritesModel());

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
                  'My Favorites',
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 0.0, 0.0),
                              child: Text(
                                'My Favorites',
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
                                16.0, 4.0, 0.0, 0.0),
                            child: Text(
                              'Below are your items that you have favorited.',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 32.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Builder(
                                builder: (context) {
                                  final favoriteItems = (currentUserDocument
                                              ?.favoriteItems
                                              .toList() ??
                                          [])
                                      .toList();
                                  if (favoriteItems.isEmpty) {
                                    return Center(
                                      child: Container(
                                        width: 300.0,
                                        height: 300.0,
                                        child: LoadingListWidget(
                                          title: 'No Favorites',
                                          bodyText:
                                              'You don\'t have any products in your favorite list.',
                                        ),
                                      ),
                                    );
                                  }

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: favoriteItems.length,
                                    itemBuilder: (context, favoriteItemsIndex) {
                                      final favoriteItemsItem =
                                          favoriteItems[favoriteItemsIndex];
                                      return FutureBuilder<ProductsRecord>(
                                        future: ProductsRecord.getDocumentOnce(
                                            favoriteItemsItem),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }

                                          final productListViewProductsRecord =
                                              snapshot.data!;

                                          return wrapWithModel(
                                            model: _model.productListViewModels
                                                .getModel(
                                              productListViewProductsRecord
                                                  .reference.id,
                                              favoriteItemsIndex,
                                            ),
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            updateOnChange: true,
                                            child: ProductListViewWidget(
                                              key: Key(
                                                'Keykud_${productListViewProductsRecord.reference.id}',
                                              ),
                                              productRef:
                                                  productListViewProductsRecord,
                                              favorited: true,
                                            ),
                                          );
                                        },
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
