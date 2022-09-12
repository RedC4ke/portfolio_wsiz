import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider_test/widgets/libtile.dart';
import 'package:provider_test/wrappers.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LibTile(child: headerText(Jiffy().yMMMEd, align: TextAlign.center));
  }
}
