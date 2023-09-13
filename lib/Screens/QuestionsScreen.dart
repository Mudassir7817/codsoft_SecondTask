import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Utils/MyColors.dart';

import '../Provider/provider.dart';

List usersanswers = [];
int score = 0;

// ignore: must_be_immutable
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    final questions = Provider.of<Questions>(context);
    final document = questions.document;
    final curquestion = questions.currentQuestion;
    Size mq = MediaQuery.of(context).size;
    final subname = document?['subname'] ?? 'Noname';
    // final questionlist = widget.document['questions'];

    // final question = questionlist.isNotEmpty ? questionlist[0] : 'No Questions';
    return Scaffold(
        backgroundColor: MyColors.appbarColor,
        body: Stack(
          children: [
            Positioned(
              top: 100,
              left: 25,
              child: Text(
                subname,
                style: const TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 150,
              left: 25,
              child: Text(
                'Questions: $curquestion/10',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 250,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                height: 600,
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Container(
                      height: 250,
                      width: 330,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: MyColors.backgroundColor),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          questions.quizCompleted
                              ? 'You Have Completed The quiz\n Your Score: $score'
                              : questions.getCurrentQuestion(),
                          style: const TextStyle(fontSize: 18),
                        ),
                      )),
                    ),
                    SizedBox(
                      height: mq.height * 0.1,
                    ),
                    Positioned(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 120,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                shape: MaterialStateProperty.all(
                                    const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(18)))),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 138, 214, 223))),
                            onPressed: () {
                              usersanswers.add('Yes');
                              questions.moveToNextQuestion();
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  shape: MaterialStateProperty.all(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(18)))),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromARGB(
                                          255, 255, 119, 110))),
                              onPressed: () {
                                usersanswers.add('No');
                                questions.moveToNextQuestion();
                              },
                              child: const Text(
                                'No',
                                style: TextStyle(fontSize: 18),
                              )),
                        )
                      ],
                    )),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
