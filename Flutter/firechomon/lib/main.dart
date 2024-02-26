import 'package:firechomon/provider/auth_provider.dart';
import 'package:firechomon/screens/login_screen.dart';
import 'package:firechomon/screens/register_screen.dart';
import 'package:firechomon/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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