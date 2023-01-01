import 'package:flutter/material.dart';

class CardLearnView extends StatelessWidget {
  const CardLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const _CustomCard(
            child: SizedBox(height: 100, width: 300),
          ),
          Card(
            color: Theme.of(context).colorScheme.error,
            // MetarialApp icine yazdigimiz shape'i eziyor
            shape: const StadiumBorder(),
            child: const SizedBox(height: 100, width: 300),
          ),
        ],
      ),
    );
  }
}

class _CustomCard extends StatelessWidget {
  const _CustomCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  // final roundedRectangleBorder = RoundedRectangleBorder(borderRadius: BorderRadius.circular(25));

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: ProjectMargins.cardMargin,
      color: Colors.white,

      /// MaterialApp icindeki shapei alir
      // shape: roundedRectangleBorder,
      child: child,
    );
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
}
