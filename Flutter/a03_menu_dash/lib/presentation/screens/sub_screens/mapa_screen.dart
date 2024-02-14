import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


const MAPBOX_ACCESS_TOKEN = 'pk.eyJ1IjoiYXJvZHJpZ3VlemdpbSIsImEiOiJja2tpZmlvemgyM3MzMndwYXV0bW1xZnpnIn0.dXWWavfoCwqvvx8Il_3uWg';

const plazaDelTorico = LatLng(40.342848447, -1.1071225);

class MapaScreen extends StatelessWidget {
   
  const MapaScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mapas'),),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: plazaDelTorico ,
          minZoom: 5.0,
          maxZoom: 18.0,
          initialZoom: 16.0, 
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            additionalOptions: const {
              'accessToken': MAPBOX_ACCESS_TOKEN,
              'id' : 'mapbox/outdoors-v12'
              //https://docs.mapbox.com/api/maps/styles/
            },
          ),
          const MarkerLayer(markers: [
            Marker(
              point: plazaDelTorico, 
              child: Icon(Icons.location_on, color: Colors.red, size: 50,))
          ])
        ],
      )
    );
  }
}