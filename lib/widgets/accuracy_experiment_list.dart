import 'package:cartesian/provider/accuracy.dart';
import 'package:cartesian/widgets/back_press.dart';
import 'package:cartesian/widgets/experiment_item.dart';
import 'package:cartesian/widgets/line_to_pulse.dart';
import 'package:cartesian/widgets/mm_to_line.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';

class AccuracyExperimentList extends StatefulWidget {
  const AccuracyExperimentList({super.key});

  @override
  State<AccuracyExperimentList> createState() => _AccuracyExperimentListState();
}

class _AccuracyExperimentListState extends State<AccuracyExperimentList> {
  final pulsesController = TextEditingController();
  final mmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ExperimentItem(
            data: FontAwesomeIcons.one,
            title: "Pulse to Line",
            onTapFunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LineToPulse(),
                ),
              );
            },
          ),
          ExperimentItem(
            data: FontAwesomeIcons.two,
            title: "Distance(mm) to Line",
            onTapFunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MMToLine(),
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton: const BackPress(),
    );
  }

  void fetchPulseData() async {
    pulsesController.text =
        context.watch<AccuracyProvider>().getPulse.toString();
  }

  void fetchMMData() async {
    mmController.text = context.watch<AccuracyProvider>().getMM.toString();
  }
}
