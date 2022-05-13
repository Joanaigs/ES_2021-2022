
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uni/view/Pages/EatingPlacesPages/eat_at_feup_back_button_page.dart';

import '../../../model/directions_model.dart';

class EatingPlacesMap extends StatefulWidget {
  static String name;

  EatingPlacesMap(String nome){
    name = nome;
  }
  @override
  _EatingPlacesMapState createState() => _EatingPlacesMapState();

}


class _EatingPlacesMapState extends EatAtFeupBackButtonPageState {

  static CameraPosition choosePosition()  {
    switch (EatingPlacesMap.name) {
      case 'AE':
        return CameraPosition(
          target: LatLng(41.1762243,-8.5969001),
          zoom: 18,
        );
      case 'CANTINA':
        return CameraPosition(
          target: LatLng(41.1760238,-8.5954212),
          zoom: 18,
        );
      case 'GRILL':
        return CameraPosition(
          target: LatLng(41.1762857,-8.5952363),
          zoom: 18,
        );
      case 'BAR DA BIBLIOTECA':
        return CameraPosition(
          target: LatLng(41.1774396,-8.5951459),
          zoom: 18,
        );
      case 'BAR DE MINAS':
        return CameraPosition(
          target: LatLng(41.178455, -8.597464),
          zoom: 18,
        );
      case 'RESTAURANTE INEGI':
        return CameraPosition(
          target: LatLng(41.179331, -8.594340),
          zoom: 18,
        );
      case 'BAR INESC TEC':
        return CameraPosition(
          target: LatLng(41.179365, -8.595428),
          zoom: 18,
        );
      default:
        return CameraPosition(
          target: LatLng(41.1776779, -8.5949166),
          zoom: 18,
        );
    }
  }


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
        position: LatLng(41.176277, -8.595305)));

    eatingPlaceMarkers.add(Marker(
        markerId: MarkerId('Bar da Biblioteca FEUP'),
        draggable: false,
        infoWindow: InfoWindow(
          title: "Bar da Biblioteca",
          snippet: "R. Dr. Roberto Frias, 4200-465 Porto",
        ),
        position: LatLng(41.1774130,-8.5948360)));

    eatingPlaceMarkers.add(Marker(
      position: LatLng(41.178455, -8.597464),
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
        position: LatLng(41.176492, -8.595777)));

    eatingPlaceMarkers.add(Marker(
        markerId: MarkerId('AE FEUP'),
        draggable: false,
        infoWindow: InfoWindow(
          title: "AE FEUP",
          snippet: "R. Dr. Júlio de Matos 882, 4200-365 Porto",
        ),
        position: LatLng(41.176127, -8.596888)));

    eatingPlaceMarkers.add(Marker(
        markerId: MarkerId('INESC TEC'),
        draggable: false,
        infoWindow: InfoWindow(
          title: "INESC TEC",
          snippet: "R. Dr. Roberto Frias, Porto",
        ),
        position: LatLng(41.179365, -8.595428)));

    eatingPlaceMarkers.add(Marker(
        markerId: MarkerId('INEGI'),
        draggable: false,
        infoWindow: InfoWindow(
          title: "INEGI",
          snippet: "R. Dr. Roberto Frias 400, 4200-465 Porto",
        ),
        position: LatLng(41.179331, -8.594340)));
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('mapPage'),
      appBar: AppBar(
        centerTitle: false,
        title: Text(EatingPlacesMap.name),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: choosePosition(),
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
              : CameraUpdate.newCameraPosition(choosePosition()),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}

