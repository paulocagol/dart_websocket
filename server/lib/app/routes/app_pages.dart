import 'package:get_server/get_server.dart';

import 'package:server/app/modules/home/bindings/home_binding.dart';
import 'package:server/app/modules/home/views/home_view.dart';
import 'package:server/app/modules/socket/bindings/socket_binding.dart';
import 'package:server/app/modules/socket/views/socket_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.SOCKET,
      page: () => SocketView(),
      binding: SocketBinding(),
    ),
  ];
}
