import 'package:flutter/material.dart';

Widget bulidLoginPage() {
  var emailtextcontroller = TextEditingController();
  var passwordtextcontroller = TextEditingController();
  return ListView(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Image.asset('images/login2.gif'),
      ),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextField(
            textAlign: TextAlign.center,
            controller: emailtextcontroller,
            decoration: InputDecoration(hintText: 'enter your email'),

          ),

        ),


      ),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            textAlign: TextAlign.center,
            controller: passwordtextcontroller,
            decoration: InputDecoration(hintText: 'enter your password'),

          ),

        ),


      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ElevatedButton(
            onPressed: () {

            },
          child: Text('login'),


        ),
      ),

    ],




  );
}