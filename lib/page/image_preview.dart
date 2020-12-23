import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  final Image image;
  ImagePreview({@required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: image,
      ),
    );
  }
}