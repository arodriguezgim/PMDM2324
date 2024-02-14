import 'package:flutter/material.dart';
import 'package:menu_dash/presentation/provider/location_provider.dart';
import 'package:provider/provider.dart';

class UbicacionScreen extends StatelessWidget {
   
  const UbicacionScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      appBar: AppBar(title: const Text('Ubicación'),),
      body: Consumer<LocationProvider>(
        builder: (context, locationProvider, child) { 
            if (locationProvider.currentPosition == null ) {
              return const Center(
                child: Text('Pulse el botón para obtener la ubicación'),
                );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Latitud: ${locationProvider.currentPosition!.latitude}'),
                    Text('Latitud: ${locationProvider.currentPosition!.longitude}'),
                  ],
                ),
              );
            }
         },

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Provider.of<LocationProvider>(context, listen: false).startLocationUpdates();
        },
        child: const Icon(Icons.location_on),
        ),
    );
  }
}