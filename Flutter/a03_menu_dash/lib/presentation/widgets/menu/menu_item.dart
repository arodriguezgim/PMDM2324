import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final Color color;
  final IconData icono;
  final String texto;
  final String screenName;
  const MenuItem({
    super.key,
    required this.color,
    required this.icono,
    required this.texto,
    required this.screenName,
  });

  @override
  Widget build(BuildContext context) {
    // hacer la Card clickable

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, screenName),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icono, color: Colors.white, size: 70),
            const SizedBox(height: 10),
            Text(texto,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )), // Icono de la opción index
          ],
        ),
      ),
    );
  }
}
