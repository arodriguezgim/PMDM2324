package org.iesch.alberto.a02_registro_de_superheroes

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import org.iesch.alberto.a02_registro_de_superheroes.databinding.ActivityDetailBinding

class DetailActivity : AppCompatActivity() {

    // 13 (OPCIONAL) Podemos usar constantes para asignar llaves y NO equivocarnos
    companion object{
        const val SUPERHERO_NAME_KEY = "superhero_name"
        const val ALTER_EGO_KEY = "alter_ego"
        const val BIO_KEY = "bio"
        const val POWER_KEY = "power"
    }
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // 9 - añadimos el binding
        val binding = ActivityDetailBinding.inflate(layoutInflater)
        setContentView(binding.root)
        // 10 - Nos creamos una variable de tipo Bundle que recoge TODOS los valores tráido
        val extras:Bundle = intent.extras!!
        // 11 - Recogemos los valores traídos del Bundle
        // Estos valores pueden ser nulos. Ponemos ?: para darles un valor por defcto en caso de que vengan nulos
        val superHeroName = extras.getString(SUPERHERO_NAME_KEY)
        val alterEgo = extras.getString(ALTER_EGO_KEY)
        val bio = extras.getString(BIO_KEY)
        val power = extras.getFloat(POWER_KEY)
        // 12 - Mostramos los valores por pantalla
        binding.heroName.text = superHeroName.toString()
        binding.alterEgoText.text = alterEgo.toString()
        binding.bioText.text = bio.toString()
        binding.ratingBar.rating = power.toFloat()

    }
}