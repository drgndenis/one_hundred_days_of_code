import 'package:flutter/material.dart';
import 'package:one_hundred_days_of_flutter/Day-11/package/launch_mixin.dart';
import 'package:one_hundred_days_of_flutter/Day-11/package/loading_bar.dart';

import '../Day-7/my_collections_demo.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView>
    with TickerProviderStateMixin, LaunchMixin {
  final appBarTitle = 'Package Learn';
  final text = 'test';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            launchURL();
          },
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(text, style: Theme.of(context).textTheme.titleMedium),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 200),
              child: SizedBox(
                height: 50,
                child: Center(child: LoadingBar()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyCollections()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        // light_theme.dart icerisinde buttonTheme'e verdigimiz rengi alir
                        Theme.of(context).buttonTheme.colorScheme?.onPrimary),
                child: const Text('Go to Navigation Learn'),
              ),
            ),
          ],
        ));
  }
}
