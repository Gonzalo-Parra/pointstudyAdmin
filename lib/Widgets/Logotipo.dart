import 'package:flutter/material.dart';

class Logotipo extends StatelessWidget {
  const Logotipo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'POINT STUDY',
              style: TextStyle(
                color: Color(0xffffffff),
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              'Admin',
              style: TextStyle(
                color: Color(0xffffffff),
                fontSize: 25.0,
                fontWeight: FontWeight.w100,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
