import 'package:flutter/material.dart';

class ImageLearnAdvance extends StatefulWidget {
  const ImageLearnAdvance({super.key});

  @override
  State<ImageLearnAdvance> createState() => _ImageLearnAdvanceState();
}

class _ImageLearnAdvanceState extends State<ImageLearnAdvance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ImagePaths.book.toWidget(),
    );
  }
}

enum ImagePaths {
  book,
}

extension ImagePathsExtension on ImagePaths {
  // Geriye string deger dondurur ve Image.asset(ImagePaths.book.path()) diyerek kullanabiliriz.
  String path() {
    return 'assets/images/$name.png';
  }

  // Geriye widget dondurur. Ana kodlarin bulundugu yerde daha az kod bulunmus olur.
  Widget toWidget() {
    return Image.asset(path());
  }
}
