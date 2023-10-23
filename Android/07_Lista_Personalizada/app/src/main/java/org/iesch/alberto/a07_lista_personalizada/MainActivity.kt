package org.iesch.alberto.a07_lista_personalizada

import android.annotation.SuppressLint
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.view.ViewGroup
import android.widget.ArrayAdapter
import android.widget.ImageView
import android.widget.ListView
import android.widget.TextView
import org.iesch.alberto.a07_lista_personalizada.model.Pelicula

class MainActivity : AppCompatActivity() {

    val listaPeliculas = arrayListOf<Pelicula>(
        Pelicula(R.drawable.fiestasalchicha, "LA FIESTA DE LA SALCHICHA", "2016"),
        Pelicula(R.drawable.hoteltransilvania, "HOTEL TRANSILVANIA", "2018"),
        Pelicula(R.drawable.jurassicpark, "JURASSIK PARK", "1992"),
        Pelicula(R.drawable.regeresoalfuturo, "REGRESO AL FUTURO", "1988"),
        Pelicula(R.drawable.shrek, "SHREK", "2015"),
        Pelicula(R.drawable.titanic, "TITANIC", "2002"),
        Pelicula(R.drawable.ultimallamada, "ULTIMA LLAMADA", "2002"),
    )
    @SuppressLint("MissingInflatedId")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val listView =  findViewById<ListView>(R.id.lvLista)

        // Adaptador personalizado
        val adapter = object : ArrayAdapter<Pelicula>(this, R.layout.item_pelicula, listaPeliculas){
            override fun getView(position: Int, convertView: View?, parent: ViewGroup): View {

                val view = convertView ?: layoutInflater.inflate(R.layout.item_pelicula, parent, false)

                val pelicula =  getItem(position) as Pelicula

                val imgPelicula: ImageView = view.findViewById(R.id.imgCartel)
                val tituloPelicula = view.findViewById<TextView>(R.id.tvTitulo)
                val anioPeli = view.findViewById<TextView>(R.id.tvAnio)

                imgPelicula.setImageResource(pelicula.imgFoto)
                tituloPelicula.text = pelicula.titulo
                anioPeli.text = pelicula.anio

                return view
            }
        }
        // FIN ADAPTADOR

        listView.adapter = adapter
    }
}




















