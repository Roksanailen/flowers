import 'package:get/get.dart';

import 'home_viewModel.dart';

class binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Home_ViewModel());

  }

}
