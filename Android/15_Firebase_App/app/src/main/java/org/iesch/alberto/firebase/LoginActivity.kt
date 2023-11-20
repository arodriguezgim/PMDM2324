package org.iesch.alberto.firebase

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.google.firebase.analytics.FirebaseAnalytics
import com.google.firebase.auth.FirebaseAuth
import org.iesch.alberto.firebase.databinding.ActivityLoginBinding

private lateinit var binding: ActivityLoginBinding
class LoginActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        //Cambiar de tema
        Thread.sleep(3000)
        setTheme(R.style.Theme__15_Firebase_App)

        super.onCreate(savedInstanceState)
        binding = ActivityLoginBinding.inflate(layoutInflater)
        setContentView(binding.root)
        // Analytics
        val analytics = FirebaseAnalytics.getInstance(this)
        // Evento de Analytics
        val bundle = Bundle()
        bundle.putString("mensaje", "Integracion con Firebase completa")
        analytics.logEvent("InicioScreen",bundle )
        //Autenticacion
        setup()
    }

    private fun setup() {
        title = "Autenticación"
        // PULSAR EL BOTON REGISTRAR
        binding.btnRegistrarse.setOnClickListener {
            //comprobamos que email y contraseña no estén vacíos
            if ( binding.etEmail.text.isNotEmpty() && binding.etPassword.text.isNotEmpty()){
                // Iniciamos el registro de usuario en Firebase
                FirebaseAuth.getInstance().createUserWithEmailAndPassword(
                    binding.etEmail.text.toString(),
                    binding.etPassword.text.toString()
                )
                // Le añadimos unlistener para comprobar si se ha registrado completamente el usuario
                    .addOnCompleteListener {
                        if (it.isSuccessful){
                            // Si se ha añadido el usuario pasamos a Hoome
                        } else {
                            // Error
                            
                        }
                    }
            }
        }
    }
}

















