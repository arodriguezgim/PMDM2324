package org.iesch.alberto.a02_registro_de_superheroes

import android.graphics.Bitmap
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import org.iesch.alberto.a02_registro_de_superheroes.databinding.ActivityDetailBinding
import org.iesch.alberto.a02_registro_de_superheroes.model.Hero

class DetailActivity : AppCompatActivity() {

    // 13 (OPCIONAL) Podemos usar constantes para asignar llaves y NO equivocarnos
    companion object{
        const val HERO_KEY = "superhero_name"
        // 28 a
        const val BITMAP_KEY = "bitmap_key"
        /*
        const val SUPERHERO_NAME_KEY = "superhero_name"
        const val ALTER_EGO_KEY = "alter_ego"
        const val BIO_KEY = "bio"
        const val POWER_KEY = "power"
        */
    }
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // 9 - añadimos el binding
        val binding = ActivityDetailBinding.inflate(layoutInflater)
        setContentView(binding.root)
        // 10 - Nos creamos una variable de tipo Bundle que recoge TODOS los valores tráido
        val extras:Bundle = intent.extras!!
        /*
        // 11 - Recogemos los valores traídos del Bundle
        // Estos valores pueden ser nulos. Ponemos ?: para darles un valor por defcto en caso de que vengan nulos
        val superHeroName = extras.getString(SUPERHERO_NAME_KEY)
        val alterEgo = extras.getString(ALTER_EGO_KEY)
        val bio = extras.getString(BIO_KEY)
        val power = extras.getFloat(POWER_KEY)
         */
        // 20 - Recibimos el objeto Pacelable
        val superHero = extras.getParcelable<Hero>(HERO_KEY)!!
        // 28 b
        val bitmap = extras.getParcelable<Bitmap>(BITMAP_KEY)!!
        // 12 - Mostramos los valores por pantalla
        //21
        /*
        binding.heroName.text = superHero.name
        binding.alterEgoText.text = superHero.alterEgo
        binding.bioText.text = superHero.bio
        binding.ratingBar.rating = superHero.power
         */
        //28 c
        binding.imageView.setImageBitmap(bitmap)
        binding.superHero = superHero

    }
}