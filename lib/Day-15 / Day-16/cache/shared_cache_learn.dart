import 'package:flutter/material.dart';
import 'package:one_hundred_days_of_flutter/Day-15%20/%20Day-16/cache/shared_manager.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStateful<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _manager;
  late final List<User> userItems;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    userItems = UserItems().users;
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
          actions: _loading(context)),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangeValue(value);
            },
          ),
          Expanded(
            child: _UsersListView(),
          ),
          Padding(
            padding: _UtilityPaddings().onlyBottom,
            child: Column(
              children: [
                _saveVisibilty(context),
                _removeVisibility(context),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          Padding(
            padding: _UtilityPaddings().onlyLeft,
            child: _removeValueButton(),
          ),
        ],
      ),
    );
  }

  List<Widget> _loading(BuildContext context) {
    return [
      isLoading
          ? Padding(
              padding: _UtilityPaddings().onlyRight,
              child: Center(
                  child: CircularProgressIndicator(
                color:
                    Theme.of(context).progressIndicatorTheme.circularTrackColor,
              )))
          : const SizedBox.shrink(),
    ];
  }

  Visibility _removeVisibility(BuildContext context) {
    return Visibility(
      visible: removeVisibility,
      child: Text(
        'Remove',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Visibility _saveVisibilty(BuildContext context) {
    return Visibility(
      visible: saveVisibility,
      child: Text(
        'Save changed.',
        style: Theme.of(context).textTheme.titleLarge,
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

class _UtilityPaddings {
  final onlyBottom = const EdgeInsets.only(bottom: 100);
  final onlyLeft = const EdgeInsets.only(left: 20);
  final onlyRight = const EdgeInsets.only(right: 20);
}

class _UsersListView extends StatelessWidget {
  _UsersListView();

  final List<User> users = UserItems().users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(
              users[index].name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(users[index].description),
            trailing: Text(
              users[index].url,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(decoration: TextDecoration.underline),
            ),
          ),
        );
      },
    );
  }
}

class User {
  final String name;
  final String description;
  final String url;

  User(this.name, this.description, this.url);
}

class UserItems {
  late final List<User> users;
  UserItems() {
    users = [
      User('Denis', 'Dendenden', 'sdd98.dev'),
      User('İlkkan', 'ilkkanın hatiralari', 'ilkKan.dev'),
      User('Yılmaz', 'Yılmaz description', 'yilmaz.dev.com')
    ];
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
