import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/LoginScreen.dart';

import 'MyColors.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    Size mq = MediaQuery.of(context).size;
    return Container(
        height: mq.height * 0.12,
        color: MyColors.appbarColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(
                  height: 170,
                  width: 15,
                ),
                Align(
                  alignment: const Alignment(0, 0.5),
                  child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset('assets/quizAppIcon.png')),
                ),
                const SizedBox(
                  width: 3,
                ),
                const Align(
                  alignment: Alignment(0, 0.5),
                  child: Text(
                    'QuizWiz',
                    style: TextStyle(fontSize: 24, color: MyColors.textColor),
                  ),
                ),
              ],
            ),
            Align(
              alignment: const Alignment(0, 0.8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                        ),
                        const Icon(
                          Icons.bar_chart_rounded,
                          color: MyColors.iconColor,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            auth.signOut().then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            });
                          },
                          child: const Icon(
                            Icons.person,
                            color: MyColors.iconColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
