import 'package:flutter/material.dart';

class ImageLearnView extends StatelessWidget {
  const ImageLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: 300,
            child: PngImage(name: ImageItems().appleBook),
          ),
          SizedBox(
            height: 250,
            width: 250,
            child: Image.network(
              'https://img.freepik.com/premium-psd/instagram-logo-social-media-3d_304434-558.jpg?w=2000',
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.sim_card_alert_outlined),
            ),
          )
        ],
      ),
    );
  }
}

class PngImage extends StatelessWidget {
  const PngImage({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  // en efso kullanim bu sekilde olabilir
  @override
  Widget build(BuildContext context) {
    // static birseyin asset() icinde yazmamasi daha iyidir
    return Image.asset(_nameWithPath, fit: BoxFit.cover);
  }

  // private yaparak diger file'lardan erisimide kapatmıs oluruz ve daha okunakli hala getiririz.
  String get _nameWithPath => 'assets/images/$name.png';
}

class ImageItems {
  final String book = 'book';
  final String appleBook = 'appleWithBook';
}
