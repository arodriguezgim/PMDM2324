import 'package:flutter/material.dart';
import 'package:menu_dash/entities/model/pets_model.dart';
import 'package:menu_dash/presentation/provider/pets_provider.dart';
import 'package:provider/provider.dart';

class PetsScreen extends StatefulWidget {
   
  const PetsScreen({Key? key}) : super(key: key);

  @override
  State<PetsScreen> createState() => _PetsScreenState();
}


class _PetsScreenState extends State<PetsScreen> {

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<PetsProvider>(context, listen: false);
    provider.getDataFromAPI();
    print('Llamada a la API');
  }
  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<PetsProvider>(context);
    print('Llamada a la API desde build');

    return Scaffold(
      appBar: AppBar(title: const Text('API Perretes'), elevation: 0,),
      body: provider.isLoading
              ? mostrarLoadingUI()
              : provider.error.isNotEmpty
                  ? mostrarErrorUI( provider.error )
                  : mostrarBodyUI( provider.pets ),
    );
  }

  mostrarLoadingUI() {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }

  mostrarBodyUI(PetsResponse pets) {
    return ListView.builder(
      itemCount: pets.data.length,
      itemBuilder:  (context, index) => ListTile(
        leading: CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage(pets.data[index].petImage),
          backgroundColor: Colors.white,
        ),
        title: Text(pets.data[index].petName),
        trailing: pets.data[index].isFriendly
                    ? const SizedBox()
                    : const Icon(Icons.pets, color: Colors.red,),
      ),
      );
  }

  mostrarErrorUI(String error) {
    return Center(
      child: Text(error, style: const TextStyle(color: Colors.red),),
    );
  }
}