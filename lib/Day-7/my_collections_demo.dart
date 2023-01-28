import 'package:flutter/material.dart';

import '../language/language_items.dart';

class MyCollections extends StatefulWidget {
  const MyCollections({super.key});

  @override
  State<MyCollections> createState() => _MyCollectionsState();
}

class _MyCollectionsState extends State<MyCollections> {
  late final List<CollectionModel> _items;

  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtilty().background,
      appBar: AppBar(
        title: Text(
          LanguageItems.appBarTitle,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        leading: Container(
          color: ColorsUtilty().white70,
          child: IconButton(
              color: ColorsUtilty().black,
              onPressed: () {},
              icon: const Icon(Icons.arrow_circle_left_rounded)),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return _CategoryCard(model: _items[index]);
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    Key? key,
    required CollectionModel model,
  })  : _model = model,
        super(key: key);

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility().paddingBottom,
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: PaddingUtility().paddingAll,
          child: Column(
            children: [
              Expanded(
                  child: Image.asset(
                _model.imagePath,
              )),
              Padding(
                padding: PaddingUtility().paddingLeftRightTop,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_model.title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: ColorsUtilty().black,
                                fontWeight: FontWeight.bold)),
                    Text('${_model.price} ETH',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ColorsUtilty().black,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;

  CollectionModel(
      {required this.imagePath, required this.title, required this.price});
}

class PaddingUtility {
  final paddingBottom = const EdgeInsets.only(bottom: 30);
  final paddingAll = const EdgeInsets.all(10.0);
  final paddingLeftRightTop =
      const EdgeInsets.only(left: 30, right: 30, top: 10);
}

class ColorsUtilty {
  final Color white70 = Colors.white70;
  final Color black = Colors.black;
  final Color background = const Color(0xffF2F2F2);
}

class CollectionItems {
  late final List<CollectionModel> items;

  CollectionItems() {
    items = [
      CollectionModel(
          imagePath: ProjectImages().imageCollection,
          title: 'Abstact Art',
          price: 3.4),
      CollectionModel(
          imagePath: ProjectImages().imageCollection,
          title: 'Abstact Art2',
          price: 3.4),
      CollectionModel(
          imagePath: ProjectImages().imageCollection,
          title: 'Abstact Art3',
          price: 3.4),
      CollectionModel(
          imagePath: ProjectImages().imageCollection,
          title: 'Abstact Art4',
          price: 3.4),
    ];
  }
}

class ProjectImages {
  final imageCollection = 'assets/images/image_collection.png';
}
