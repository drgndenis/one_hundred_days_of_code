import 'package:flutter/material.dart';

class StatefullLifeCyleLearn extends StatefulWidget {
  const StatefullLifeCyleLearn({super.key, required this.message});
  final String message;
  @override
  State<StatefullLifeCyleLearn> createState() => _StatefullLifeCyleLearnState();
}

class _StatefullLifeCyleLearnState extends State<StatefullLifeCyleLearn> {
  String _message = '';
  late final bool _isOdd;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('c');
  }

  @override
  void didUpdateWidget(covariant StatefullLifeCyleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message != widget.message) {
      _message = widget.message;
      _computeName();
      setState(() {});
    }
  }

  // sayfadan ciktigi anda cagiriliyor
  // bu gibi durumlarda logicleri cagiririz ve bunları null, clear gibi islemler yapariz.
  // oldurme islemlerini burada yapiyoruz.
  @override
  void dispose() {
    super.dispose();
    print('ai');
  }

  // Mesah tek ise yanina tek, cift ise yanina cift yaz.
  @override
  void initState() {
    super.initState();
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;
    _computeName();
    print('a');
  }

  void _computeName() {
    if (_isOdd) {
      _message += ' Tek';
    } else {
      _message += ' Cift';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_message),
      ),
      body: _isOdd
          ? Center(child: TextButton(onPressed: () {}, child: Text(_message)))
          : Center(
              child: ElevatedButton(onPressed: () {}, child: Text(_message))),
    );
  }
}
