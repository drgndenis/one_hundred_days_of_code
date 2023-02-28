import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            // Dialog disinda kalan yerlere tiklama ile cikilamaz.
            barrierDismissible: true,
            builder: (context) {
              return const _ImageZoomDialog();
            },
          );
        },
        child: const Icon(Icons.info_outline_rounded),
      ),
      appBar: AppBar(),
    );
  }
}

class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog();
  final _url = 'https://picsum.photos/200';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: InteractiveViewer(
        child: Image.network(
          _url,
          fit: BoxFit.cover,
          height: 400,
        ),
      ),
    );
  }
}

class Keys {
  final versionText = 'Version update!';
  final updateText = 'Update';
  final closeText = 'Close';
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({super.key, required BuildContext context})
      : super(
          title: Text(Keys().versionText),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Text(Keys().updateText),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(Keys().closeText))
          ],
        );
}
