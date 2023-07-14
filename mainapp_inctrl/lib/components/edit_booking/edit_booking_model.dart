import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/ff/ff_drop_down.dart';
import '/ff/ff_icon_button.dart';
import '/ff/ff_theme.dart';
import '/ff/ff_util.dart';
import '/ff/ff_widgets.dart';
import '/ff/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditBookingModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for personsName widget.
  TextEditingController? personsNameController;
  String? Function(BuildContext, String?)? personsNameControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for problemDescription widget.
  TextEditingController? problemDescriptionController;
  String? Function(BuildContext, String?)?
      problemDescriptionControllerValidator;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    personsNameController?.dispose();
    problemDescriptionController?.dispose();
  }

  /// Additional helper methods are added here.

}
