import 'package:flutter/material.dart';

// Column ve Row ogrendikten sonra basic bir app cikarabilecek bir durumda olunabilir

class ListTileLearnView extends StatelessWidget {
  ListTileLearnView({super.key});
  final String cardSub = 'How do you use your card';
  final String myCard = 'My Card';
  final String bankSub = 'Your bank wallet is 2000 dolars';
  final String myBank = 'My Bank Wallet';
  final String appBar = 'My Crypto Wallet';
  final Color martinique = _ColorUtility().martinique;
  final Color dawn = _ColorUtility().dawn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBar,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: martinique, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_left_outlined,
              color: martinique,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chevron_right_outlined,
                color: martinique,
              ))
        ],
        centerTitle: true,
        backgroundColor: dawn,
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          // card ve listTile ile guzel bir gorunum vermis oluyoruz
          _CardListTileUtility(
            text: myCard,
            subtitle: cardSub,
            leading: _IconsUtility().myCardLeading,
          ),
          const SizedBox(height: 15),
          _CardListTileUtility(
            text: myBank,
            subtitle: bankSub,
            leading: _IconsUtility().myBankLeading,
          )
        ],
      ),
    );
  }
}

class _CardListTileUtility extends StatelessWidget {
  const _CardListTileUtility({
    Key? key,
    required this.text,
    required this.subtitle,
    required this.leading,
  }) : super(key: key);

  final String text;
  final String subtitle;
  final Icon leading;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {},
        title: Text(text),
        subtitle: Text(subtitle),
        leading: leading,
        trailing: _IconsUtility().normalTrailing,
      ),
    );
  }
}

class _IconsUtility with _ColorUtility {
  final myCardLeading = Icon(Icons.account_balance_wallet_outlined,
      color: _ColorUtility().dawn, size: 40);
  final myBankLeading = Icon(
    Icons.account_balance_outlined,
    color: _ColorUtility().dawn,
    size: 40,
  );

  final normalTrailing = Icon(
    Icons.chevron_right_outlined,
    color: _ColorUtility().dawn,
    size: 35,
  );
}

class _ColorUtility {
  Color dawn = const Color(0xffaaa69d);
  Color martinique = const Color(0xff2C2C54);
}
