import 'package:flutter/material.dart';

class ScaffoldLearnView extends StatelessWidget {
  const ScaffoldLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet App Project'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          ('Denis DRAGAN'),
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Colors.blueGrey),
        ),
      ),
      backgroundColor: Colors.grey,
      // appbarda sol taraf
      endDrawer: const Drawer(
        backgroundColor: Colors.amber,
      ),
      // appbarda sağ taraf kullanımı
      drawer: Drawer(
        backgroundColor: Colors.cyan,
        child: Center(
            child: Text(
          'I am rich broo <3',
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: Colors.yellow),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.cyan,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.ad_units), label: 'First'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet), label: 'Wallet')
      ]),
    );
  }
}
