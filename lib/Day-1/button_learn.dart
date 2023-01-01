import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            child: const Text('Save'),
            onPressed: () {},
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Data')),
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle)),
          FloatingActionButton(
              onPressed: () {}, child: const Icon(Icons.plus_one_outlined)),
          OutlinedButton(onPressed: () {}, child: const Text('data')),
          InkWell(
            onTap: () {},
            child: const Text('Custom'),
          ),
          Container(
            height: 100,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 40, right: 40),
              child: Text(
                'Place Holder',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          )
        ],
      ),
    );
  }
}
