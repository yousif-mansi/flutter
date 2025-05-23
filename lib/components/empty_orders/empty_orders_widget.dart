import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'empty_orders_model.dart';
export 'empty_orders_model.dart';

class EmptyOrdersWidget extends StatefulWidget {
  const EmptyOrdersWidget({
    super.key,
    this.title,
    this.bodyText,
  });

  final String? title;
  final String? bodyText;

  @override
  State<EmptyOrdersWidget> createState() => _EmptyOrdersWidgetState();
}

class _EmptyOrdersWidgetState extends State<EmptyOrdersWidget> {
  late EmptyOrdersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyOrdersModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Lottie.asset(
            'assets/jsons/orderNone.json',
            width: 150.0,
            height: 130.0,
            fit: BoxFit.cover,
            frameRate: FrameRate(30.0),
            animate: true,
          ),
        ),
        Text(
          widget.title!,
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                font: FlutterFlowTheme.of(context).headlineMedium,
                letterSpacing: 0.0,
              ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
          child: Text(
            widget.bodyText!,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  font: FlutterFlowTheme.of(context).labelMedium,
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ],
    );
  }
}
