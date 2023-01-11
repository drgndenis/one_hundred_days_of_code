import 'package:flutter/material.dart';
import 'package:one_hundred_days_of_flutter/Day-7/my_collections_demo.dart';
import 'package:one_hundred_days_of_flutter/Day-8/navigate_detail_learn.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> with NavigatorManager {
  List<int> selectedItems = [];

  void addSelected(int index, bool isAdd) {
    setState(() {
      isAdd ? selectedItems.add(index) : selectedItems.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Navigation',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TextButton(
            onPressed: () async {
              final response = await navigateToWidgetNormal<bool>(context,
                  NavigateLearnDart(isOk: selectedItems.contains(index)));
              if (response is bool) {
                addSelected(index, response);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Placeholder(
                  color: selectedItems.contains(index)
                      ? Colors.green
                      : Colors.red),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigation_outlined),
        onPressed: () {
          navigateToWidget(context, (const MyCollections()));
        },
      ),
    );
  }
}

mixin NavigatorManager {
  void navigateToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => widget,
        fullscreenDialog:
            true, //asagidan yukariya gelir ve tam ekran olur (fullscreenDialog: false ise yukaridan asagiya gelir)
        settings: const RouteSettings(),
      ),
    );
  }

  Future<T?> navigateToWidgetNormal<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
        builder: (context) => widget,
        fullscreenDialog:
            true, //asagidan yukariya gelir ve tam ekran olur (fullscreenDialog: false ise yukaridan asagiya gelir)
        settings: const RouteSettings(),
      ),
    );
  }
}
