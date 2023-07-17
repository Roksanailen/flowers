import '../home_viewModel.dart';
import 'package:get/get.dart';

class binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Home_ViewModel());

  }

 }