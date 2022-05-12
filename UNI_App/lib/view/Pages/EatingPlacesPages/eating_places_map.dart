
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uni/view/Pages/EatingPlacesPages/eat_at_feup_back_button_page.dart';
import 'package:uni/view/Pages/unnamed_page_view.dart';

import '../../../model/directions_model.dart';
import '../../../model/directions_repository.dart';
import 'eat_at_feup_general_page_view.dart';
import 'general_eating_place_page.dart';

class EatingPlacesMap extends StatefulWidget {
  const EatingPlacesMap(this.name);

  @override
  _EatingPlacesMapState createState() => _EatingPlacesMapState();
  final String name;
}


class _EatingPlacesMapState extends EatAtFeupBackButtonPageState {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(41.1776779, -8.5949166),
    zoom: 18,
  );

  GoogleMapController _googleMapController;
  List<Marker> eatingPlaceMarkers = [];
  Directions _info;

  @override
  void initState() {
    super.initState();
    eatingPlaceMarkers.add(Marker(
        markerId: MarkerId('Cantina FEUP'),
        draggable: false,
        infoWindow: InfoWindow(
          title: "Cantina da FEUP",
          snippet: "Tv. de Lamas 22, Porto",
        ),
        position: LatLng(41.1760238,-8.5954212)));

    eatingPlaceMarkers.add(Marker(
        markerId: MarkerId('Bar da Biblioteca FEUP'),
        draggable: false,
        infoWindow: InfoWindow(
          title: "Bar da Biblioteca",
          snippet: "R. Dr. Roberto Frias, 4200-465 Porto",
        ),
        position: LatLng(41.1775456,-8.5949561)));

    eatingPlaceMarkers.add(Marker(
      position: LatLng(41.1784152,-8.5973929),
      markerId: MarkerId('Bar de Minas'),
      infoWindow: InfoWindow(
        title: "Bar de Minas",
        snippet: "Tv. de Lamas 22, Porto",
      ),
      draggable: false,

    ));

    eatingPlaceMarkers.add(Marker(
        markerId: MarkerId('Grill'),
        draggable: false,
        infoWindow: InfoWindow(
          title: "Grill",
          snippet: "Tv. de Lamas 22, Porto",
        ),
        position: LatLng(41.1762857,-8.5952363)));

    eatingPlaceMarkers.add(Marker(
        markerId: MarkerId('AE FEUP'),
        draggable: false,
        infoWindow: InfoWindow(
          title: "AE FEUP",
          snippet: "R. Dr. Júlio de Matos 882, 4200-365 Porto",
        ),
        position: LatLng(41.1762243,-8.5969001)));
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Eating Places Map'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: Set.from(eatingPlaceMarkers),
          ),

          if (_info != null)
            Positioned(
              top: 20.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
          _info != null
              ? CameraUpdate.newLatLngBounds(_info.bounds, 100.0)
              : CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}

