import 'package:cartesian/widgets/back_press.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SquareExperiment extends StatefulWidget {
  const SquareExperiment({super.key});

  @override
  State<SquareExperiment> createState() => _SquareExperimentState();
}

class _SquareExperimentState extends State<SquareExperiment> {
  var sideController = TextEditingController(text: 100.toString());
  var xPosController =
      TextEditingController(text: 100.toString()); //text: 300.toString()
  var yPosController =
      TextEditingController(text: 50.toString()); //text: 210.toString()
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: (size.width / 2) - 50,
            height: size.height * 0.45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      // alignment: Alignment.center,
                      width: 400,
                      height: 40,
                      child: TextFormField(
                        controller: sideController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              25,
                            ),
                            borderSide: const BorderSide(
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                              25,
                            ),
                          ),
                          labelText: 'Side:',
                        ),
                      ),
                    ),
                    SizedBox(
                      // alignment: Alignment.center,
                      width: 400,
                      height: 40,
                      child: TextFormField(
                        controller: xPosController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              25,
                            ),
                            borderSide: const BorderSide(
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                              25,
                            ),
                          ),
                          labelText: 'X Position:',
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty &&
                              (int.parse(value) +
                                      int.parse(sideController.text)) >
                                  200) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Sum of Side & X should not be greater than 200',
                                ),
                              ),
                            );

                            xPosController.text = 0.toString();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      // alignment: Alignment.center,
                      width: 400,
                      height: 40,
                      child: TextFormField(
                        controller: yPosController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              25,
                            ),
                            borderSide: const BorderSide(
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                              25,
                            ),
                          ),
                          labelText: 'Y Position:',
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty &&
                              (int.parse(value) +
                                      int.parse(sideController.text)) >
                                  200) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Sum of Side & Y should not be greater than 200',
                                ),
                              ),
                            );

                            yPosController.text = 0.toString();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.32,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                        ),
                        onPressed: () async {
                          http.Response response = await http.post(
                            Uri.parse('http://127.0.0.1:5000/drawSquare'),
                            body: {
                              "x": xPosController.text,
                              "y": yPosController.text,
                              "side": sideController.text,
                              "sqrt": 1.toString(),
                            },
                          );

                          print(response.body);
                        },
                        child: const Text(
                          'Start',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: const BackPress(),
    );
  }
}
