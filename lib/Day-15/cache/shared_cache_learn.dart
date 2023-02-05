import 'package:flutter/material.dart';
import 'package:one_hundred_days_of_flutter/Day-15/cache/shared_manager.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStateful<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _manager;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    _initialze();
  }

  Future<void> _initialze() async {
    _changeLoading();
    await _manager.init();
    _changeLoading();

    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    // final prefs = await SharedPreferences.getInstance();
    // final int? counter = prefs.getInt('counter');
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  void _onChangeValue(String value) {
    final parseValue = int.tryParse(value);

    if (parseValue != null) {
      setState(() {
        _currentValue = parseValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            _currentValue.toString(),
          ),
          actions: [
            isLoading
                ? Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Theme.of(context)
                          .progressIndicatorTheme
                          .circularTrackColor,
                    )),
                  )
                : const SizedBox.shrink(),
          ]),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangeValue(value);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Visibility(
              visible: saveVisibility,
              child: Text(
                'Save changed.',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Visibility(
              visible: removeVisibility,
              child: Text(
                'Remove',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: _removeValueButton(),
          ),
        ],
      ),
    );
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      child: const Icon(Icons.save_outlined),
      onPressed: () async {
        _changeLoading();
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        _changeTextSaveVisibility();
        _changeLoading();
      },
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      child: const Icon(Icons.remove),
      onPressed: () async {
        _changeLoading();
        await _manager.removeItem(SharedKeys.counter);
        _changeTextRemoveVisibility();
        _changeLoading();
      },
    );
  }
}

abstract class LoadingStateful<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;
  bool saveVisibility = false;
  bool removeVisibility = false;

  void _changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void _changeTextSaveVisibility() {
    setState(() {
      saveVisibility = !saveVisibility;
    });
  }

  void _changeTextRemoveVisibility() {
    setState(() {
      removeVisibility = !removeVisibility;
    });
  }
}
