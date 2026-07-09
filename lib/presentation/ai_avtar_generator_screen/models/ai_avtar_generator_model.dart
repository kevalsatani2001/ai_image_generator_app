/// This class defines the variables used in the [ai_avtar_generator_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AiAvtarGeneratorModel {
  String? image;
  String? category;
  bool? isDownloaded;
  int? id;
  AiAvtarGeneratorModel(this.image,this.category,this.isDownloaded,this.id);
}
