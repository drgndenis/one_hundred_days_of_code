import 'package:flutter/material.dart';

class SheetLearnView extends StatefulWidget {
  const SheetLearnView({super.key});

  @override
  State<SheetLearnView> createState() => _SheetLearnViewState();
}

class _SheetLearnViewState extends State<SheetLearnView> {
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
              context: context,
              backgroundColor: Colors.deepPurpleAccent,
              // Sheet acildiktan sonra arka tarafin rengini veririz.
              barrierColor: Colors.black38,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25))),
              builder: (context) {
                return const _CustomSheet();
              });
          if (result is bool) {
            setState(() {
              _backgroundColor = Colors.tealAccent;
            });
          }
        },
        backgroundColor: Colors.amber,
        child: const Icon(Icons.share_outlined),
      ),
    );
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet();

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  Color backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Divider(
                  color: Colors.black,
                  thickness: 3,
                  indent: MediaQuery.of(context).size.width * 0.45,
                  endIndent: MediaQuery.of(context).size.width * 0.45,
                ),
                Positioned(
                  right: 10,
                  child: InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.close_outlined),
                      )),
                )
              ],
            ),
          ),
          Text(
            'Deneme yapiyorum.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Image.network(
              'https://picsum.photos/200/300',
              height: 200,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  backgroundColor = Colors.purpleAccent;
                });
                Navigator.of(context).pop<bool>(true);
              },
              child: const Text('OK')),
        ],
      ),
    );
  }
}
