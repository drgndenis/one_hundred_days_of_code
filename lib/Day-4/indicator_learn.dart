import 'package:flutter/material.dart';

class IndicatorLearnView extends StatelessWidget {
  const IndicatorLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [_CenterCircularProgress()],
      ),
      body: const LinearProgressIndicator(
        color: Colors.amber,
      ),
    );
  }
}

class _CenterCircularProgress extends StatelessWidget {
  const _CenterCircularProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 5,

        /// Animasyon vb. gibi şeylerle uploading durumu yapılabilir %80'i dolu bir daire gosterir, backgcolor ile kalan kismida farkli bir renk ile yapabiliriz.
        // value: 0.8,
      ),
    );
  }
}
