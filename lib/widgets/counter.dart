import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/counter_notifier.dart';
import 'package:provider_test/widgets/libtile.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<CounterNotifier>(context).getCounter;

    return LibTile(
      child: Column(
        children: [
          Text(
            'You have pushed the button this many times:',
            textAlign: TextAlign.justify,
            style: GoogleFonts.abel(
              color: Colors.blue.shade700,
              letterSpacing: 1,
              fontSize: 20,
            ),
          ),
          Text(
            '$counter',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
