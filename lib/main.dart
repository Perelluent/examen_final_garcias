import 'package:examen_final_garcias/providers/login_provider.dart';
import 'package:examen_final_garcias/screens/home_screen.dart';
import 'package:examen_final_garcias/screens/login_page.dart';
import 'package:examen_final_garcias/services/plats_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppState());
}
//void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PlatsService>(create: (_) => PlatsService()),
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ProvaExamen',
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginPage(),
        'home': (_) => HomeScreen(),
        //'product': (_) => PlatDetailScreen()
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.white,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
      ),
    );
  }
}