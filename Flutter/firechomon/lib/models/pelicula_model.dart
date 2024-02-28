// To parse this JSON data, do
//
//     final pelicula = peliculaFromJson(jsonString);

import 'dart:convert';

Pelicula peliculaFromJson(String str) => Pelicula.fromJson(json.decode(str));

String peliculaToJson(Pelicula data) => json.encode(data.toJson());

class Pelicula {
    final int? id;
    final String? titulo;
    final int? anio;
    final String? director;
    final String? sinopsis;
    final String? urlImagen;

    Pelicula({
        this.id,
        this.titulo,
        this.anio,
        this.director,
        this.sinopsis,
        this.urlImagen,
    });

    factory Pelicula.fromJson(Map<String, dynamic> json) => Pelicula(
        id: json["id"],
        titulo: json["titulo"],
        anio: json["anio"],
        director: json["director"],
        sinopsis: json["sinopsis"],
        urlImagen: json["url_imagen"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "anio": anio,
        "director": director,
        "sinopsis": sinopsis,
        "url_imagen": urlImagen,
    };
}
