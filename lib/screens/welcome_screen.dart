import 'package:flutter/material.dart';
import 'package:signal_chat/screens/login_screen.dart';
import 'package:signal_chat/screens/registration_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signal_chat/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:signal_chat/tabbutton_widget.dart';


class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animationcurve;

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = AnimationController(
        duration: Duration(seconds: 5),
        vsync: this,

      );
      animationcurve =
          CurvedAnimation(parent: controller, curve: Curves.decelerate);
      controller.forward();

      controller.addListener(() {
        setState(() {

        });
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(animationcurve.value / 2),
                BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(

                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset('images/logo.png'),
                        height: 120.0,
                      ),
                    ),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 10),
                child: Text(
                    "Instantly chat with friends",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(color: Colors.white,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900),
                    )
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 0.8),
                child: Text(
                    "Shaping the future through chat.Keep your favourites a touch away",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white, fontSize: 18.0, height: 1.5),
                    )
                ),

              ),
              SizedBox(
                height: 22.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                child: Hero(
                  tag: "button",
                  child: TabButton(
                    btnColor: PalletteColors.primaryRed,
                    btnTxtColor: Colors.white,
                    btnText: "Create new account",

                    btnFunction: () {
                      Navigator.push(context, PageTransition(
                          type: PageTransitionType.fade,
                          child: RegistrationScreen()));
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                child: Hero(
                  tag: "button2",
                  child: TabButton(
                    btnColor: PalletteColors.lightBlue,
                    btnTxtColor: Colors.black,
                    btnText: "Login with email",

                    btnFunction: () {
                      Navigator.push(context, PageTransition(
                          type: PageTransitionType.fade, child: LoginScreen()));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 28.0,
              ),
              touchID(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 20.0),
                    child: Text(
                        "©2021,ArunBalajiR",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.white, fontSize: 10.0),
                        )
                    ),

                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget touchID() {
    return Container(
        margin: EdgeInsets.only(top: 10, bottom: 20),
        child: Column(
          children: <Widget>[

            SizedBox(
              height: 20,
            ),
            Icon(Icons.fingerprint, size: 60, color: Colors.white),
            SizedBox(
              height: 20,
            ),
            Text(
              'Touch ID',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ));
  }
}

