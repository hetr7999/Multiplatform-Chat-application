import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chat_flutter/screens/welcome_screen.dart';
import 'package:chat_flutter/screens/login_screen.dart';
import 'package:chat_flutter/screens/registration_screen.dart';
import 'package:chat_flutter/screens/chat_screen.dart';

//void main() => runApp(Chat());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Chat());
}

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //TODO: Hiding debug mode banner
      debugShowCheckedModeBanner: false,

      //TODO: navigating btwn multiple pages using named routes
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
