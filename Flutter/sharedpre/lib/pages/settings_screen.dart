import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharedpre/providers/theme_provider.dart';
import 'package:sharedpre/share_preferences/preferencias.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  //bool isDarkMode = false;
  //int genero = 1;
  //String nombre = 'Koldo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Ajustes',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                ),
                Divider(),
                SwitchListTile.adaptive(
                  value: Preferencias.isDarkMode,
                  onChanged: (value) {
                    Preferencias.isDarkMode = value;
                    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                    value
                      ? themeProvider.setDarkMode()
                      : themeProvider.setLightMode();
                    setState(() {});
                  },
                  title: const Text('Modo oscuro'),
                ),
                Divider(),
                RadioListTile.adaptive(
                  title: const Text('Masculino'),
                  value: 1,
                  groupValue: Preferencias.genero,
                  onChanged: (value) {
                    Preferencias.genero = value ?? 1;
                    setState(() {});
                  },
                ),
                Divider(),
                RadioListTile.adaptive(
                  title: const Text('Femenino'),
                  value: 2,
                  groupValue: Preferencias.genero,
                  onChanged: (value) {
                    Preferencias.genero = value ?? 2;
                    setState(() {});
                  },
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    initialValue: Preferencias.name,
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      helperText: 'Nombre del usuario'
                    ),
                    onChanged: (value) {
                      Preferencias.name = value;
                      setState(() {});
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
