import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/ai_avtar_generator_screen/models/ai_avtar_generator_model.dart';

import '../models/ai_avtar_generator_data.dart';

/// A controller class for the AiAvtarGeneratorScreen.
///
/// This class manages the state of the AiAvtarGeneratorScreen, including the
/// current aiAvtarGeneratorModelObj
class AiAvtarGeneratorController extends GetxController {
 List<AiAvtarGeneratorModel> aiAvtarIamge =  AiAvtarGeneratorModelData.getAiAvtarGeneratorData();
 List<AiAvtarGeneratorModel> goodPhotos = [];
 List<AiAvtarGeneratorModel> badPhotos = [];
 List<AiAvtarGeneratorModel> downlodedPendingPhotos = [];
 List<AiAvtarGeneratorModel> downlodedList = [];
 @override
 void onReady() {
    // TODO: implement onReady
    super.onReady();
    for(var i =0;i<aiAvtarIamge.length;i++){
     if(aiAvtarIamge[i].category=="good" && aiAvtarIamge[i].isDownloaded!){
      goodPhotos.add(aiAvtarIamge[i]);
      downlodedList.add(aiAvtarIamge[i]);
      update();
     }
     else if(aiAvtarIamge[i].category=="bad" && aiAvtarIamge[i].isDownloaded!){
       badPhotos.add(aiAvtarIamge[i]);
       downlodedList.add(aiAvtarIamge[i]);
       update();
      }
      else{
      downlodedPendingPhotos.add(aiAvtarIamge[i]);
      update();
     }
     }
    }

    setListData(){
      goodPhotos = [];
      badPhotos = [];
      downlodedPendingPhotos = [];
      downlodedList = [];
      for(var i =0;i<aiAvtarIamge.length;i++){
        if(aiAvtarIamge[i].category=="good" && aiAvtarIamge[i].isDownloaded!){
          goodPhotos.add(aiAvtarIamge[i]);
          downlodedList.add(aiAvtarIamge[i]);
          update();
        }
        else if(aiAvtarIamge[i].category=="bad" && aiAvtarIamge[i].isDownloaded!){
          badPhotos.add(aiAvtarIamge[i]);
          downlodedList.add(aiAvtarIamge[i]);
          update();
        }
        else{
          downlodedPendingPhotos.add(aiAvtarIamge[i]);
          update();
        }
      }
    }

 void changeDownloadPos(AiAvtarGeneratorModel gridillustratio1itemModelObj) {
   gridillustratio1itemModelObj.isDownloaded = true;
   setListData();
   update();
 }
  }

