import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotel/firebase/firebase_options.dart';
import 'package:hotel/screen/home/pages/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
   await FlutterConfig.loadEnvVariables();// Add this line
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  runApp(const ProviderScope(child:MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xfff6f6f6),),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      
    );
  }
}

 