import 'package:cartesian/widgets/back_press.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

import '../provider/accuracy.dart';

class LineToPulse extends StatefulWidget {
  const LineToPulse({super.key});

  @override
  State<LineToPulse> createState() => _LineToPulseState();
}

class _LineToPulseState extends State<LineToPulse> {
  final pulsesController = TextEditingController();
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
                        controller: pulsesController,
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
                          labelText: 'Pulses:',
                        ),
                        onChanged: (value) {
                          if (double.parse(value) > 200000 ||
                              double.parse(value) < 0) {
                            pulsesController.text = 0.toString();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Pulse should not be greater than 200000',
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    Text(
                      "Distance(mm): ${context.watch<AccuracyProvider>().getMM}",
                    ),
                    SizedBox(
                      width: size.width * 0.32,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                        ),
                        onPressed: () async {
                          try {
                            http.Response response = await http.post(
                              Uri.parse('http://127.0.0.1:5000/pulseToLine'),
                              body: {
                                // "pulse": pulseController.text,
                                "pulses": pulsesController.text,
                                // "x": xController.text,
                                // "y": yController.text,
                              },
                            );

                            print(response.body);
                          } catch (e) {
                            print(e);
                          }
                          // ignore: use_build_context_synchronously
                          context.read<AccuracyProvider>().mmCall();
                          // fetchMMData();
                        },
                        child: const Text(
                          'Start',
                        ),
                      ),
                    ),

                    // SizedBox(
                    //   width: size.width * 0.32,
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       elevation: 5.0,
                    //     ),
                    //     onPressed: () async {
                    //       http.Response response = await http.post(
                    //         Uri.parse('http://127.0.0.1:5000/homing'),
                    //       );

                    //       print(response.body);
                    //     },
                    //     child: const Text(
                    //       'Homing',
                    //     ),
                    //   ),
                    // ),
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
