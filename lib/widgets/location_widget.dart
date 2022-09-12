import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/geolocator_notifier.dart';
import 'package:provider_test/widgets/libtile.dart';
import 'package:provider_test/wrappers.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Placemark placemark = Provider.of<GeolocatorNotifier>(context).getPlacemark;

    String placemarkName = placemark.name ?? 'N/A';
    String streetName = placemark.street ?? 'N/A';
    String postalCode = placemark.postalCode ?? 'N/A';
    String city = placemark.locality ?? 'N/A';

    return LibTile(
      child: Column(
        children: [
          Container(
              alignment: Alignment.topLeft, child: headerText('Location')),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bodyText('Placemark: $placemarkName'),
                    bodyText('City: $city'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bodyText('Street: $streetName'),
                    bodyText('Zipcode: $postalCode'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: Provider.of<GeolocatorNotifier>(context).getLocation,
                child: const Text('Refresh')),
          ),
        ],
      ),
    );
  }
}
