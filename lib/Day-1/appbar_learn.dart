import 'package:flutter/material.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({super.key});
  final String _title = 'AppBar Learn';

  /*
   * Asagidaki kodlarda /// olanlar bu appbar icinde kullandigimiz fakat hem daha iyi bir kod yazmak icin
   * hem de tum sayfalarda ortak olan seyleri main.dart icinde theme: icine yazdik.
   * Bu sekilde hem daha bir kod cikarmak olduk hemde her sayfa icin tek tek AppBar yapmak zorunda kalmadik
   * Bu sekilde ana AppBar icinde sadece title leading actions kalmis oldu
   *
   * Soru:
   * Bu AppBar'i class icinde tanimladik zaten diger sayfalarda da ayni class yapisini cekemez miydik?
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        // appbar'da bulunan titlenin hep ortada olmasini saglar
        /// centerTitle: true,
        // appbarda sol tarafı kullanmaya yarar
        /// backgroundColor: Colors.transparent,
        /// elevation: 0,
        // mobilapplerde en ust kisimdir, saatin vb. seylerin gozuktugu yer
        /// systemOverlayStyle: SystemUiOverlayStyle.light,
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_left)),

        // leadingWidth default hali 56 olarak gelir bunu istersen sağ sola oynatabiliriz witdh ayari ile
        // leadingWidth: 25,
        // actionsIconTheme: const IconThemeData(color: Colors.cyanAccent), => Sadece actions kismindaki iconun rengini degistirir
        /// foregroundColor: Colors.cyanAccent, // Appbarda bulunan kisimlarin hepsinin rengini degistirir.
        /// automaticallyImplyLeading: false, // Sayfada otomatik olarak back button gelmemesini saglariz
        // appbarda sağ tarafı kullanmaya yarar
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          /*
          const Center(
            child: CircularProgressIndicator(),
          ) */
        ],
      ),
    );
  }
}
