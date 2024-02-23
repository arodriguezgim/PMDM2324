import 'package:flutter/material.dart';

import '../widgets/birthday_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/pets_button_widget.dart';
import '../widgets/title_widget.dart';

class HomeScreen extends StatefulWidget {
  final String? idUser;

  const HomeScreen({super.key, this.idUser});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  DateTime? birthday;
  List<String> pets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            const TitleWidget(icon: Icons.dataset, text: 'Shared\nPreferences'),
            const SizedBox(height: 32),
            buildName(),
            const SizedBox(height: 12),
            buildBirthday(),
            const SizedBox(height: 12),
            buildPets(),
            const SizedBox(height: 32),
            buildButton(),
          ],
        ),
      ),
    );
  }

  Widget buildName() => buildTitle(
        title: 'Nombre',
        child: TextFormField(
          initialValue: name,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Tu nombre',
          ),
          onChanged: (name) => setState(() => this.name = name),
        ),
      );

  Widget buildBirthday() => buildTitle(
        title: 'Cumpleaños',
        child: BirthdayWidget(
          birthday: birthday ?? DateTime.now(),
          onChangedBirthday: (birthday) =>
              setState(() => this.birthday = birthday),
        ),
      );

  Widget buildPets() => buildTitle(
        title: 'Mascotas',
        child: PetsButtonsWidget(
          pets: pets,
          onSelectedPet: (pet) => setState(
              () => pets.contains(pet) ? pets.remove(pet) : pets.add(pet)),
        ),
      );

  Widget buildButton() => ButtonWidget(text: 'Guardar', onClicked: () {});

  Widget buildTitle({
    required String title,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          child,
        ],
      );
}
