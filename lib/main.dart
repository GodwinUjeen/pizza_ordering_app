import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pizzato/Helpers/Footer.dart';
import 'package:pizzato/Helpers/Headers.dart';
import 'package:pizzato/Helpers/Middle.dart';
import 'package:pizzato/Providers/Authentication.dart';
import 'package:pizzato/Providers/Calculations.dart';
import 'package:pizzato/Services/ManageData.dart';
import 'package:pizzato/Services/ManageMaps.dart';
import 'package:pizzato/Views/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Headers()),
        ChangeNotifierProvider.value(value: MiddleHelpers()),
        ChangeNotifierProvider.value(value: ManageData()),
        ChangeNotifierProvider.value(value: Footers()),
        ChangeNotifierProvider.value(value: GenerateMaps()),
        ChangeNotifierProvider.value(value: Authentication()),
        ChangeNotifierProvider.value(value: Calculations()),
      ],
      child: MaterialApp(
        title: 'Pizzato',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          primaryColor: Colors.orangeAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
