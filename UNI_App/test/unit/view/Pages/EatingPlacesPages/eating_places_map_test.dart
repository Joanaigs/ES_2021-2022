import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uni/view/Pages/EatingPlacesPages/eating_places_map.dart';


void main(){
  group ('Map', (){

    // Unit Tests
    test('Initial position should start at (41.1776779, -8.5949166)', (){
      EatingPlacesMap eatingPlacesMap = EatingPlacesMap('Eating Places Map');
      EatingPlacesMapState eatingPlacesMapState = eatingPlacesMap.createState();
      CameraPosition cameraPosition = EatingPlacesMapState.choosePosition();
      expect(cameraPosition, CameraPosition(
        target: LatLng(41.1776779, -8.5949166),
        zoom: 18,
      ));
    });
  });
}