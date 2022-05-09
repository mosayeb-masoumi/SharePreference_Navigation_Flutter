import 'package:flutter/material.dart';
import 'package:navigation_drawer_flutter/app_share_preference.dart';
import 'package:navigation_drawer_flutter/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharePreference.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
