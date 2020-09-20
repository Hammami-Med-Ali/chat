import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat/chat.dart';
import 'package:chat/main.dart';


class Registration extends StatefulWidget {

  static const String id = "REGISRATION";

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  String email;
  String password;

  final FirebaseAuth _aut = FirebaseAuth.instance;

  Future<void> registerUser() async {
    FirebaseUser user = (await _aut.createUserWithEmailAndPassword(
      email: email,
      password: password,
    )).user;

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Chat(user: user),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Chat"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Container(
                width: 120,
                child: Image.asset("assets/images/chat.png"),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => email = value,
            decoration: InputDecoration(
                hintText: "Enter your Email....",
                border: const OutlineInputBorder()
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            autocorrect: false,
            obscureText: true,
            onChanged: (value) => password = value,
            decoration: InputDecoration(
                hintText: "Enter your Password....",
                border: const OutlineInputBorder()
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CustomButton(
            text: "Registration",
            callback: () async {
              await registerUser();
            },
          )
        ],
      ),
    );
  }
}

