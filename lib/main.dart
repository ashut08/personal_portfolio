import 'package:AshuTech/utils/theme_style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/view/pages/splash_screen.dart';
import 'package:provider/provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //loadEmailJsSecretKey();

  runApp(const MyApp());
  // Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  //     .then((value) => runApp(const MyApp()));
}

loadEmailJsSecretKey() async {
  await dotenv.load(fileName: ".env");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Builder(builder: (context) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          // You can toggle between light and dark themes here
          darkTheme: ThemeData.dark(),
          themeMode:
              themeProvider.lightTheme ? ThemeMode.light : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          title: 'AshuTech',
          theme: ThemeStyles.themeData(themeProvider.lightTheme, context),
          home: const SplashScreen(),
        );
      }),
    );
  }
}
