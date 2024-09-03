import 'package:cartesian/provider/accuracy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'back_press.dart';

class PositionFirstExperiment extends StatefulWidget {
  const PositionFirstExperiment({super.key});

  @override
  State<PositionFirstExperiment> createState() =>
      _PositionFirstExperimentState();
}

class _PositionFirstExperimentState extends State<PositionFirstExperiment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Starting Position'),
              SizedBox(
                width: 300,
                height: 40,
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'X-Axis: 0.0',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                height: 40,
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Y-Axis: 0.0',
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('End Position'),
              SizedBox(
                width: 300,
                height: 40,
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'X-Axis: 340.0',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                height: 40,
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Y-Axis: 290.0',
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Live Position'),
              SizedBox(
                width: 300,
                height: 40,
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'X-Axis: ${context.watch<AccuracyProvider>().x}',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                height: 40,
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Y-Axis: ${context.watch<AccuracyProvider>().y}',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 350,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                  ),
                  onPressed: () async {
                    http.Response response = await http.post(
                      Uri.parse('http://127.0.0.1:5000/send'),
                      body: {
                        "a": "40",
                        "b": "60",
                      },
                    );

                    print(response.body);
                    // await ModbusCommunication.send(40006, 1);
                  },
                  child: const Text('HOMING'),
                ),
              ),
              SizedBox(
                width: 350,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                  ),
                  onPressed: () async {
                    context.read<AccuracyProvider>().printData();
                    // context
                    //     .read<PositionFirstExperimentProvider>()
                    //     .fetchXYPosition(context);
                    // context
                    //     .read<PositionFirstExperimentProvider>()
                    //     .changeStartedStatus(true);
                  },
                  child: const Text('START'),
                ),
              ),
              SizedBox(
                width: 350,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                  ),
                  onPressed: () {
                    context.read<AccuracyProvider>().changeStartedStatus(false);
                  },
                  child: const Text('STOP'),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: const BackPress(),
    );
  }
}
