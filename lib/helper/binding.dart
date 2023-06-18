import 'package:flutter_appflowers/home_viewModel.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get.dart';

class binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Home_ViewModel());

  }

 }