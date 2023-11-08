package org.iesch.alberto.a13_sharedpreferences

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import org.iesch.alberto.a13_sharedpreferences.databinding.ActivityMainBinding

private lateinit var binding : ActivityMainBinding
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        initUI()
    }

    private fun initUI() {
        // Capturamos el evento del boton
        binding.btnContinuar.setOnClickListener {
            accessToDetail()
        }
    }

    private fun accessToDetail() {
        // Este metodo comprobará si se ha escrito o no un nombre
        if (binding.etNombre.text.toString().isNotEmpty()){
            // Guardaremos los datos del usuario
        } else {
            // hacer otra cosa
        }
    }
}