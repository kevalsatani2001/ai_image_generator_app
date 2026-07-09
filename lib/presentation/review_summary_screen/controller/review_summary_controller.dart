import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/review_summary_screen/models/review_summary_model.dart';/// A controller class for the ReviewSummaryScreen.
///
/// This class manages the state of the ReviewSummaryScreen, including the
/// current reviewSummaryModelObj
class ReviewSummaryController extends GetxController {Rx<ReviewSummaryModel> reviewSummaryModelObj = ReviewSummaryModel().obs;

 }
