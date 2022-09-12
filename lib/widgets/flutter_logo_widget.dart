import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider_test/widgets/libtile.dart';
import 'package:url_launcher/url_launcher.dart';

class FlutterLogoWidget extends StatelessWidget {
  static const String logoUrl =
      'https://upload.wikimedia.org/wikipedia/commons/4/44/Google-flutter-logo.svg';
  final flutterDevUri = Uri.parse('https://flutter.dev/');

  FlutterLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget networkSvg = IconButton(
      onPressed: _launchUrl,
      icon: SvgPicture.network(
        logoUrl,
        height: 100,
        semanticsLabel: 'Flutter!',
        placeholderBuilder: (BuildContext context) => Container(
          padding: const EdgeInsets.all(30),
          child: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );

    return LibTile(child: networkSvg);
  }

  void _launchUrl() async {
    if (!await launchUrl(flutterDevUri)) throw 'Could not launch URL';
  }
}
