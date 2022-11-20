import 'package:flutter/material.dart';

TextEditingController _loginController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _formController = TextEditingController();
class AuthorizationWindow  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white24,
        body: SafeArea(
          child: SingleChildScrollView(
              reverse: true,
              child: Container(
                  child: Column(children: <Widget>[
                    _logo(),
                    _img(),
                    _selector(
                        "Кто вы ?", _formController, false, true, context),
                    _form('Login', () {}, context),
                  ]))),
        ));
  }

  Widget _img() {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: Container(
          child: Align(
            child: Image.asset(
              'assets/images/logo.png',
              width: 250,
              height: 250,
            ),
          )),
    );
  }

  Widget _logo() {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: Container(
          child: Align(
            child: Text(
              "STO HELPER",
              style: TextStyle(fontSize: 45, color: Colors.white),
            ),
          )),
    );
  }

  Widget _input(String hint, TextEditingController controller, bool obsecure,
      bool enabled) {
    return Container(
        height: 50,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          readOnly: enabled,
          controller: controller,
          obscureText: obsecure,
          style: TextStyle(fontSize: 25, color: Colors.white),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade500,
              hintStyle: TextStyle(fontSize: 20, color: Colors.black38),
              hintText: hint,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow.shade400, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.yellow.shade400,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              )),
        ));
  }

  void alert(BuildContext context) {
    var alertDialog = AlertDialog(

    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  Widget _button(String text, void func()) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        "Вход",
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow,
        minimumSize: const Size(150.0, 150.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  Widget _selector(String hint, TextEditingController controller, bool obsecure,
      bool enabled, BuildContext context) {
    return Container(
        height: 50,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextFormField(
          onTap: () {
            alert(context);
          },
          readOnly: enabled,
          controller: controller,
          obscureText: obsecure,
          style: TextStyle(fontSize: 25, color: Colors.white),
          decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.arrow_forward_ios,
                size: 25,
              ),
              filled: true,
              fillColor: Colors.grey.shade500,
              hintStyle: TextStyle(fontSize: 20, color: Colors.black38),
              hintText: hint,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow.shade400, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.yellow.shade400,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              )),
        ));
  }

  Widget _form(String label, void func(), BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(bottom: 20, top: 30),
              child: _input("Логин", _loginController, false, false)),
          Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child: _input("Пароль", _passwordController, true, false)),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Container(
              height: 60,
              width: 270,
              child: _button(label, func),
            ),
          )
        ],
      ),
    );
  }
}