import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColumRowLearnView extends StatelessWidget {
  const ColumRowLearnView({super.key});
  final appBar = 'Column and Row Layouts';
  final text = 'data';
  final data = 'a1';
  final data2 = 'a2';
  final data3 = 'a3';
  final double height = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          appBar,
          style: Theme.of(context).textTheme.headline6,
        )),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(
        children: [
          // Expanded ile ekranimizi parcalariz
          // flex ile %100'lük alanımızın ne kadari verilecegini ayarlariz
          const Expanded(flex: 4, child: _SpecialRow()),
          const Spacer(flex: 2), // Araya bosluk vermemize yarar
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(data),
                  Text(data2),
                  Text(data3),
                ],
              )),
          SizedBox(
            height: height,
            child: Column(
              children: [
                // bunlara height ve width vermek yerine expanded ile vermek daha mantiklidir.
                // Bu gibi durumlarda baska cihazlarda expanded ile vermezsek cihaz boyuna gore degisiklik olabilir
                Expanded(child: Text(text)),
                Expanded(child: Text(text)),
                Expanded(child: Text(text)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SpecialRow extends StatelessWidget {
  const _SpecialRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(color: const Color(0xff82ccdd))),
        Expanded(child: Container(color: const Color(0xff60a3bc))),
        Expanded(child: Container(color: const Color(0xff3c6382))),
        Expanded(child: Container(color: const Color(0xff0a3d62))),
      ],
    );
  }
}
