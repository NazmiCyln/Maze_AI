import 'package:auto_route/auto_route.dart';

import '../features/home/presentation/pages/chat_and_image_page.dart';
import '../features/home/presentation/pages/chat_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../splash_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Page|Screen|View|Widget,Route")
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ChatRoute.page),
        AutoRoute(page: ChatAndImageRoute.page),
      ];
}
