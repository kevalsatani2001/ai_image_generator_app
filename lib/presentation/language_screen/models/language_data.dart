import 'language_model.dart';

class LanguageData{
  static List<LanguageModel> getGenerelLanguage(){
    return [
      LanguageModel("English (us)",1),
      LanguageModel("English (uk)",2),
    ];
  }

  static List<LanguageModel> getlLanguage(){
    return [
      LanguageModel("Mandarin",3),
      LanguageModel("Spanish",4),
      LanguageModel("French",5),
      LanguageModel("Arabic",6),
      LanguageModel("Bengali",7),
      LanguageModel("Russian",8),
      LanguageModel("Japanese",9),
      LanguageModel("Korean",10),
    ];
  }
}