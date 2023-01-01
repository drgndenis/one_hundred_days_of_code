import 'package:flutter/material.dart';

class PaddingLearnView extends StatelessWidget {
  const PaddingLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Padding Learn'),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: ProjectPadding().pagePaddingVertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              // Container'in kendi icinde paddingi bulunur. Bir cok ozel companente kendisine ait paddingi vardir.
              child: Container(
                color: Colors.white,
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                color: Colors.white,
                height: 100,
              ),
            ),
            Padding(
              padding: ProjectPadding().pagePaddingRight +
                  ProjectPadding().pagePaddingVertical,
              child: const Text('Veli'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectPadding {
  final pagePaddingVertical = const EdgeInsets.symmetric(vertical: 20);

  final pagePaddingRight = const EdgeInsets.only(right: 20);
}
