import 'package:cartesian/provider/accuracy.dart';
import 'package:cartesian/widgets/accuracy_experiment_list.dart';
import 'package:cartesian/widgets/shape_experiment_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../widgets/experiment_item.dart';
import '../widgets/image_drawing.dart';
import '../widgets/letter_drawing.dart';
import '../widgets/word_drawing.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // leading: const FaIcon(
      //   FontAwesomeIcons.circleChevronLeft,
      // ),
      //   title: const Text('Experiments List'),
      // ),

      body: ListView(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          // ExperimentItem(
          //   data: FontAwesomeIcons.one,
          //   title: 'Position',
          //   onTapFunction: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) => const PositionExperminetList(),
          //       ),
          //     );
          //   },
          // ),
          ExperimentItem(
            data: FontAwesomeIcons.one,
            title: 'Draw Line with Encoder Feedback',
            onTapFunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccuracyExperimentList(),
                ),
              );
            },
          ),
          ExperimentItem(
            data: FontAwesomeIcons.two,
            title: 'Shape',
            onTapFunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShapeExperminetList(),
                ),
              );
            },
          ),
          ExperimentItem(
            data: FontAwesomeIcons.three,
            title: 'Draw Letter',
            onTapFunction: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LetterDrawing(),
                ),
              );
            },
          ),
          ExperimentItem(
            data: FontAwesomeIcons.four,
            title: 'Draw Word',
            onTapFunction: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const WordDrawing(),
                ),
              );
            },
          ),
          ExperimentItem(
            data: FontAwesomeIcons.five,
            title: 'Image',
            onTapFunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ImageDrawing(),
                ),
              );
            },
          ),

          ExperimentItem(
            data: FontAwesomeIcons.three,
            title: 'Threading',
            onTapFunction: () {
              context.read<AccuracyProvider>().fetchOneTwo();
            },
          ),
        ],
      ),
    );
  }
}
