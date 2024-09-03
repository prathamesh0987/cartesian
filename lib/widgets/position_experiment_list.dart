import 'package:cartesian/widgets/experiment_item.dart';
import 'package:cartesian/widgets/pos_xy_plotter_first.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'back_press.dart';

class PositionExperminetList extends StatelessWidget {
  const PositionExperminetList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ExperimentItem(
            data: FontAwesomeIcons.one,
            title:
                'To determine the position of the pen or tool on an X-Y plotter, you need to know the current values of the x & y',
            onTapFunction: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PositionFirstExperiment(),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: const BackPress(),
    );
  }
}
