import '/backend/api_requests/api_calls.dart';
import '/components/nolocationpopoup_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      unawaited(
        () async {
          await requestPermission(locationPermission);
        }(),
      );
      if (currentUserLocationValue != null ? true : false) {
        if (functions.returnnulllatlang(currentUserLocationValue)) {
          FFAppState().a = currentUserLocationValue!.toString();
          safeSetState(() {});
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            context: context,
            builder: (context) {
              return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: const SizedBox(
                    height: double.infinity,
                    child: NolocationpopoupWidget(),
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));

          return;
        } else {
          _model.apiResult1w0 = await LocationCall.call(
            lattitude: 20.0,
            longitude: 70.0,
          );

          FFAppState().a = currentUserLocationValue!.toString();
          FFAppState().d = (_model.apiResult1w0?.statusCode ?? 200).toString();
          safeSetState(() {});
          if ((_model.apiResult1w0?.succeeded ?? true)) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'successful',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: const Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
            FFAppState().b = 'i am here ';
            safeSetState(() {});
            return;
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'failed',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: const Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
            FFAppState().b = 'i am here not';
            safeSetState(() {});
            return;
          }
        }
      } else {
        FFAppState().a = currentUserLocationValue!.toString();
        safeSetState(() {});
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: const SizedBox(
                  height: double.infinity,
                  child: NolocationpopoupWidget(),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));

        return;
      }
    });

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'rfrdf',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                FFAppState().a,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                FFAppState().b,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  FFAppState().d,
                  'n/a',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                functions
                    .returnnulllatlang(currentUserLocationValue)
                    .toString(),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  functions
                      .fetchlatitute(currentUserLocationValue!)
                      ?.toString(),
                  'n/a',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  functions
                      .fetchlongitude(currentUserLocationValue!)
                      .toString(),
                  'n/a',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  currentUserLocationValue = await getCurrentUserLocation(
                      defaultLocation: const LatLng(0.0, 0.0));
                  var shouldSetState = false;
                  _model.apiResult1w0Copy42 = await LocationCall.call(
                    lattitude:
                        functions.fetchlatitute(currentUserLocationValue!),
                    longitude:
                        functions.fetchlongitude(currentUserLocationValue!),
                  );

                  shouldSetState = true;
                  FFAppState().a = currentUserLocationValue!.toString();
                  FFAppState().d =
                      (_model.apiResult1w0Copy42?.statusCode ?? 200).toString();
                  safeSetState(() {});
                  if ((_model.apiResult1w0Copy42?.succeeded ?? true)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'successful',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                    FFAppState().b = 'i am here ';
                    safeSetState(() {});
                    if (shouldSetState) safeSetState(() {});
                    return;
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'failed',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                    FFAppState().b = 'i am here not';
                    safeSetState(() {});
                    if (shouldSetState) safeSetState(() {});
                    return;
                  }

                  if (shouldSetState) safeSetState(() {});
                },
                text: 'Button',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter Tight',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
