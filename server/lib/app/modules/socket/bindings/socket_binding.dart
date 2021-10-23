import 'package:get_server/get_server.dart';

import '../controllers/socket_controller.dart';

class SocketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SocketController>(
      () => SocketController(),
    );
  }
}
