import 'package:cartesian/widgets/back_press.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class LetterDrawing extends StatefulWidget {
  const LetterDrawing({super.key});

  @override
  State<LetterDrawing> createState() => _LetterDrawingState();
}

class _LetterDrawingState extends State<LetterDrawing> {
  final letterController = TextEditingController();
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
                        controller: letterController,
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
                          labelText: 'Letter:',
                        ),
                        onChanged: (value) {
                          if (value.length > 1) {
                            setState(() {
                              letterController.text = value.characters.first;
                            });
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
                          http.Response homing = await http.post(
                            Uri.parse('http://127.0.0.1:5000/homing'),
                          );

                          print(homing.body);

                          http.Response response = await http.post(
                            Uri.parse('http://127.0.0.1:5000/drawWord'),
                            body: {
                              "text": letterController.text,
                            },
                          );

                          print(response.body);
                        },
                        child: const Text(
                          'Generate',
                        ),
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
                            Uri.parse('http://127.0.0.1:5000/drawImage'),
                          );

                          print(response.body);
                        },
                        child: const Text(
                          'Draw',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: const BackPress(),
    );
  }
}
