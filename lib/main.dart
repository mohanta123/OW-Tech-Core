import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'buyer_side/account/splash_screen.dart';
import 'buyer_side/models/user.dart';


const mainBackupColor = Color.fromARGB(255, 0, 153, 38);
const secondaryBackupColor = Color.fromARGB(255, 95, 228, 117);
const backgrColor = Color.fromARGB(255, 205, 255, 236);

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: SplashScreen(),
      home: SplashScreen(),
    );
  }
}
