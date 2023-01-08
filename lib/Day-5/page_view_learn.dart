import 'package:flutter/material.dart';
import 'package:one_hundred_days_of_flutter/Day-1/icon_learn.dart';
import 'package:one_hundred_days_of_flutter/Day-1/image_learn.dart';
import 'package:one_hundred_days_of_flutter/Day-4/stack_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _CustomFloatingButton(
              callback: () {
                _controller.previousPage(
                    duration: _speacialDuration(), curve: _linearCurve);
              },
              icon: const Icon(Icons.chevron_left)),
          _CustomFloatingButton(
              callback: () {
                _controller.nextPage(
                    duration: _speacialDuration(), curve: _linearCurve);
              },
              icon: const Icon(Icons.chevron_right)),
        ],
      ),
      body: PageView(
        controller: _controller,
        children: [
          const ImageLearnView(),
          IconLearnView(),
          const StackLearnView(),
        ],
      ),
    );
  }

  Curve get _linearCurve => Curves.linear;

  Duration _speacialDuration() => const Duration(milliseconds: 350);
}

class _CustomFloatingButton extends StatelessWidget {
  const _CustomFloatingButton({
    Key? key,
    required this.icon,
    required this.callback,
  }) : super(key: key);

  final Icon icon;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: callback,
      backgroundColor: UtilityColors().cyan400,
      child: icon,
    );
  }
}

class UtilityColors {
  final cyan400 = Colors.cyan[400];
}
