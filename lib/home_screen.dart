import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'button.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Calculator',
              style: GoogleFonts.anton(
                textStyle: const TextStyle(
                  color: Color(0xFFf6380b),
                  fontSize: 50,
                ),
              )),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        answer.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 60),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        userInput.toString(),
                        style: const TextStyle(
                            color: Color(0xFFbebebe), fontSize: 28),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 2,
                  height: 50,
                ),
                Column(
                  children: [
                    Row(children: [
                      Button(
                        number: 'AC',
                        onPress: () {
                          userInput = '';
                          answer = '';
                          setState(() {});
                        },
                      ),
                      Button(
                        number: '+/-',
                        onPress: () {
                          userInput += '+/-';
                          setState(() {});
                        },
                      ),
                      Button(
                        number: '%',
                        onPress: () {
                          userInput += '%';
                          setState(() {});
                        },
                      ),
                      Button(
                        number: '/',
                        onPress: () {
                          userInput += '/';
                          setState(() {});
                        },
                        color: const Color(0xFFff9a0c),
                      ),
                    ]),
                    Row(
                      children: [
                        Button(
                          number: '7',
                          onPress: () {
                            userInput += '7';
                            setState(() {});
                          },
                        ),
                        Button(
                          number: '8',
                          onPress: () {
                            userInput += '8';
                            setState(() {});
                          },
                        ),
                        Button(
                          number: '9',
                          onPress: () {
                            userInput += '9';
                            setState(() {});
                          },
                        ),
                        Button(
                          number: '*',
                          onPress: () {
                            userInput += '*';
                            setState(() {});
                          },
                          color: const Color(0xFFff9a0c),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                          number: '4',
                          onPress: () {
                            userInput += '4';
                            setState(() {});
                          },
                        ),
                        Button(
                          number: '5',
                          onPress: () {
                            userInput += '5';
                            setState(() {});
                          },
                        ),
                        Button(
                          number: '6',
                          onPress: () {
                            userInput += '6';
                            setState(() {});
                          },
                        ),
                        Button(
                          number: '-',
                          onPress: () {
                            userInput += '-';
                            setState(() {});
                          },
                          color: const Color(0xFFff9a0c),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                          number: '1',
                          onPress: () {
                            userInput += '1';
                            setState(() {});
                          },
                        ),
                        Button(
                          number: '2',
                          onPress: () {
                            userInput += '2';
                            setState(() {});
                          },
                        ),
                        Button(
                          number: '3',
                          onPress: () {
                            userInput += '3';
                            setState(() {});
                          },
                        ),
                        Button(
                          number: '+',
                          onPress: () {
                            userInput += '+';
                            setState(() {});
                          },
                          color: const Color(0xFFff9a0c),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                          number: '0',
                          onPress: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        Button(
                          number: '.',
                          onPress: () {
                            userInput += '.';
                            setState(() {});
                          },
                        ),
                        Button(
                          number: 'DEL',
                          onPress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          },
                        ),
                        Button(
                          number: '=',
                          color: const Color(0xFFff200c),
                          onPress: () {
                            equalPress();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void equalPress() {
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
