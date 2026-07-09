import 'download_artwork_model.dart';

class ArtSizeData{
  static List<DownloadArtworkModel> getArtSizeData(){
    return [
      DownloadArtworkModel("512 × 512",1),
      DownloadArtworkModel("1024 × 1024",2),
      DownloadArtworkModel("2048 × 2048",3),
      DownloadArtworkModel("4096 × 4096",4),
      DownloadArtworkModel("512 × 512",5),
    ];
  }
}