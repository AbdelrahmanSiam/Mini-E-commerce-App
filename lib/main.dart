import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini_ecommerce/core/constants/constant.dart';
import 'package:mini_ecommerce/core/di/setup_service_locator.dart';
import 'package:mini_ecommerce/core/router/app_router.dart';
import 'package:mini_ecommerce/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(boxName);
  setupServiceLocator();
  runApp(const MiniECommerce());
}

class MiniECommerce extends StatelessWidget {
  const MiniECommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(),
      routerConfig: AppRouter.router,
    );
  }
}
