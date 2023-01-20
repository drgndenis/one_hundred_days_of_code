import 'package:flutter/material.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final page1 = 'Page 1';
  final page2 = 'Page 2';
  final appBarTitle = 'TabBar Learn';
  final name = 'name';
  final _notchedValue = 10.0;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        // floatingActionButton ile bottomAppBar arasinda bir bosluk olusturur
        extendBody: true,

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _tabController.animateTo(_MyTabViews.profile.index);
          },
          backgroundColor: UtilityColor().cyanAccent,
          child: const Icon(Icons.navigation, color: Colors.white),
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: _notchedValue,
          child: TabBar(
            controller: _tabController,
            tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList(),
            indicatorColor: UtilityColor().cyanAccent,
          ),
        ),
        appBar: AppBar(title: Text(appBarTitle)),
        body: _tabBarView(),
      ),
    );
  }

  TabBarView _tabBarView() {
    return TabBarView(
      // physics ile sayfanin sag sola suruklenerek gidilmesini kapatmıs oluyoruz
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [
        Container(color: UtilityColor().redAccent),
        Container(color: UtilityColor().white),
      ],
    );
  }
}

enum _MyTabViews { home, profile }

extension _MyTabViewExtensions on _MyTabViews {}

class UtilityColor {
  final white = Colors.white;
  final redAccent = Colors.redAccent;
  final cyanAccent = Colors.cyanAccent;
  final amber = Colors.amber;
}
