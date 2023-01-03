import 'package:flutter/material.dart';

class CustomWidgetView extends StatelessWidget {
  CustomWidgetView({super.key});
  final String food = 'food';
  final String addToCard = 'Add to Card';
  // ignore: library_private_types_in_public_api
  final _PaddingUtility paddings = _PaddingUtility();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: paddings.symetricPadding,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: _CustomElevatedButton(
                    text: addToCard,
                    callback: () {},
                  )),
            ),
          ),
          Padding(
            padding: paddings.symetricPadding,
            child: _CustomElevatedButton(
              text: food,
              callback: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomElevatedButton extends StatelessWidget
    with ColorUtility, _PaddingUtility {
  _CustomElevatedButton({
    Key? key,
    required this.text,
    required this.callback,
  }) : super(key: key);

  final String text;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        shape: const StadiumBorder(),
      ),
      onPressed: callback,
      child: Padding(
        padding: _PaddingUtility().normalPadding,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ColorUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

class _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(15);
  final EdgeInsets symetricPadding =
      const EdgeInsets.symmetric(horizontal: 25, vertical: 10);
}
