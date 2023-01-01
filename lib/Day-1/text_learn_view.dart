import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({Key? key, this.username}) : super(key: key);
  final String name = 'denis';

  final String? username;
  final ProjectKeys keys = ProjectKeys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () {}, child: const Text('Rest')),
            Text(
              ('Welcome $name'),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: ProjectStyles.welcomeStyle,
            ),
            // Deneye deneye en son bu hale getirdiysek bu iyi bir proje icin yeterlidir
            Text(
              ('Welcome $name'),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              // en dogru yontem theme uzerinden stylelari okumak
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: ProjectColors.welcomeColor),
            ),

            // nullable gelecen Stringi username! seklinde yapmak yerine ?? ile bos string yollamak proje acisindan daha onemli
            Text(username ?? ''),
            // Text('Merhaba'), demek yerine bu textleri bir class icinde toplayip yazmak her zaman daha mantiklidir.
            Text(
              keys.welcome,
              style: ProjectKeys.wStyle,
            ),
          ],
        ),
      ),
    );
  }
}

// theme uzerinden okuyamiyorsak en basic sekilde style bu sekilde verebiliriz
// en mantikli tercih her zaman theme uzerinden yapmaktir
class ProjectStyles {
  static TextStyle welcomeStyle = const TextStyle(
      wordSpacing: 2,
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.italic,
      color: Colors.red,
      letterSpacing: 2,
      fontSize: 18,
      fontWeight: FontWeight.w600);
}

// hot restart ctrl + shift + f5
class ProjectColors {
  static Color welcomeColor = Colors.pink;
}

class ProjectKeys {
  final String welcome = 'Merhaba';
  static TextStyle wStyle = const TextStyle(
    color: Colors.teal,
  );
}
