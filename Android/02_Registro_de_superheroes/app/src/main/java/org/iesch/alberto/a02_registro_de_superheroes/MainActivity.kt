package org.iesch.alberto.a02_registro_de_superheroes

import android.app.Activity
import android.content.Intent
import android.graphics.Bitmap
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.provider.MediaStore
import android.util.Log
import android.widget.ImageView
import androidx.core.graphics.drawable.toBitmap
import org.iesch.alberto.a02_registro_de_superheroes.databinding.ActivityMainBinding
import org.iesch.alberto.a02_registro_de_superheroes.model.Hero

class MainActivity : AppCompatActivity() {

    // 27a - Nos creamos la variable global y la declaramos en el onCreate
    private lateinit var heroImage: ImageView
    // lateinit sirve para prometer a kotlin que cuando esta variable se establece ya estará declarada.
    // Esta variable no puede ser nula
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // 1 - Aplicamos dataBinding
        val binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        //27 b
        heroImage = binding.superheroImage
        // 2 - Comprobamos que tenemos el binding y llamamos a la función que abre el Activity de Detalle
        binding.saveButton.setOnClickListener {
            // 6 - Nos creamos las variables necesarias para pasárselas al intent
            val superHeroName = binding.heroNameEdit.text.toString()
            val alterEgo = binding.alterEgoEdit.text.toString()
            val bio = binding.bioEdit.text.toString()
            val power = binding.powerBar.rating
            // 14 - ME creo un herop con los valores que he introducido
            val heroe = Hero(superHeroName, alterEgo, bio, power)
            abrirDetailActivity(heroe)
        }

        //25 - Añadoimos el onclickListener a la Imagen
        binding.superheroImage.setOnClickListener {
            abrirCamara()
        }
    }

    private fun abrirCamara() {
        // abrimos el INTENT IMPLICITO yq ue android es quien elige qué aplicacion abre este intent
        val cameraIntent = Intent(MediaStore.ACTION_IMAGE_CAPTURE)
        startActivityForResult(cameraIntent, 1000)
    }


    // 3- esta función generará un Intent y nos llevará a detalle
    // 7
    // 15 - Modificamos el metodo para que reciba solo un Hero
    private fun abrirDetailActivity(heroe:Hero) {
        // 4 - El Intent debe tener la información de desde dónde se envía y hacia dónde quiero ir
        val intent = Intent(this, DetailActivity::class.java)
        // 8 - Agregamos los valores al intent
        /*
        intent.putExtra(DetailActivity.SUPERHERO_NAME_KEY, superHeroName)
        intent.putExtra(DetailActivity.ALTER_EGO_KEY, alterEgo)
        intent.putExtra(DetailActivity.BIO_KEY, bio)
        intent.putExtra(DetailActivity.POWER_KEY, power)
        Log.d("MainActivity", superHeroName)
         */
        //18 - Pasamos solamente el superhero
        intent.putExtra(DetailActivity.HERO_KEY, heroe)
        intent.putExtra(DetailActivity.BITMAP_KEY, heroImage.drawable.toBitmap())
        // 5 - Para utilizar el intent hemos de llamar a startActivity
        startActivity(intent)
    }


    //26 - onActivityResult es para recibir los datos de la camara
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if ( resultCode == Activity.RESULT_OK && requestCode == 1000){
            val extras = data?.extras
            val heroBitmap = extras?.getParcelable<Bitmap>("data")
            // desde aqui no puedo aaceeder a heroImage. Hemos de crear la variable global
            // 27 c
            heroImage.setImageBitmap(heroBitmap)
        }

    }
}




















