import 'package:flutter/material.dart';
import 'package:signal_chat/tabbutton_widget.dart';
import 'package:signal_chat/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'login_screen.dart';


class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  ScrollController _controller = ScrollController();
  FocusNode _focusNode = new FocusNode();
  bool _obscureText = true;

  @override
  void initState(){
    super.initState();
    _focusNode.addListener(_focusNodeListener);

  }

  @override
  void dispose(){
    _focusNode.removeListener(_focusNodeListener);
    super.dispose();
  }

  Future<Null> _focusNodeListener() async {
    if (_focusNode.hasFocus){
      print('TextField got the focus');
      _controller.addListener(() {
       if(_controller.position.pixels)
      });
    } else {
      print('TextField lost the focus');
    }
  }

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
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text("Create new account"),
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


            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 100.0,
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
                padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                child: Hero(
                  tag: "button",
                  child: TabButton(
                    btnText: "Sign up",
                    btnTxtColor: Colors.white,
                    btnColor: PalletteColors.primaryRed,
                    btnFunction: () {
                      //Implement registration functionality.
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
                      "Already have an account ?" ,
                      style : TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: LoginScreen()));
                    },
                    child: Text(
                      " Log In" ,
                      style : TextStyle(
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

  Widget emailInput(){
    return Theme(
      child: TextField(
          focusNode: _focusNode,
      
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
        ),


        textInputAction: TextInputAction.next,
      ),
      data: Theme.of(context)
          .copyWith(accentColor: PalletteColors.primaryRed,),
    );
  }

  Widget passInput(){
    return Theme(
      data: Theme.of(context)
          .copyWith(accentColor: PalletteColors.primaryRed,),
      child: TextField(
        // focusNode: _focusNode,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key,),
          labelText: "Password",
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
  // https://stackoverflow.com/questions/64836262/how-to-visible-hide-password-in-flutter
}
