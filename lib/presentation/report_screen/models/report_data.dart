import 'package:ai_image_generator/presentation/report_screen/models/report_model.dart';

class ReportData{
  static List<ReportModel> getreportData(){
    return [
      ReportModel("Fraud or scam",1),
      ReportModel("Offensive or inappropriate content",2),
      ReportModel("Nudity or pornography",3),
      ReportModel("Harmful or dangerous content",4),
      ReportModel("Hateful activities",5),
      ReportModel("Graphic violence",6),
      ReportModel("Violation of Guidelines or Policies",7),
      ReportModel("Cultural Appropriation",8),
      ReportModel("Plagiarism and Copyright Infringement",9),
      ReportModel("Counterfeit or Fake Artwork",10),
      ReportModel("Safety Concerns",11),
      ReportModel("Other",12),
    ];
  }
}