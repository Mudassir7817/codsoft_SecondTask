import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Screens/QuestionsScreen.dart';
import 'package:quiz_app/Utils/MyColors.dart';

import '../Provider/provider.dart';
import '../Utils/MyAppbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    final Stream<QuerySnapshot> datastream =
        FirebaseFirestore.instance.collection('Users').snapshots();
    const appbar = MyAppBar();
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Column(
        children: [
          appbar,
          const Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 46.0, left: 20),
                  child: Text(
                    'Subjects',
                    style: TextStyle(fontSize: 26),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: datastream,
              builder: (context, snapshot) {
                final documents = snapshot.data?.docs;
                return ListView.builder(
                  itemCount: documents?.length ?? 0,
                  itemBuilder: (context, index) {
                    final document = documents![index];
                    final subname = document['subname'] ?? 'Noname';
                    final iscompleted = document['iscompleted'] ?? 'Noname';
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, right: 8.0),
                      child: SizedBox(
                        height: 100,
                        child: Stack(children: [
                          Card(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            child: ListTile(
                                title: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 4.0, bottom: 0),
                                    child: Text(
                                      subname,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(-1, 0.5),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          elevation:
                                              MaterialStateProperty.all(0),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  const Color.fromARGB(
                                                      255, 255, 119, 110)),
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.zero),
                                          minimumSize:
                                              MaterialStateProperty.all(
                                                  const Size(85, 32))),
                                      onPressed: () {
                                        final provider = Provider.of<Questions>(
                                            context,
                                            listen: false);
                                        provider.setDocument(document);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const QuestionsScreen(),
                                            ));
                                      },
                                      child: const Text(
                                        'Start Test',
                                      )),
                                ),
                              ],
                            )),
                          ),
                          Positioned(
                            top: 0,
                            left: mq.width * 0.88,
                            child: Container(
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 7,
                                        offset: const Offset(0, 2))
                                  ]),
                              child: iscompleted
                                  ? const Center(
                                      child: Icon(
                                      Icons.done_outline_rounded,
                                      size: 18,
                                      color: Colors.green,
                                    ))
                                  : const Center(
                                      child: Icon(
                                      Icons.play_arrow_rounded,
                                      size: 22,
                                      color: Color.fromARGB(255, 255, 119, 110),
                                    )),
                            ),
                          )
                        ]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
