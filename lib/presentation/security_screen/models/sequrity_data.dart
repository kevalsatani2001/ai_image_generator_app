import 'package:ai_image_generator/presentation/security_screen/models/security_model.dart';

class SequrityData{
  static List<SecurityModel> getSequrityData(){
    return [
      SecurityModel("Remember me",false),
      SecurityModel("Biometric ID",false),
      SecurityModel("Face ID",false),
      SecurityModel("SMS Authenticator",false),
      SecurityModel("Google Authenticator",false),
    ];
  }
}