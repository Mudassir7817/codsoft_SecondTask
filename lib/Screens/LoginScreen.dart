import 'package:flutter/material.dart';
import 'package:quiz_app/Routes.dart';
import 'package:quiz_app/Utils/MyColors.dart';

import '../API/API.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  'assets/vecteezy_flat-isometric-illustration-concept-man-filling-out-a_7885704.jpg'),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Username',
                      fillColor: Colors.grey[100],
                      filled: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      fillColor: Colors.grey[100],
                      filled: true),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              MyColors.SignInButtonColor),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)))),
                      onPressed: () {},
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 18),
                      ))),
              const SizedBox(height: 40),
              const Divider(),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            MyColors.SignInButtonColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)))),
                    onPressed: () {
                      _onSignIn(context);
                    },
                    child: const Text(
                      'Google SignIn',
                      style: TextStyle(fontSize: 18),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onSignIn(BuildContext context) {
    API.signInWithGoogle().then((user) {
      if (user != null) {
        Navigator.pushNamed(context, MyRoutes.homeroute);
      }
    });
  }
}
