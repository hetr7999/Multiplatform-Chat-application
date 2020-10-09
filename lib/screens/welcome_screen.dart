import 'package:chat_flutter/screens/login_screen.dart';
import 'package:chat_flutter/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_flutter/screens/commonButton.dart';
//TODO: animation using custom packages
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcomeScreen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  //TODO:(For custom animation) if we want to animate just oe thing then add SingleTickerProviderStateMixin and then AnimationController
  AnimationController controller;
  //TODO:(For custom animation) if we want to use curved animation refer to website on flutter/animation/curve-class
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //TODO: initializing this animation
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      //upperBound:100.0, //TODO: (% animation or increasing height animation) usually used in loading screen//note the pper bound must always be <= 1.0
    );
    //for curved animation
    /*animation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );*/
    //just dispose this kind of continuous animation since they end up using resources/ draining battery in background to do that use dispose

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward(); //add this for starting the ticker

    //for continuously doing some sort of animation
    /*animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.forward();
      } else if (status == AnimationStatus.dismissed) {
        controller.reverse(from: 1.0);
      }
    });*/

    controller.addListener(() {
      setState(() {}); //this is just to view the changes
      print(controller.value);
    });
  }

  //used to dispose the controller
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.red.withOpacity(controller.value),//TODO: (background animation)for animating background
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
                  tag: "logo",
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),

                //TODO: Just change the text widget to required widget form documentation
                TypewriterAnimatedTextKit(
                  //'${controller.value.toInt()}%', //TODO: (% animation)for showing % changes
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            CommonButton(
              name: "Log In",
              color: Colors.lightBlueAccent,
              onPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            CommonButton(
              name: 'Register',
              color: Colors.blueAccent,
              onPressed: () {
                //Go to registration screen.
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
