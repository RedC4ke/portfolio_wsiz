import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/counter_notifier.dart';
import 'package:provider_test/provider/geolocator_notifier.dart';
import 'package:provider_test/provider/network_notifier.dart';
import 'package:provider_test/widgets/connectivity_widget.dart';
import 'package:provider_test/widgets/counter.dart';
import 'package:provider_test/widgets/date_widget.dart';
import 'package:provider_test/widgets/flutter_logo_widget.dart';
import 'package:provider_test/widgets/location_widget.dart';
import 'package:provider_test/widgets/my_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterNotifier()),
        ChangeNotifierProvider(create: (_) => NetworkNotifier()),
        ChangeNotifierProvider(create: (_) => GeolocatorNotifier())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      //! image_picker
      drawer: MyDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //! connectivity_plus
              const ConnectivityWidget(),
              //! jiffy
              const DateWidget(),
              //! geolocator, geocoding
              const LocationWidget(),
              //! provider, google_fonts
              const Counter(),
              //! flutter_svg, url_launcher
              FlutterLogoWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Provider.of<CounterNotifier>(context, listen: true)
            .incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
