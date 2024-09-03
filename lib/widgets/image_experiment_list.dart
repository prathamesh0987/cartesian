// import 'package:cartesian/widgets/image_drawing.dart';
// import 'package:cartesian/widgets/letter_drawing.dart';
// import 'package:cartesian/widgets/word_drawing.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'back_press.dart';
// import 'experiment_item.dart';

// class ImageExperimentList extends StatelessWidget {
//   const ImageExperimentList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           ExperimentItem(
//             data: FontAwesomeIcons.one,
//             title: 'Draw Image',
//             onTapFunction: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => const ImageDrawing(),
//                 ),
//               );
//             },
//           ),
//           ExperimentItem(
//             data: FontAwesomeIcons.two,
//             title: 'Draw Letter',
//             onTapFunction: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => const LetterDrawing(),
//                 ),
//               );
//             },
//           ),
//           ExperimentItem(
//             data: FontAwesomeIcons.three,
//             title: 'Draw Word',
//             onTapFunction: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => const WordDrawing(),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       floatingActionButton: const BackPress(),
//     );
//   }
// }
