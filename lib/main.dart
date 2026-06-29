import 'package:box_keeper_app/app/model/hive_models/Boxes_model.dart';
import 'package:box_keeper_app/app/view/splashScreenView/splash_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var path = await getApplicationDocumentsDirectory();
  Hive.init(path.path);
  Hive.registerAdapter(BoxesModelAdapter());
  await Hive.openBox<BoxesModel>('BoxesData');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'box_keeper_app',
      debugShowCheckedModeBanner: false,
      home: SplashScreenView(),
    );
  }
}
