import 'package:flutter/material.dart';
import 'package:signal_chat/colors.dart';
import 'package:signal_chat/screens/welcome_screen.dart';
import 'package:signal_chat/screens/login_screen.dart';
import 'package:signal_chat/screens/registration_screen.dart';
import 'package:signal_chat/screens/chat_screen.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]).then((_)=> runApp(FlashChat()));
}

class FlashChat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: PalletteColors.lightSkin,
        primaryColor: PalletteColors.primaryRed,

        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id:(context)=> WelcomeScreen(),
        ChatScreen.id:(context) => ChatScreen(),
        LoginScreen.id:(context) => LoginScreen(),
        RegistrationScreen.id:(context) => RegistrationScreen(),
      },
    );
  }
}
