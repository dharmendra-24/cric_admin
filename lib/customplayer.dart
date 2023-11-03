import 'package:flutter/cupertino.dart';

class CustomPlayer extends StatelessWidget {
  CustomPlayer({super.key, required index, required title});
  String? index;
  String? title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(index!),
        SizedBox(
          width: 10,
        ),
        Text(title!)
      ],
    );
  }
}
