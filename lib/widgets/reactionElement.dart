import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wee/constants.dart';

class ReactionElement extends StatelessWidget {
  final IconData icon;
  final String reactionText;
  const ReactionElement(
      {super.key, required this.icon, required this.reactionText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(
          icon,
          color: iconColor,
        ),
        Container(
          margin: const EdgeInsets.only(top: 2),
          child: Text(
            reactionText,
            style: TextStyle(
                color: titleTextColor, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
