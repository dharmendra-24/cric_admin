import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.loading = false});
  String title = '';
  final bool loading;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.deepPurple, borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: loading
                ? CircularProgressIndicator(
                    color: Colors.green,
                  )
                : Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  )),
      ),
    );
  }
}
