package org.iesch.alberto.a13_sharedpreferences

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import org.iesch.alberto.a13_sharedpreferences.UserVipApplicaton.Companion.prefs
import org.iesch.alberto.a13_sharedpreferences.databinding.ActivityMainBinding

private lateinit var binding : ActivityMainBinding
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        initUI()
        comprobarUserValues()
    }

    private fun comprobarUserValues() {
        if ( prefs.getNombre().isNotEmpty()){
            irADetalle()
        }
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
            prefs.guardarNombre(binding.etNombre.text.toString())
            prefs.guardarVIP(binding.cbVip.isChecked)
            irADetalle()
        } else {
            // hacer otra cosa
        }
    }

    private fun irADetalle() {
        startActivity(Intent(this, ResultActivity::class.java))
    }
}

















