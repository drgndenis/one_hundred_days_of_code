import 'package:flutter/material.dart';
import 'package:one_hundred_days_of_flutter/Day-13/image_learn_202.dart';

class AnimatedLearn extends StatefulWidget {
  const AnimatedLearn({super.key});

  @override
  State<AnimatedLearn> createState() => _AnimatedLearnState();
}

class _AnimatedLearnState extends State<AnimatedLearn> {
  final _text = 'Testing the animations';
  bool _isOpacity = false;
  bool _isVisible = false;

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _textWidget(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeVisible,
      ),
      // Butona basildiginda Placeholder visible ozelligi false olur ve tekrar bastigimizda gorunur hale geri gelir.
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
              duration: _DurationItems().durationLow,
              opacity: _isOpacity ? 1 : 0,
              child: Text(
                _text,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            trailing: IconButton(
                onPressed: changeOpacity,
                icon: const Icon(Icons.precision_manufacturing_outlined)),
          ),
        ],
      ),
    );
  }

  AnimatedCrossFade _textWidget(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Text(_text, style: context.textTheme().titleLarge),
      secondChild: const Placeholder(),
      duration: _DurationItems().durationNormal,
      crossFadeState:
          _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

// BuildContext'i extension edip textTheme'lere ulasabiliriz.
extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  final durationLow = const Duration(milliseconds: 500);
  final durationNormal = const Duration(seconds: 1);
}
