import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';

final LatLngBounds sydneyBounds = LatLngBounds(
  southwest: const LatLng(-34.022631, 150.620685),
  northeast: const LatLng(-33.571835, 151.325952),
);



class MapUiBody extends StatefulWidget {
  const MapUiBody({super.key});

  @override
  State<StatefulWidget> createState() => MapUiBodyState();
}

class MapUiBodyState extends State<MapUiBody> {
  MapUiBodyState();
  final TextEditingController _locationController = TextEditingController();

  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(26.912434, 75.787270),
    zoom: 15.0,
  );

  CameraPosition _position = _kInitialPosition;
  bool _isMapCreated = false;
  final bool _isMoving = false;
  final bool _compassEnabled = true;
  final bool _mapToolbarEnabled = true;
  final CameraTargetBounds _cameraTargetBounds = CameraTargetBounds.unbounded;
  final MinMaxZoomPreference _minMaxZoomPreference = MinMaxZoomPreference.unbounded;
  final MapType _mapType = MapType.normal;
  final bool _rotateGesturesEnabled = true;
  final bool _scrollGesturesEnabled = true;
  final bool _tiltGesturesEnabled = true;
  final bool _zoomControlsEnabled = false;
  final bool _zoomGesturesEnabled = true;
  final bool _indoorViewEnabled = true;
  final bool _myLocationEnabled = true;
  final bool _myTrafficEnabled = false;
  final bool _myLocationButtonEnabled = true;
  late GoogleMapController _controller;
  final bool _nightMode = false;
  double? latitude;
  double? longtitude;


  @override
  void initState() {
    _init();
    super.initState();
  }
  Future _init()async{
    final _location = await UtilMethods.utilSharedInstanace.location(context);
    if(_location != null) {
      print("_location====");
      _position = CameraPosition(
        target: LatLng(_location.lat, _location.long),
        zoom: 15.0,
      );
      final GoogleMapController controller = await _controller;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        _position,
      ));

      setState(() {
        _controller = controller;
      });
      latitude = _location.lat;
      longtitude = _location.long;
      _addMarker(LatLng(_location.lat, _location.long));
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude!,
        longtitude!,
      );
      String address="";

      if(placemarks.isNotEmpty)
      {
        if (placemarks.isNotEmpty) {
          Placemark placemark = placemarks[0];

          if (placemark.name != null && placemark.name!.isNotEmpty) {
            address += placemark.name! + ', ';
          }
          if (placemark.subThoroughfare != null && placemark.subThoroughfare!.isNotEmpty) {
            address += placemark.subThoroughfare! + ', ';
          }
          if (placemark.thoroughfare != null && placemark.thoroughfare!.isNotEmpty) {
            address += placemark.thoroughfare! + ', ';
          }
          if (placemark.subLocality != null && placemark.subLocality!.isNotEmpty) {
            address += placemark.subLocality! + ', ';
          }
          if (placemark.locality != null && placemark.locality!.isNotEmpty) {
            address += placemark.locality! + ', ';
          }
          if (placemark.administrativeArea != null && placemark.administrativeArea!.isNotEmpty) {
            address += placemark.administrativeArea! + ' ';
          }
          if (placemark.postalCode != null && placemark.postalCode!.isNotEmpty) {
            address += placemark.postalCode! + ', ';
          }
          if (placemark.country != null && placemark.country!.isNotEmpty) {
            address += placemark.country!;
          }

          // Remove trailing comma if present
          if (address.isNotEmpty && address.endsWith(', ')) {
            address = address.substring(0, address.length - 2);
          }}

        _locationController.text = address;
      }
    }
    setState(() {

    });

  }

  @override
  void dispose() {
    super.dispose();
  }


  void _addMarker(LatLng location) {
    setState(() {
      markers = Set.from([
        Marker(
          markerId: MarkerId(location.toString()),
          position: location,
          onTap: () async{
          },
        ),
      ]);
    });
  }
  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    final GoogleMap googleMap = GoogleMap(
      onMapCreated: onMapCreated,
      initialCameraPosition: _position,
      compassEnabled: _compassEnabled,
      mapToolbarEnabled: _mapToolbarEnabled,
      cameraTargetBounds: _cameraTargetBounds,
      minMaxZoomPreference: _minMaxZoomPreference,
      mapType: _mapType,
      rotateGesturesEnabled: _rotateGesturesEnabled,
      scrollGesturesEnabled: _scrollGesturesEnabled,
      tiltGesturesEnabled: _tiltGesturesEnabled,
      zoomGesturesEnabled: _zoomGesturesEnabled,
      zoomControlsEnabled: _zoomControlsEnabled,
      indoorViewEnabled: _indoorViewEnabled,
      myLocationEnabled: _myLocationEnabled,
      myLocationButtonEnabled: _myLocationButtonEnabled,
      trafficEnabled: _myTrafficEnabled,
      markers: markers,
      onCameraMove: _updateCameraPosition,
      onTap: (LatLng location) {
        latitude=location.latitude;
        longtitude=location.longitude;
        _addMarker(location);
      },
    );

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            googleMap,
            SizedBox(
              height: 100,
              child: Padding(
                padding:
                const EdgeInsets.only(top: 15, bottom: 20, left: 20, right: 20),
                child: GooglePlaceAutoCompleteTextField(
                    textEditingController: _locationController,
                    textStyle: Theme.of(context).textTheme.bodySmall
                        ?.copyWith(fontSize: 100.w / 30) ??
                        const TextStyle(),
                    googleAPIKey: "AIzaSyCKM6nu9hXYksgFuz1flo2zQtPRC_lw7NM",
                    inputDecoration: InputDecoration(
                      // contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      enabled: true,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: BaseColors.primaryColor, width: 1)),
                      fillColor: Colors.white,
                      filled: true,
                      hintText:
                      "Your location will be used to find tradespeople near you.",
                      // hintMaxLines: null,
                      hintStyle: Theme.of(context).inputDecorationTheme.hintStyle?.copyWith(fontSize: 100.w / 30),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.location_on_outlined,
                          color: Color(0XFF134563),
                          size: 24,
                        ),
                      ),
                    ),
                    debounceTime: 800, // default 600 ms,
                    isLatLngRequired:
                    true, // if you required coordinates from place detail
                    getPlaceDetailWithLatLng: (Prediction prediction) async {
                      // this method will return latlng with place detail
                      print("placeDetails${prediction.lng}");
                      print("placeDetails${prediction.lat}");
                      // _lat=double.parse(prediction.lat.toString());
                      // _long=double.parse(prediction.lng.toString());
                      setState(() {});
                      List<Placemark> placemarks =
                      await placemarkFromCoordinates(
                          double.parse(prediction.lat.toString()),
                          double.parse(prediction.lng.toString()));

                      Placemark placemark = placemarks[0];
                      _position = CameraPosition(
                        target: LatLng(double.parse(prediction.lat.toString()),
                            double.parse(prediction.lng.toString())),
                        zoom: 15.0,
                      );
                      final GoogleMapController controller = await _controller;
                      controller.animateCamera(CameraUpdate.newCameraPosition(
                        _position,
                      ));

                      setState(() {
                        _controller = controller;
                      });
                      latitude = double.parse(prediction.lat.toString());
                      longtitude = double.parse(prediction.lng.toString());
                      _addMarker(LatLng(double.parse(prediction.lat.toString()),
                          double.parse(prediction.lng.toString())));
                    }, // this callback is called when isLatLngRequired is true
                    itemClick: (Prediction prediction) {
                      _locationController.text = prediction.description??"";
                      _locationController.selection = TextSelection.fromPosition(TextPosition(offset: (prediction.description??"").length));
                    }
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.all(3.h),
                height: 6.h,
                child: BaseButton(
                  btnType: "large", title: 'SAVE', onPressed: () async{
                  List<Placemark> placemarks = await placemarkFromCoordinates(latitude!, longtitude!);
                  String address = '';
                  if(placemarks.isNotEmpty)
                  {
                    if (placemarks.isNotEmpty) {
                      Placemark placemark = placemarks[0];
                      if (placemark.name != null && placemark.name!.isNotEmpty) {
                        address += placemark.name! + ', ';
                      }
                      if (placemark.subThoroughfare != null && placemark.subThoroughfare!.isNotEmpty) {
                        address += placemark.subThoroughfare! + ', ';
                      }
                      if (placemark.thoroughfare != null && placemark.thoroughfare!.isNotEmpty) {
                        address += placemark.thoroughfare! + ', ';
                      }
                      if (placemark.subLocality != null && placemark.subLocality!.isNotEmpty) {
                        address += placemark.subLocality! + ', ';
                      }
                      if (placemark.locality != null && placemark.locality!.isNotEmpty) {
                        address += placemark.locality! + ', ';
                      }
                      if (placemark.administrativeArea != null && placemark.administrativeArea!.isNotEmpty) {
                        address += placemark.administrativeArea! + ' ';
                      }
                      if (placemark.postalCode != null && placemark.postalCode!.isNotEmpty) {
                        address += placemark.postalCode! + ', ';
                      }
                      if (placemark.country != null && placemark.country!.isNotEmpty) {
                        address += placemark.country!;
                      }
                      // Remove trailing comma if present
                      if (address.isNotEmpty && address.endsWith(', ')) {
                        address = address.substring(0, address.length - 2);
                      }}
                  }
                  Map<String, dynamic> addressData={
                    "address":address,
                    "latitude":latitude,
                    "longtitude":longtitude
                  };
                  Navigator.pop(context,addressData);
                  },
                ),
              ),
            )
          ],
        )
      ),
    );
  }

  void _updateCameraPosition(CameraPosition position) {
    setState(() {
      _position = position;
    });
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;
      _isMapCreated = true;
    });
  }
}

class UtilMethods {
  static final UtilMethods utilSharedInstanace = UtilMethods._internal();
  factory UtilMethods() => utilSharedInstanace;
  UtilMethods._internal();

  String capitalize(String val) => "${val[0].toUpperCase()}${val.substring(1).toLowerCase()}";

  Future<LocationDataModel?> location(context) async {
    LocationPermission locationPermission;
    LocationDataModel? _location;
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        baseToast(message: "Location Permission Denied");
        return null;
      }
    }
    final position = await Geolocator.getCurrentPosition();
    final cord =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    final place = cord[0];
    String address = "";
    if(place.street!.isNotEmpty)
    {
      print("place.street.toString()");
      print(place.street.toString());
      address="${place.street.toString()}, ";
    }
    if(place.subLocality!.isNotEmpty)
    {
      print("place.subLocality.toString()");
      print(place.subLocality.toString());
      address=address+place.subLocality.toString()+", ";
    }
    if(place.postalCode!.isNotEmpty)
    {
      print("place.postalCode.toString()");
      print(place.postalCode.toString());
      address=address+place.postalCode.toString();
    }

    _location = LocationDataModel(
      address: address,
      lat: position.latitude,
      city: "${place.locality}",
      long: position.longitude,
    );
    return _location;
  }

  Future<bool> microphone(context) async {
    PermissionStatus _microPhonePermission;
    _microPhonePermission = await Permission.microphone.status;
    if (_microPhonePermission == PermissionStatus.denied ||
        _microPhonePermission == PermissionStatus.permanentlyDenied) {
      _microPhonePermission = await Permission.microphone.request();
      if (_microPhonePermission == PermissionStatus.denied ||
          _microPhonePermission == PermissionStatus.permanentlyDenied) {
        _microPhonePermission = await Permission.microphone.request();
        return false;
      }
    }
    return true;
  }


  Future<bool> storage(context) async {
    PermissionStatus _storagePermission;
    _storagePermission = await Permission.storage.status;
    if (_storagePermission == PermissionStatus.denied ||
        _storagePermission == PermissionStatus.permanentlyDenied) {
      _storagePermission = await Permission.storage.request();
      if (_storagePermission == PermissionStatus.denied ||
          _storagePermission == PermissionStatus.permanentlyDenied) {
        baseToast(message:"Microphone Permission Denied");
        return false;
      }
    }
    return true;
  }
}

class LocationDataModel {
  String address, city;
  double lat, long;

  LocationDataModel({
    required this.address,
    required this.lat,
    required this.city,
    required this.long,
  });
}