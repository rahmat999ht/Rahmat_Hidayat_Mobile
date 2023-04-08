import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  const EnvironmentsBadge({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.STRUCK,
      page: () => const StruckScreen(),
      binding: StruckControllerBinding(),
    ),
    GetPage(
      name: Routes.PAGE_CRUD,
      page: () => const PageCrudScreen(),
      binding: PageCrudControllerBinding(),
    ),
    GetPage(
      name: Routes.FORM_INPUT,
      page: () => const FormInputScreen(),
      binding: FormInputControllerBinding(),
    ),
  ];
}
