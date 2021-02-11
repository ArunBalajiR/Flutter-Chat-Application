import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signal_chat/tabbutton_widget.dart';
import 'package:signal_chat/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'chat_screen.dart';
class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String password;
  String email;
  final _auth = FirebaseAuth.instance;


  bool _obscureText = true;

  void _toggle(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      constraints: BoxConstraints.expand(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text("Login with email"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: ListView(

            children: <Widget>[
              SizedBox(
                height: 70.0,
              ),
              Hero(
                tag: 'logo',
                child: Container(
                  height: 100.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                child: emailInput(),
              ),
              SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                child: passInput(),
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                child: Hero(
                  tag: "button2",
                  child: TabButton(
                    btnColor: PalletteColors.primaryRed,
                    btnTxtColor: Colors.white,
                    btnText: "Log In",
                    btnFunction: () async {
                      try{
                        final loggedInUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
                        if(loggedInUser != null){
                          Navigator.pushNamed(context, ChatScreen.id);

                        }
                      }catch(e){
                        print(e);
                      }

                    },
                  ),
                ),
              ),

              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account ?",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, PageTransition(
                          type: PageTransitionType.fade, child: LoginScreen()));
                    },
                    child: Text(
                      " Sign Up",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: PalletteColors.primaryRed,
                      ),
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
  Widget emailInput() {
      return Theme(
        child: TextField(
          onChanged: (value){
            email = value;
          },
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),

          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Email ID",
            prefixIcon: Icon(Icons.mail_outline),
            labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(
                  color: Colors.red,
                )
            ),
          )
          ,


          textInputAction: TextInputAction.next,
        ),
        data: Theme.of(context)
            .copyWith(accentColor: PalletteColors.primaryRed,),
      );
    }

    Widget passInput() {

      return Theme(
        data: Theme.of(context)
            .copyWith(accentColor: PalletteColors.primaryRed,),
        child: TextField(
          onChanged: (value){
            password = value;
          },
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.vpn_key,),
            labelText: "Password",
            labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(
                  color: Colors.red,
                )
            ),
            suffixIcon: IconButton(
              icon: Icon(

                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: PalletteColors.primaryGrey,
              ),
              onPressed: _toggle,
            ),
          ),
          textInputAction: TextInputAction.done,
          obscureText: _obscureText,
        ),
      );
    }


  }



