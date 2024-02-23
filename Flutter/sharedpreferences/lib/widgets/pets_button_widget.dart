import 'package:flutter/material.dart';

class PetsButtonsWidget extends StatelessWidget {
  final List<String> pets;
  final ValueChanged<String> onSelectedPet;

  const PetsButtonsWidget({
    required this.pets,
    required this.onSelectedPet,
  });

  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).unselectedWidgetColor;
    final allPets = ['Perro', 'Gato', 'Otro'];

    return Container(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: background,
        ),
        child: ToggleButtons(
          isSelected: allPets.map((pet) => pets.contains(pet)).toList(),
          selectedColor: Colors.black,
          selectedBorderColor: Color.fromARGB(255, 53, 60, 10),
          splashColor: Colors.grey,

          //selectedColor: Color.fromARGB(255, 53, 60, 10),
          fillColor: Color.fromARGB(255, 202, 58, 147),
          color: Colors.white,
          focusColor: Colors.red,
          borderRadius: BorderRadius.circular(10),
          renderBorder: false,
          children: allPets.map(buildPet).toList(),
          onPressed: (index) => onSelectedPet(allPets[index]),
        ),
      ),
    );
  }

  Widget buildPet(String text) => Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Text(text),
      );
}
