import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  const StatelessLearn({Key? key}) : super(key: key);
  final String text2 = 'denis';

  /*
  * build methodu witgetlarimizin olusturulması icin donen ana yeri verir.
  * Bu build methotlarin icerisinde ekranlarimizi gelistiririz.
  * her companentin her widgetin kendine ozel bir build methodu vardir
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _TitleTextWidget(
            text: text2,
          ),
          const CustomContainer(),
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.blue),
      ),
    );
  }
}

class _TitleTextWidget extends StatelessWidget {
  const _TitleTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
