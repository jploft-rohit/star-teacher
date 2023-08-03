import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import '../utility/base_views/base_colors.dart';
class MapScreen extends StatefulWidget {
  final double lat;
  final double long;
  MapScreen({Key? key,required this.lat,required this.long}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    print("--------->> ${widget.lat}||${widget.long}");
    return Scaffold(
      backgroundColor: BaseColors.white,
      appBar: const BaseAppBar(title: "Location"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height:75.h,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(widget.lat, widget.long),
                    zoom: 15,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('location'),
                      position: LatLng(widget.lat, widget.long),
                      icon: BitmapDescriptor.defaultMarker,
                    ),
                  },
                ),
              ),
              SizedBox(height :4.h),
              BaseButton(title: 'Back', onPressed: () { Navigator.pop(context); },),
              SizedBox(height :4.h),
            ],
          ),
        ),
      ),
    );
  }
}
