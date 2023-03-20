
import 'package:flutter/material.dart';
import 'package:group_chat/buttons.dart';
import 'package:group_chat/constants.dart';
import 'package:group_chat/login_screen.dart';
import 'package:group_chat/registration.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  
  static const String id ='wellcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController  controller;
  late Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
    animation=ColorTween(begin: Colors.blueGrey,end: Colors.white).animate(controller);
   
  //  animation=CurvedAnimation(parent: controller,curve: Curves.easeIn);
    controller.forward();
    // animation.addStatusListener((status) { 
    //     if(status==AnimationStatus.completed){
    //       controller.reverse(from: 1);
    //     }
    //     else if(status==AnimationStatus.dismissed){
    //       controller.forward();
    //     }
    // });
  controller.addListener(() {
    setState(() {
    });
  });
  }
  @override
  void dispose() {
    //TODO: implement dispose
    super.dispose();
    //this method disposes the controller when we are in other screen because it is costy animating the animation while we are in another screen
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                // adding typewriterAnimatedText to text
                TypewriterAnimatedTextKit(
                  text: [
                    'Group Chat'
                  ],
                  speed: Duration(milliseconds: 1000),
                  textStyle: TextStyle( fontSize: 45.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,),
                 ),
              
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Buttons(buttonType: 'Login', route: LoginScreen.id,color: loginButton,),
            Buttons(buttonType: 'Register', route: RegistrationScreen.id,color: registerButton,),
            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 16.0),
            //   child: Material(
            //     elevation: 5.0,
            //     color: Colors.lightBlueAccent,
            //     borderRadius: BorderRadius.circular(30.0),
            //     child: MaterialButton(
            //       onPressed: () {
            //         //Go to login screen.
            //         Navigator.pushNamed(context, LoginScreen.id);
            //       },
            //       minWidth: 200.0,
            //       height: 42.0,
            //       child: Text(
            //         'Log In',
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 16.0),
            //   child: Material(
            //     color: Colors.blueAccent,
            //     borderRadius: BorderRadius.circular(30.0),
            //     elevation: 5.0,
            //     child: MaterialButton(
            //       onPressed: () {
            //         //Go to registration screen.
            //         Navigator.pushNamed(context, RegistrationScreen.id);
            //       },
            //       minWidth: 200.0,
            //       height: 42.0,
            //       child: Text(
            //         'Register',
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
