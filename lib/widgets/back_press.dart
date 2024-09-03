import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BackPress extends StatelessWidget {
  const BackPress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Center(
        child: FaIcon(
          FontAwesomeIcons.circleChevronLeft,
        ),
      ),
    );
  }
}
