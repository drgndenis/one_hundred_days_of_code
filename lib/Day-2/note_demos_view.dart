import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Day-1/image_learn.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});
  final String _title = 'Create your first Note';
  final String _description = 'Add a note about anything ';
  final String _createNote = 'Create a Note';
  final String _importNote = 'Import Notes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: PagePadding().paddingHorizontal,
        child: Column(
          children: [
            SizedBox(
              height: NormalHeight().normalHeight,
            ),
            PngImage(name: ImageItems().book),
            _TitleWidget(title: _title),
            Padding(
              padding: PagePadding().paddingVertical +
                  PagePadding().paddingHorizontal,
              child: _AddNoteTextWidget(addNote: _description * 5),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: SizedBox(
                  height: NormalHeight().normalHeight,
                  child: Center(
                      child: Text(
                    _createNote,
                    style: Theme.of(context).textTheme.headline5,
                  ))),
            ),
            TextButton(onPressed: () {}, child: Text(_importNote)),
            SizedBox(
              height: NormalHeight().normalHeight,
            ),
          ],
        ),
      ),
    );
  }
}

class _AddNoteTextWidget extends StatelessWidget {
  const _AddNoteTextWidget(
      {Key? key, this.textAlign = TextAlign.center, required this.addNote})
      : super(key: key);

  final TextAlign textAlign;
  final String addNote;

  @override
  Widget build(BuildContext context) {
    return Text(
      addNote,
      textAlign: textAlign,
      style: Theme.of(context)
          .textTheme
          .subtitle1
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
    required String title,
  })  : _title = title,
        super(key: key);

  final String _title;

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.w800),
    );
  }
}

class PagePadding {
  final paddingHorizontal = const EdgeInsets.symmetric(horizontal: 10);
  final paddingVertical = const EdgeInsets.symmetric(vertical: 10);
}

class NormalHeight {
  final double normalHeight = 50;
}
