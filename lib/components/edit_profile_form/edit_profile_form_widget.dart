import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'edit_profile_form_model.dart';
export 'edit_profile_form_model.dart';

class EditProfileFormWidget extends StatefulWidget {
  const EditProfileFormWidget({
    super.key,
    required this.editProfile,
  });

  final bool? editProfile;

  @override
  State<EditProfileFormWidget> createState() => _EditProfileFormWidgetState();
}

class _EditProfileFormWidgetState extends State<EditProfileFormWidget> {
  late EditProfileFormModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileFormModel());

    _model.yourNameTextController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.yourNameFocusNode ??= FocusNode();

    _model.myBioTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.bio, ''));
    _model.myBioFocusNode ??= FocusNode();

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
      children: [
        if (responsiveVisibility(
          context: context,
          phone: false,
          tablet: false,
        ))
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (widget.editProfile == true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 50.0,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Text(
                    widget.editProfile == true
                        ? 'Edit Profile'
                        : 'Create Your Profile',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: FlutterFlowTheme.of(context).headlineMedium,
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
          ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  final selectedMedia = await selectMediaWithSourceBottomSheet(
                    context: context,
                    imageQuality: 80,
                    allowPhoto: true,
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    textColor: FlutterFlowTheme.of(context).primaryText,
                    pickerFontFamily: 'Outfit',
                  );
                  if (selectedMedia != null &&
                      selectedMedia.every(
                          (m) => validateFileFormat(m.storagePath, context))) {
                    safeSetState(() => _model.isDataUploading = true);
                    var selectedUploadedFiles = <FFUploadedFile>[];

                    var downloadUrls = <String>[];
                    try {
                      showUploadMessage(
                        context,
                        'Uploading file...',
                        showLoading: true,
                      );
                      selectedUploadedFiles = selectedMedia
                          .map((m) => FFUploadedFile(
                                name: m.storagePath.split('/').last,
                                bytes: m.bytes,
                                height: m.dimensions?.height,
                                width: m.dimensions?.width,
                                blurHash: m.blurHash,
                              ))
                          .toList();

                      downloadUrls = (await Future.wait(
                        selectedMedia.map(
                          (m) async => await uploadData(m.storagePath, m.bytes),
                        ),
                      ))
                          .where((u) => u != null)
                          .map((u) => u!)
                          .toList();
                    } finally {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      _model.isDataUploading = false;
                    }
                    if (selectedUploadedFiles.length == selectedMedia.length &&
                        downloadUrls.length == selectedMedia.length) {
                      safeSetState(() {
                        _model.uploadedLocalFile = selectedUploadedFiles.first;
                        _model.uploadedFileUrl = downloadUrls.first;
                      });
                      showUploadMessage(context, 'Success!');
                    } else {
                      safeSetState(() {});
                      showUploadMessage(context, 'Failed to upload data');
                      return;
                    }
                  }
                },
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Container(
                            width: 90.0,
                            height: 90.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 500),
                              fadeOutDuration: Duration(milliseconds: 500),
                              imageUrl: currentUserPhoto,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Container(
                          width: 90.0,
                          height: 90.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl: valueOrDefault<String>(
                              _model.uploadedFileUrl,
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/workout-web-app-manager-m1j9am/assets/v2bacnnrcrpc/addAvatarImage@2x.png',
                            ),
                            fit: BoxFit.fitWidth,
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
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
          child: AuthUserStreamWidget(
            builder: (context) => TextFormField(
              controller: _model.yourNameTextController,
              focusNode: _model.yourNameFocusNode,
              textCapitalization: TextCapitalization.words,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Your Name',
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      font: FlutterFlowTheme.of(context).labelMedium,
                      letterSpacing: 0.0,
                    ),
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      font: FlutterFlowTheme.of(context).labelMedium,
                      letterSpacing: 0.0,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: FlutterFlowTheme.of(context).bodyMedium,
                    letterSpacing: 0.0,
                  ),
              cursorColor: FlutterFlowTheme.of(context).primary,
              validator:
                  _model.yourNameTextControllerValidator.asValidator(context),
              inputFormatters: [
                if (!isAndroid && !isiOS)
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    return TextEditingValue(
                      selection: newValue.selection,
                      text: newValue.text
                          .toCapitalization(TextCapitalization.words),
                    );
                  }),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
          child: AuthUserStreamWidget(
            builder: (context) => FlutterFlowDropDown<String>(
              controller: _model.stateValueController ??=
                  FormFieldController<String>(
                _model.stateValue ??=
                    valueOrDefault(currentUserDocument?.location, ''),
              ),
              options: [
                'Alabama',
                'Alaska',
                'Arizona',
                'Arkansas',
                'California',
                'Colorado',
                'Connecticut',
                'Delaware',
                'Florida',
                'Georgia',
                'Hawaii',
                'Idaho',
                'Illinoi',
                'Indiana',
                'Iowa',
                'Kansas',
                'Kentucky',
                'Louisiana',
                'Maine',
                'Maryland',
                'Massachusetts',
                'Michigan',
                'Minnesota',
                'Mississippi',
                'Missouri',
                'Monta',
                'Nebraska',
                'Nevada',
                'New Hampshire',
                'New Jersey',
                'New Mexico',
                'New York',
                'North Carolina',
                'North Dak',
                'Ohio',
                'Oklahoma',
                'Oregon',
                'Pennsylvani',
                'Rhode Island',
                'South Caroli',
                'South Dakota',
                'Tennessee',
                'Texas',
                'Utah',
                'Vermont',
                'Virginia',
                'Washingto',
                'West Virginia',
                'Wisconsin',
                'Wyoming'
              ],
              onChanged: (val) => safeSetState(() => _model.stateValue = val),
              width: double.infinity,
              height: 56.0,
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: FlutterFlowTheme.of(context).bodyMedium,
                    letterSpacing: 0.0,
                  ),
              hintText: 'Select State',
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 15.0,
              ),
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              elevation: 2.0,
              borderColor: FlutterFlowTheme.of(context).alternate,
              borderWidth: 2.0,
              borderRadius: 8.0,
              margin: EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 12.0, 4.0),
              hidesUnderline: true,
              isSearchable: false,
              isMultiSelect: false,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
          child: AuthUserStreamWidget(
            builder: (context) => TextFormField(
              controller: _model.myBioTextController,
              focusNode: _model.myBioFocusNode,
              textCapitalization: TextCapitalization.sentences,
              obscureText: false,
              decoration: InputDecoration(
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      font: FlutterFlowTheme.of(context).labelMedium,
                      letterSpacing: 0.0,
                    ),
                hintText: 'Your bio',
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      font: FlutterFlowTheme.of(context).labelMedium,
                      letterSpacing: 0.0,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: FlutterFlowTheme.of(context).bodyMedium,
                    letterSpacing: 0.0,
                  ),
              textAlign: TextAlign.start,
              maxLines: 3,
              cursorColor: FlutterFlowTheme.of(context).primary,
              validator:
                  _model.myBioTextControllerValidator.asValidator(context),
              inputFormatters: [
                if (!isAndroid && !isiOS)
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    return TextEditingValue(
                      selection: newValue.selection,
                      text: newValue.text
                          .toCapitalization(TextCapitalization.sentences),
                    );
                  }),
              ],
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.05),
          child: FFButtonWidget(
            onPressed: () async {
              await currentUserReference!.update(createUsersRecordData(
                displayName: _model.yourNameTextController.text,
                photoUrl: _model.uploadedFileUrl != ''
                    ? _model.uploadedFileUrl
                    : currentUserPhoto,
                bio: _model.myBioTextController.text,
                location: _model.stateValue,
              ));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'You have updated your profile!',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: FlutterFlowTheme.of(context).titleSmall,
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                        ),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                ),
              );

              context.pushNamed(MainHomePageWidget.routeName);
            },
            text: 'Save Changes',
            options: FFButtonOptions(
              height: 44.0,
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    font: FlutterFlowTheme.of(context).titleSmall,
                    letterSpacing: 0.0,
                  ),
              elevation: 2.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(50.0),
              hoverColor: FlutterFlowTheme.of(context).accent1,
              hoverBorderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primary,
                width: 1.0,
              ),
              hoverTextColor: FlutterFlowTheme.of(context).primary,
            ),
          ),
        ),
      ],
    );
  }
}
