import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);
  String title;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool imageAvailable = false;
  late Uint8List imageFile;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(top: 10),
            height: 70,
            width: 100,
            color: Colors.black,
            child: imageAvailable ? Image.memory(imageFile) : const SizedBox(),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              final image = await ImagePickerWeb.getImageAsBytes();

              setState(() {
                imageFile = image!;
                imageAvailable = true;
              });
            },
            child: Container(
              height: 40,
              width: 100,
              color: Colors.orange,
              child: Center(
                child: Text(
                  widget.title,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
