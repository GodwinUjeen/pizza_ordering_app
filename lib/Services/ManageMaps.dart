import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart' as geoCo;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String finalAddress = 'Searching address...';

class GenerateMaps extends ChangeNotifier {
  Position position;

  Position get getPosition => position;

  String finalAddress = 'Searching address...';

  String get getFinalAddress => finalAddress;
  GoogleMapController googleMapController;

  String countryName, mainAddress = 'Mock Address...';

  String get getCountyrName => countryName;

  String get getMainAddress => mainAddress;

  Map<MarkerId, Marker> marker = <MarkerId, Marker>{};

  Future getCurrentLocation() async {
    var positionData = await GeolocatorPlatform.instance.getCurrentPosition();
    final cords =
        geoCo.Coordinates(positionData.latitude, positionData.longitude);
    var address =
        await geoCo.Geocoder.local.findAddressesFromCoordinates(cords);
    String mainAddress = address.first.addressLine;
    print(mainAddress);
    finalAddress = mainAddress;
  }

  getMarkers(double lat, double lng) {
    MarkerId markerId = MarkerId(lat.toString() + lng.toString());
    Marker markers = Marker(
      markerId: markerId,
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(lat, lng),
      infoWindow: InfoWindow(title: getMainAddress, snippet: getCountyrName),
    );
    marker[markerId] = markers;
  }

  Widget fetchMaps() {
    return GoogleMap(
      mapType: MapType.hybrid,
      myLocationEnabled: true,
      mapToolbarEnabled: true,
      onTap: (loc) async {
        final cords = geoCo.Coordinates(loc.latitude, loc.longitude);
        var address =
            await geoCo.Geocoder.local.findAddressesFromCoordinates(cords);
        countryName = address.first.countryName;
        mainAddress = address.first.addressLine;
        notifyListeners();
        marker == null
            ? getMarkers(loc.latitude, loc.longitude)
            : marker.clear();

        print(loc);
        print(countryName);
        print(mainAddress);
      },
      markers: Set<Marker>.of(marker.values),
      initialCameraPosition: CameraPosition(
        target: LatLng(21.000, 45.000),
        zoom: 18.0,
      ),
      onMapCreated: (GoogleMapController mapController) {
        googleMapController = mapController;
        notifyListeners();
      },
    );
  }
}
