package org.iesch.alberto.a02_registro_de_superheroes

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import org.iesch.alberto.a02_registro_de_superheroes.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // 1 - Aplicamos dataBinding
        val binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        // 2 - Comprobamos que tenemos el binding y llamamos a la función que abre el Activity de Detalle
        binding.saveButton.setOnClickListener {
            // 6 - Nos creamos las variables necesarias para pasárselas al intent
            val superHeroName = binding.heroNameEdit.text.toString()
            val alterEgo = binding.alterEgoEdit.text.toString()
            val bio = binding.bioEdit.text.toString()
            val power = binding.powerBar.rating
            abrirDetailActivity(superHeroName, alterEgo, bio, power)
        }
    }
    // 3- esta función generará un Intent y nos llevará a detalle
    // 7
    private fun abrirDetailActivity(superHeroName: String, alterEgo: String, bio:String, power: Float) {
        // 4 - El Intent debe tener la información de desde dónde se envía y hacia dónde quiero ir
        val intent = Intent(this, DetailActivity::class.java)
        // 8 - Agregamos los valores al intent
        intent.putExtra(DetailActivity.SUPERHERO_NAME_KEY, superHeroName)
        intent.putExtra(DetailActivity.ALTER_EGO_KEY, alterEgo)
        intent.putExtra(DetailActivity.BIO_KEY, bio)
        intent.putExtra(DetailActivity.POWER_KEY, power)
        Log.d("MainActivity", superHeroName)
        // 5 - Para utilizar el intent hemos de llamar a startActivity
        startActivity(intent)
    }
}




















