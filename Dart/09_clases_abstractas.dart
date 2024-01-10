void main(){

  final NuclearPlant nucleito = NuclearPlant( energiaInicial: 100.0);

  print('nucleito: ${ cargarTelefono( nucleito )}');
}

double cargarTelefono( EnergyPlant plant){
  return plant.energyLeft - 10;
}

enum PlantType { nuclear, wind, water }

abstract class EnergyPlant {

  double energyLeft;
  final PlantType type;

  EnergyPlant({
    required this.energyLeft,
    required this.type
  });

  void consumirEnergia( double amount );

}

// extends o implements
class NuclearPlant extends EnergyPlant {

  NuclearPlant({required double energiaInicial })
  : super( energyLeft: energiaInicial, type: PlantType.nuclear);
  
  @override
  void consumirEnergia(double amount) {
    
  }
  
}