import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyGame extends StatefulWidget {
  const MyGame({super.key});

  @override
  State<MyGame> createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  TextEditingController textEditingController = TextEditingController();
  int count = 0;
  int num = 0;
  int score = 0;
  int? gameNumber;

  math.Random random = math.Random();

  int generateRandomNumber() {
    return random.nextInt(3000);
  }

  int randomNo = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }

  void numberMatch() {
    setState(() {
      count++;
    });
    if (count < 10) {
      randomNo = generateRandomNumber();
      setState(() {
        gameNumber = randomNo;
      });

      if (textValueAsInteger().toString().length ==
          gameNumber.toString().length) {
        setState(() {
          ++score;
        });
      }
    } else {
      showDialogs();
    }
  }

  void showDialogs() {
    String value = " ";

    if (score >= 2) {
      value = "Hey congratulations you win";
    } else {
      value = "Sorry you loss";
    }

    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 200,
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "$value and your score is ${score*2}",
                      style: const TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: reTry,
                            child: Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.pinkAccent.shade100),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      top: 8.0, left: 15.0, right: 8),
                                  child: Text(
                                    "Retry",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ))),
                        TextButton(
                            onPressed: () {
                              exit(0);
                            },
                            child: Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.pinkAccent.shade100),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      top: 8.0, left: 15.0, right: 8),
                                  child: Text(
                                    "Quit",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ))),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  int textValueAsInteger() {
    if (textEditingController.text.isNotEmpty) {
      try {
        return int.parse(textEditingController.text);
      } catch (e) {
        debugPrint(e.toString());
        return 0;
      }
    }
    return 0;
  }

  void reTry() {
    Navigator.of(context).pop();
    setState(() {
      count = 0;
      score = 0;
      gameNumber = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 50,
                child: Text("Welcome buddy",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "count:$count",
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  ),
                  Text("score: ${score * 2}",
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple)),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  hintText: "Enter three digit number",
                  border: OutlineInputBorder(),
                ),
              ),
              Text(
                "Game number : ${gameNumber ?? 0}",
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 150,
              ),
              TextButton(
                  onPressed: () {
                    if (textValueAsInteger() >= 100 &&
                        textValueAsInteger() <= 999) {
                      numberMatch();

                      textEditingController.clear();
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  width: 200,
                                  height: 200,
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        top: 30, left: 10, right: 8),
                                    child: Text(
                                      "Please enter three digit input",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: Colors.pinkAccent),
                                    ),
                                  )),
                            );
                          });
                    }
                  },
                  child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.pinkAccent.shade100),
                      child: const Padding(
                        padding:
                            EdgeInsets.only(top: 8.0, left: 15.0, right: 8),
                        child: Text(
                          "Summit",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
