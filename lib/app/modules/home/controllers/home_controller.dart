import 'package:get/get.dart';
import 'package:testing/app/network/ApiCall/dataApi.dart';

class HomeController extends GetxController {

  List dataList = [].obs;
  var isLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

 void getData() async {
    isLoaded(true);
    var data = await RemoteService().getPosts();
    if(data != null)
      dataList.assignAll(data);
    isLoaded(false);
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
