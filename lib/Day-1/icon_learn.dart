import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({super.key});
  final IconSettings iconSettings = IconSettings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon Learn'),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                // iconlarda genel olarak outlined kullanilir.
                Icons.message_outlined,
                color: Colors.red,
                size: IconSizes().iconSmall,
              )),
          const SizedBox(height: 50),
          IconButton(onPressed: () {}, icon: iconSettings.icon),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class IconSizes {
  final double iconSmall = 70;
}

class IconColors {
  final iconColor = Colors.blueAccent;
}

// Icon icin genel olarak her yerde ayni seyleri kullanacaksak tek bir class icinde o iconun tum herseyini tanımlamak daha mantiklidir
class IconSettings {
  final Icon icon = const Icon(
    // iconlarda genel olarak outlined kullanilir.
    Icons.message_outlined,
    // ozel renkler vericeksek internetten bu renklerin isimlerine bakip degisken_ismi vermek daha iyidir
    color: Colors.amberAccent,
    size: 50,
  );
}
