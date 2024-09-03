import 'package:cartesian/widgets/back_press.dart';
import "package:flutter/material.dart";

import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class RectangleExperiment extends StatelessWidget {
  RectangleExperiment({super.key});

  var lengthController = TextEditingController(text: 80.toString());
  var breadthController = TextEditingController(text: 120.toString());
  var xPosController = TextEditingController(text: 70.toString());
  var yPosController = TextEditingController(text: 70.toString());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: (size.width / 2) - 50,
            height: size.height * 0.65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 400,
                      height: 40,
                      child: TextFormField(
                        controller: lengthController,
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
                          labelText: 'Length:',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      height: 40,
                      child: TextFormField(
                        controller: breadthController,
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
                          labelText: 'Breadth:',
                        ),
                      ),
                    ),
                    SizedBox(
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
                                      int.parse(lengthController.text)) >
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
                                      int.parse(breadthController.text)) >
                                  200) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Sum of Side & X should not be greater than 200',
                                ),
                              ),
                            );
                            yPosController.text = 0.toString();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                        ),
                        onPressed: () async {
                          http.Response response = await http.post(
                            Uri.parse('http://127.0.0.1:5000/drawRectangle'),
                            body: {
                              "x": xPosController.text,
                              "y": yPosController.text,
                              "length": lengthController.text,
                              "breadth": breadthController.text,
                            },
                          );

                          print(response.body);
                        },
                        child: const Text('Draw Rectangle'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: const BackPress(),
    );
  }
}
