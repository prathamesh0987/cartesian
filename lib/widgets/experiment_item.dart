import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExperimentItem extends StatelessWidget {
  const ExperimentItem({
    super.key,
    this.data,
    this.title,
    this.onTapFunction,
  });
  final IconData? data;
  final String? title;
  final VoidCallback? onTapFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        10.0,
      ),
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            25.0,
          ),
        ),
        child: ListTile(
          leading: FaIcon(
            data,
          ),
          title: Text(title!),
          onTap: onTapFunction,
        ),
      ),
    );
  }
}
