import 'package:flutter/material.dart';

import '../language/language_items.dart';

class TextfieldLearn extends StatefulWidget {
  const TextfieldLearn({super.key});

  @override
  State<TextfieldLearn> createState() => _TextfieldLearnState();
}

class _TextfieldLearnState extends State<TextfieldLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LanguageItems.textfieldAppBar,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: TextField(
        maxLength: 20,
        buildCounter: (BuildContext context,
            {int? currentLength, bool? isFocused, int? maxLength}) {
          return Container(
            height: 10,
            width: 40,
            color: Colors.green[100 * (currentLength ?? 0)],
          );
        },
        // klavyede @ isareti ekliyor
        keyboardType: TextInputType.emailAddress,

        // otomatik tamamlama kısmında mailleri gosterir
        autofillHints: const [AutofillHints.email],

        // Klavyemizin sag tarafinda bulunan buttton icin
        textInputAction: TextInputAction.next,
        decoration: _InputDecorator().email,
      ),
    );
  }
}

class _InputDecorator {
  final email = const InputDecoration(
    prefixIcon: Icon(Icons.mail_outline_outlined),

    // Componenti kutulu hale getirme
    // border: OutlineInputBorder(),
    labelText: LanguageItems.mail,

    // arka plan rengi filled kismini da true yapmamiz gerekiyor
    // fillColor: Colors.transparent,
    // filled: true,
  );
}
