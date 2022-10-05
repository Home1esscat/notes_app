import 'package:flutter/material.dart';

class AboutDialog extends StatelessWidget {
  const AboutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 330,
        height: 236,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Made by - Home1esscat',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Designed by - Notes App UI',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Illustrations - www.storyset.com',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Icons - Android Native',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Font - Nunito-Regular',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
