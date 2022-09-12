import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class GeolocatorNotifier extends ChangeNotifier {
  Placemark _placemark = Placemark();
  Placemark get getPlacemark {
    return _placemark;
  }

  void getLocation() async {
    var hasPermissions = await Permission.locationWhenInUse.isGranted;
    if (!hasPermissions &&
        await Permission.locationWhenInUse.request().isDenied) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    var placemarkList =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    _placemark = placemarkList[0];

    notifyListeners();
  }
}
