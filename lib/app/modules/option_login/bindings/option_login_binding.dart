import 'package:get/get.dart';

import '../controllers/option_login_controller.dart';

class OptionLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OptionLoginController>(
      () => OptionLoginController(),
    );
  }
}
