import 'package:flutter/material.dart';
import 'package:one_hundred_days_of_flutter/Day-9/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  // degisebilir bir model
  PostModel8 user9 = PostModel8(body: 'body', title: 'a');

  @override
  void initState() {
    super.initState();

    final user1 = PostModel1();
    user1.userId = 1;

    final user2 = PostModel2(1, 2, 'title', 'body');
    user2.body = 'body2';

    final user3 = PostModel3(1, 2, 'title', 'body');
    // PostModel3 class'inda final olarak tanimlanmis degiskenlerin degeri degistirilemez. Bu yuzden hata aliriz.
    // user3.body = 'body3';

    // localde islem yapıyorsak bu modeli kullanabiliriz
    final user4 = PostModel4(
      userId: 1,
      id: 2,
      title: 'title',
      body: 'body',
    );

    // PostModel5 icerisindeki degerler private olarak tanimlandigi icin erisim saglanamaz. Bu private degerlere erisim saglamak icin getter ve setter methodlari kullanilir.
    final user5 = PostModel5(
      userId: 1,
      id: 2,
      title: 'title',
      body: 'body',
    );

    final user6 = PostModel6(
      userId: 1,
      id: 2,
      title: 'title',
      body: 'body',
    );

    final user7 = PostModel7();

    // servisten data cekiyorsak en iyi kullanım budur
    final user8 = PostModel8(body: 'body');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            user9 = user9.copyWith(title: 'title');
            user9.updateBody('data');

            // user9.body = 'body'; // bunu bu sekilde kullanmak yerine modelin oldugu yerde bir function olustururuz ve bu function uzerinde deger degistiririz
          });
        },
      ),
      appBar: AppBar(
        title: Text(user9.title ?? 'Not has any data'),
      ),
    );
  }
}
