import 'package:get/get_state_manager/get_state_manager.dart';
class Home_ViewModel extends GetxController
{

  int navigatorValue=0;
  void changeSelectedValue(int selectedValue){
    navigatorValue= selectedValue;
    update();
  }

}