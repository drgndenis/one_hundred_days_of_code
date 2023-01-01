import 'package:flutter/material.dart';

class ContainerSizedBoxLearnView extends StatelessWidget {
  const ContainerSizedBoxLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container Sized Box'),
        backgroundColor: Colors.cyan,
      ),
      // İskelet bir kutu olusturur, icinde birden fazla propertyisi vardir.
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: 200, // butun ekranlarda 200 piksel yeri kaplar
            child: Text('D' * 500),
          ),
          // SizedBox.shrink() // ekranda bos bir alan
          SizedBox.square(
            dimension: 50, // kare bir alan olusturur 50x50'lik
            child: Text('B' * 50),
          ),
          Container(
            // responsive tasarim
            constraints: const BoxConstraints(
                maxWidth: 200, minWidth: 100, minHeight: 100, maxHeight: 200),
            // container icine padding veriyoruz. İceriden koselerde bosluk birakiriz
            padding: const EdgeInsets.all(10),
            // container disinda bosluk birakma
            margin: const EdgeInsets.all(5),
            decoration: ProjectContainerDecoration(),
            child: Text('aa' * 25),
          )
        ],
      ),
    );
  }
}

// Birinci kullanim (bu daha iyi bir kullanim)
class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
            // color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            gradient:
                const LinearGradient(colors: [Colors.cyan, Colors.yellow]),
            boxShadow: const [
              BoxShadow(
                  color: Colors.white, offset: Offset(0.1, 1), blurRadius: 12)
            ],
            // shape: BoxShape.circle,
            border: Border.all(width: 10, color: Colors.white12));
}

// ikinci kullanim
class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
      // color: Colors.red,
      borderRadius: BorderRadius.circular(10),
      gradient: const LinearGradient(colors: [Colors.red, Colors.black]),
      boxShadow: const [
        BoxShadow(color: Colors.cyan, offset: Offset(0.1, 1), blurRadius: 12)
      ],
      // shape: BoxShape.circle,
      border: Border.all(width: 10, color: Colors.white12));
}
