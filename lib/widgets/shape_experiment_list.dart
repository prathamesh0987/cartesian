import 'package:cartesian/widgets/experiment_item.dart';
import 'package:cartesian/widgets/rectangle_experiment.dart';
import 'package:cartesian/widgets/square_experiment.dart';
import 'package:cartesian/widgets/triangle_experiment.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'back_press.dart';

import 'package:http/http.dart' as http;

class ShapeExperminetList extends StatelessWidget {
  const ShapeExperminetList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ExperimentItem(
            data: FontAwesomeIcons.one,
            title: 'Square',
            onTapFunction: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SquareExperiment(),
                ),
              );
            },
          ),
          ExperimentItem(
            data: FontAwesomeIcons.two,
            title: 'Triangle',
            onTapFunction: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TrianleExperimrnt(),
                ),
              );
            },
          ),
          ExperimentItem(
            data: FontAwesomeIcons.three,
            title: 'Rectangle',
            onTapFunction: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RectangleExperiment(),
                ),
              );
            },
          ),
          ExperimentItem(
            data: FontAwesomeIcons.four,
            title: 'Circle',
            onTapFunction: () async {
              http.Response homing = await http.post(
                Uri.parse('http://127.0.0.1:5000/homing'),
              );

              print(homing.body);

              http.Response response = await http.post(
                Uri.parse('http://127.0.0.1:5000/drawCircleStar'),
                body: {
                  "command": "circle",
                },
              );

              print(response.body);
            },
          ),
          ExperimentItem(
            data: FontAwesomeIcons.five,
            title: 'Star',
            onTapFunction: () async {
              http.Response homing = await http.post(
                Uri.parse('http://127.0.0.1:5000/homing'),
              );

              print(homing.body);

              http.Response response = await http.post(
                Uri.parse('http://127.0.0.1:5000/drawCircleStar'),
                body: {
                  "command": "star",
                },
              );

              print(response.body);
            },
          ),
        ],
      ),
      floatingActionButton: const BackPress(),
    );
  }
}
