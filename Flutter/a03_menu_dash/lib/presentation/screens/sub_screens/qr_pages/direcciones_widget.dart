import 'package:flutter/material.dart';
import 'package:menu_dash/presentation/provider/scan_provider.dart';
import 'package:provider/provider.dart';

class DireccionesWidget extends StatelessWidget {
  const DireccionesWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final scanListProvider = Provider.of<ScanListProvider>(context);

    final scanList = scanListProvider.getScans();

    return ListView.builder(
      itemCount: scanList.length,
      itemBuilder: ( _ , index) => ListTile(
        leading: Icon( Icons.home, color: Theme.of(context).primaryColor,),
        title: Text(scanList[index].valor),
        subtitle: Text('$index'),
        trailing: Icon( Icons.keyboard_arrow_right_outlined, color: Theme.of(context).primaryColor,),
      ),
    );
  }
}