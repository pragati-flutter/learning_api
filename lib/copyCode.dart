import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyGame extends StatefulWidget {
  const MyGame({super.key});

  @override
  State<MyGame> createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  int count = 0;
  int num = 0;
  int score = 0;
  int? gameNumber;

  math.Random random = math.Random();

  int generateRandomNumber() {
    return random.nextInt(1000);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();

  }

  void numberMatch() {
    if (textEditingController.text != "") {
      setState(() {
        count++;
        //   score++;
      });
      if (count <= 10) {
        setState(() {
          gameNumber = generateRandomNumber();
        });

        if (gameNumber == textEditingController.text) {
          setState(() {
            score++;
          });
        }
        print(textEditingController.text);

        if (textEditingController.text == "6") {
          setState(() {
            score++;
          });
        }

        if (score == 2) {
          num = 2;
          count = 0;
          gameNumber = 0;
          score = 0;
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.pink.shade50,
                      ),
                      height: 300,
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("Congratulations you won!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.green)),
                            Text("Yours score is $num",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.green)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      exit(0);
                                    },
                                    child: const Text(
                                      "Quit",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      valuechange();
                                    },
                                    child: const Text("Retry",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24)))
                              ],
                            )
                          ],
                        ),
                      ),
                    ));
              });
        }
      } else {
        gameNumber = 0;
        count = 10;
        if (count >= 10) {
          count = 0;
          score = 0;
          gameNumber = 0;
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.pink.shade50,
                      ),
                      height: 300,
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("Your attempt is over",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.green)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      exit(0);
                                    },
                                    child: const Text(
                                      "Quit",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      valuechange();
                                    },
                                    child: const Text("Retry",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24)))
                              ],
                            )
                          ],
                        ),
                      ),
                    ));
              });
        }
      }
    } else {
      print("Plese enter some value");
    }
  }

  void valuechange() {
    Navigator.of(context).pop();
    count = 0;
    score = 0;
  }

  TextEditingController textEditingController = TextEditingController();

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
                  Text("score: $score",
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
                    numberMatch();
                    textEditingController.clear();
                  },
                  child: const Text("Summit")),
            ],
          ),
        ),
      ),
    );
  }
}
