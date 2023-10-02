package org.iesch.alberto.a02_registro_de_superheroes

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import org.iesch.alberto.a02_registro_de_superheroes.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // 1 - Aplicamos dataBinding
        val binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        // 2 - Comprobamos que tenemos el binding y llamamos a la función que abre el Activity de Detalle
        binding.saveButton.setOnClickListener {
            abrirDetailActivity()
        }
    }
    // 3- esta función generará un Intent y nos llevará a detalle
    private fun abrirDetailActivity() {
        // 4 - El Intent debe tener la información de desde dónde se envía y hacia dónde quiero ir
        val intent = Intent(this, DetailActivity::class.java)
        // 5 - Para utilizar el intent hemos de llamar a startActivity
        startActivity(intent)
    }
}