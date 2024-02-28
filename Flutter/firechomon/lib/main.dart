import 'package:firechomon/provider/auth_provider.dart';
import 'package:firechomon/screens/login_screen.dart';
import 'package:firechomon/screens/register_screen.dart';
import 'package:firechomon/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider(),),
      ],
      child: MaterialApp(
        title: 'Material App',
        initialRoute: '/',
        routes: {
          '/' :(context) => Wrapper(),
          '/login' :(context) => LoginScreen(),
          '/register':(context) => RegisterScreen(),
        },
      ),
    );
  }
}