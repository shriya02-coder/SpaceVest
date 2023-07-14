import '/ff/ff_calendar.dart';
import '/ff/ff_expanded_image_view.dart';
import '/ff/ff_theme.dart';
import '/ff/ff_util.dart';
import '/ff/ff_widgets.dart';
import '/main.dart';
import '/ff/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ViewOptionsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  void dispose() {}

  /// Additional helper methods are added here.

}
