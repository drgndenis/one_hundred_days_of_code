import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  // Key ile bir widget'a dogrudan erisip onun ozelliklerini bize dondurmesini sagliyoruz.
  final GlobalKey<FormState> _key = GlobalKey();

  final saveText = 'Save';
  final isNotEmptyText = 'Bu alan boş geçilemez';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        /*
        validate always olarak kalirsa birden fazla textfield'imiz oldugunda daha ilk kismini
        yazarken diger textfield'imiz'in validatoru calisir.
         */

        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            Card(
              margin: UtilityPaddings().marginAll,
              child: TextFormField(
                validator: FormFieldValidator().isNotEmpty,
              ),
            ),
            Card(
              margin: UtilityPaddings().marginAll,
              child: TextFormField(
                validator: FormFieldValidator().isNotEmpty,
              ),
            ),
            DropdownButtonFormField<String>(
              value: '1',
              items: [
                DropdownMenuItem(
                  value: '1',
                  child: Text(
                    'data',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                DropdownMenuItem(
                  value: '2',
                  child: Text(
                    'data2',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
              onChanged: (value) {},
            ),
            Padding(
              padding: UtilityPaddings().onlyTop,
              child: ElevatedButton.icon(
                  onPressed: () {
                    if (_key.currentState?.validate() ?? false) {
                      if (kDebugMode) {
                        print('okey');
                      }
                    }
                  },
                  icon: const Icon(Icons.done_outline_outlined),
                  label: Text(saveText)),
            )
          ],
        ),
      ),
    );
  }
}

class FormFieldValidator {
  get isNotEmptyText => null;

  String? isNotEmpty(String? validator) {
    return (validator?.isNotEmpty ?? false) ? null : isNotEmptyText;
  }
}

class UtilityPaddings {
  final onlyTop = const EdgeInsets.only(top: 25);
  final marginAll = const EdgeInsets.all(10);
}
