import 'package:flutter/material.dart';

class ColorButtonView extends StatefulWidget {
  const ColorButtonView({super.key, required this.initialColor});
  // alt companente null yollama
  final Color? initialColor;

  @override
  State<ColorButtonView> createState() => _ColorButtonViewState();
}

class _ColorButtonViewState extends State<ColorButtonView> {
  Color? _backgroundColor;
  final redText = 'Red';
  final yellowText = 'Yellow';
  final blueText = 'Blue';

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.initialColor ?? ProjectColors().transparent;
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  void didUpdateWidget(covariant ColorButtonView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialColor != _backgroundColor &&
        widget.initialColor != null) {
      changeBackgroundColor(widget.initialColor!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      bottomNavigationBar: BottomNavigationBar(onTap: _colorOnTap, items: [
        BottomNavigationBarItem(
            icon: _ColorContainer(color: ProjectColors().red), label: redText),
        BottomNavigationBarItem(
            icon: _ColorContainer(color: ProjectColors().yellow),
            label: yellowText),
        BottomNavigationBarItem(
            icon: _ColorContainer(color: ProjectColors().blue), label: blueText)
      ]),
    );
  }

  void _colorOnTap(int value) {
    if (value == _MyColors.red.index) {
      changeBackgroundColor(ProjectColors().red);
    } else if (value == _MyColors.yellow.index) {
      changeBackgroundColor(ProjectColors().yellow);
    } else if (value == _MyColors.blue.index) {
      changeBackgroundColor(ProjectColors().blue);
    }
  }
}

enum _MyColors { red, yellow, blue }

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;
  final double customWidth = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: customWidth,
      height: customWidth,
    );
  }
}

class ProjectColors {
  final Color red = Colors.red;
  final Color yellow = Colors.yellow;
  final Color blue = Colors.blue;
  final Color transparent = Colors.transparent;
}
