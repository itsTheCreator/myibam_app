import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:myibam_app/routes/app_routes.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('fr_FR', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MyIBAM',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      getPages: AppRoutes.pages,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFEF6A4C)),
        primaryColor: const Color(0xFFEF6A4C),
        primaryColorLight: const Color(0xFF45A3C6),
      ),
    );
  }
}
