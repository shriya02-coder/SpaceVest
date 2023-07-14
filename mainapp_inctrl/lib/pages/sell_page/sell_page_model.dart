import '/ff/ff_animations.dart';
import '/ff/ff_icon_button.dart';
import '/ff/ff_theme.dart';
import '/ff/ff_util.dart';
import '/ff/ff_widgets.dart';
import '/pages/transaction_complete/transaction_complete_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SellPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for reason widget.
  TextEditingController? reasonController1;
  String? Function(BuildContext, String?)? reasonController1Validator;
  // State field(s) for reason widget.
  TextEditingController? reasonController2;
  String? Function(BuildContext, String?)? reasonController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController1?.dispose();
    reasonController1?.dispose();
    reasonController2?.dispose();
  }

  /// Additional helper methods are added here.

}
