import 'package:get/get.dart';
import 'package:student_management/models/my_model.dart';
import 'package:student_management/models/now_playing_model.dart';
import 'package:student_management/models/poular_model.dart';
import 'package:student_management/services/api_services.dart';

class ReportPageController extends GetxController{


  //Approach One

  var isLoading = true.obs;
  var myModelList = <MyModel>[].obs;

  fetchMyModelData() async{
    try{
      isLoading(true);
      var myModelData = await ApiServies().fetchMyModelData();
      myModelList.addAll(myModelData);
    }catch(e){
      print('error fetching user data $e');
    }finally{
      isLoading(false);
    }
  }


  //Approach Two

  PopularModel? popularModel;
  bool get hasPopularMovieDataLoaded => popularModel != null;

  fetchPopularMovieData() async{
    popularModel = await ApiServies().fetchPopularMovieData();
    update();
  }


  //Approach Three

  NowPlayingModel? nowPlayingModel;
  bool get hasNowPlayingMovieDataLoaded => nowPlayingModel != null;

  fetchNowPlayingMovieData() async{
    nowPlayingModel = await ApiServies().fetchNowPlayingMovieData();
    print('nowPlayingModel called');
    print(nowPlayingModel!.results!.length);
    update();
  }

  @override
  void onInit() {
    fetchMyModelData();
    fetchPopularMovieData();
    fetchNowPlayingMovieData();
    super.onInit();
  }

}