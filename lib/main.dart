
import 'package:flutter/material.dart';
import 'package:group_chat/chat_screen.dart';
import 'package:group_chat/login_screen.dart';
import 'package:group_chat/registration.dart';
import 'package:group_chat/wellcome_screen.dart';
void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen .id,
      routes: {
        WelcomeScreen.id:(context) => WelcomeScreen(),
        RegistrationScreen.id:(context) => RegistrationScreen(),
        LoginScreen.id:(context) => LoginScreen(),
        ChatScreen.id:(context) => ChatScreen(),
      },
    );
  }
}
