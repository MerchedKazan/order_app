import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationOfOrder extends StatefulWidget {
 final double? longitude;
 final double? latitude;
  const LocationOfOrder({Key? key, this.longitude, this.latitude}) : super(key: key);

  @override
  State<LocationOfOrder> createState() => _LocationOfOrderState();
}

class _LocationOfOrderState extends State<LocationOfOrder> {
late CameraPosition initialCamera;
bool load=true;
GoogleMapController? mapController;
Set<Marker> markers = Set();
late LatLng showLocation =  LatLng(
  widget.latitude??0.0,widget.longitude??0.0,
);
@override
  void initState() {
  markers.add(Marker(
    markerId: MarkerId(showLocation.toString()),
    position: showLocation,
    infoWindow:const InfoWindow(
      title: 'Order Location',

    ),
    icon: BitmapDescriptor.defaultMarker,
  ));
    // TODO: implement initState
    super.initState();
    setState(() {
      initialCamera = CameraPosition(target: LatLng(
      widget.latitude??0.0,widget.longitude??0.0,
      ),zoom: 5);
      load=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return load?LinearProgressIndicator(): GoogleMap(initialCameraPosition: initialCamera,
      onMapCreated: (controller) {
        setState(() {
          mapController = controller;
        });
      },
      markers: markers,
    );
  }
}
