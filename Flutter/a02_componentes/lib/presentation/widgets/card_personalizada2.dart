import 'package:flutter/material.dart';

class CardPersonalizada2 extends StatelessWidget {


  const CardPersonalizada2({super.key, required this.urlImage, this.comentario});

  final String urlImage;
  final String? comentario;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 10,
      child: Column(
        children: [
          FadeInImage(
            width: double.infinity,
            height: 230,
            placeholder: const AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(urlImage),
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 800),
            ),

            if ( comentario != null )
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(10),
              child: Text( comentario!  ),
              )
        ],
      ),
    );
  }
}