import 'package:cartesian/widgets/back_press.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

import '../provider/accuracy.dart';

class MMToLine extends StatefulWidget {
  const MMToLine({super.key});

  @override
  State<MMToLine> createState() => _MMToLineState();
}

class _MMToLineState extends State<MMToLine> {
  final mmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: (size.width / 2) - 50,
            height: size.height * 0.35,
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
                        controller: mmController,
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
                          labelText: 'Distance(in mm):',
                        ),
                        onChanged: (value) {
                          if (double.parse(value) > 200 ||
                              double.parse(value) < 0) {
                            mmController.text = 0.toString();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Disatnce should not be greater than 200',
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    Text(
                        "Pulse : ${context.watch<AccuracyProvider>().getPulse}"),
                    SizedBox(
                      width: size.width * 0.32,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                        ),
                        onPressed: () async {
                          http.Response response = await http.post(
                            Uri.parse('http://127.0.0.1:5000/mmToPulse'),
                            body: {
                              // "line": lineController.text,
                              "mm": mmController.text,
                              // "x": xController.text,
                              // "y": yController.text,
                            },
                          );

                          print(response.body);
                          // ignore: use_build_context_synchronously
                          context.read<AccuracyProvider>().pulseCall();
                          // fetchPulseData();
                        },
                        child: const Text(
                          'Start',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: const BackPress(),
    );
  }
}
