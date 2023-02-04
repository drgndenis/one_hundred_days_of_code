import 'package:flutter/material.dart';

const double kZero = 0;

class AnimatedLearn extends StatefulWidget {
  const AnimatedLearn({super.key});

  @override
  State<AnimatedLearn> createState() => _AnimatedLearnState();
}

class _AnimatedLearnState extends State<AnimatedLearn>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: _DurationItems().durationLow);
  }

  late AnimationController controller;
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
      floatingActionButton: FloatingActionButton(onPressed: () {
        _changeVisible();
        controller.animateTo(_isVisible ? 1 : kZero);
      }),
      // Butona basildiginda Placeholder visible ozelligi false olur ve tekrar bastigimizda gorunur hale geri gelir.
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
              duration: _DurationItems().durationLow,
              opacity: _isOpacity ? 1 : kZero,
              child: Text(
                _text,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            trailing: IconButton(
                onPressed: changeOpacity,
                icon: const Icon(Icons.precision_manufacturing_outlined)),
          ),
          AnimatedDefaultTextStyle(
            style: (_isVisible
                    ? context.textTheme().titleMedium
                    : context.textTheme().headlineMedium) ??
                const TextStyle(),
            duration: _DurationItems().durationLow,
            child: const Text('data'),
          ),
          AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: controller,
          ),
          AnimatedContainer(
            duration: _DurationItems().durationLow,
            height:
                _isVisible ? kZero : MediaQuery.of(context).size.width * 0.2,
            width: MediaQuery.of(context).size.height * 0.2,
            color: Colors.blueAccent,
            margin: const EdgeInsets.all(10),
          ),
          Expanded(
            // Listeye ekleme cikarma yaparken animasyonlu ekleme cikarma yapabiliyoruz.
            child: AnimatedList(
              itemBuilder: (context, index, animation) {
                return const Text('Test 999');
              },
            ),
          )
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
