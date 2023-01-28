import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin {
  final Uri _url = Uri.parse('https://pub.dev/packages/url_launcher');

  Future<void> launchURL() async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    }
  }
}
