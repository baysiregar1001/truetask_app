import 'package:flutter/material.dart';

class ListProjectCard extends StatelessWidget {
  const ListProjectCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AspectRatio(
        aspectRatio: 3 / 1,
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
