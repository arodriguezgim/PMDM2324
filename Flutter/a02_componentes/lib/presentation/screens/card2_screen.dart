import 'package:a02_componentes/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';


class Card2Screen extends StatelessWidget {
   
  const Card2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Otras tarjetas'),),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: const [
          CardPersonalizada1(),
          SizedBox(height: 10),
          CardPersonalizada2( urlImage: 'https://switzerland-tour.com/storage/media/4-ForArticles/swiss-mountains.jpg'),
          SizedBox(height: 10),
          CardPersonalizada2( urlImage: 'https://static.vecteezy.com/system/resources/previews/003/623/626/non_2x/sunset-lake-landscape-illustration-free-vector.jpg',),
          SizedBox(height: 10),
          CardPersonalizada2( urlImage: 'https://i.pinimg.com/originals/28/25/e3/2825e3e901b7ede50931cbbf751a4c3e.jpg', comentario: 'Un bonito Paisaje'),
          SizedBox(height: 10),
          


        ],
      )
    );
  }
}

