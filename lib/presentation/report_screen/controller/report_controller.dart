import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/report_screen/models/report_model.dart';

import '../models/report_data.dart';/// A controller class for the ReportScreen.
///
/// This class manages the state of the ReportScreen, including the
/// current reportModelObj
class ReportController extends GetxController {

 List<ReportModel> reportDataList = ReportData.getreportData();
 int selectedReportReason = 1;

 }
