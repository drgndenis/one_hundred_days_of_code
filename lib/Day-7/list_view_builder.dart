import 'package:flutter/material.dart';

class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({super.key});

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // ListView.builder - ListView.seperated
      body: ListView.separated(
        itemBuilder: (context, index) {
          return SizedBox(
            height: 200,
            child: Column(
              children: [
                Expanded(child: Image.network('https://picsum.photos/200')),
                Text('$index'),
              ],
            ),
          );
        },
        // seperated itemCount ile ekrana maksimum gelecek adet sayisini belirleyebiliriz, bunu builder ile de yapabiliyoruz.
        itemCount: 15,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: Colors.white);
        },
      ),
    );
  }
}
