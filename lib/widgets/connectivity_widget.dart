import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/network_notifier.dart';
import 'package:provider_test/widgets/libtile.dart';

class ConnectivityWidget extends StatelessWidget {
  const ConnectivityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String connectivityMessage =
        Provider.of<NetworkNotifier>(context).getConnectivityMessage;

    return LibTile(
      child: Text('Connection status: $connectivityMessage',
          textAlign: TextAlign.center,
          style: GoogleFonts.abel(
            color: Colors.black,
            fontSize: 20,
          )),
    );
  }
}
