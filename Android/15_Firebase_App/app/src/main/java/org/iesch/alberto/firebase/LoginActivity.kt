package org.iesch.alberto.firebase

import android.content.Context
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AlertDialog
import com.google.firebase.analytics.FirebaseAnalytics
import com.google.firebase.auth.FirebaseAuth
import org.iesch.alberto.firebase.databinding.ActivityLoginBinding

private lateinit var binding: ActivityLoginBinding
class LoginActivity : AppCompatActivity() {

    override fun onStart() {
        super.onStart()
        binding.authLayout.visibility = View.VISIBLE
    }
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
        // Sesion
        session()
    }

    private fun session() {
        val prefs = getSharedPreferences("preferencias", Context.MODE_PRIVATE)
        val email = prefs.getString("email", null)
        val provider = prefs.getString("provider", null)

        if (email != null && provider != null){
            binding.authLayout.visibility = View.INVISIBLE
            showHome(email, ProviderType.valueOf(provider))
        }
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
                            // Si se ha añadido el usuario pasamos a Home
                            showHome(it.result?.user?.email ?: "", ProviderType.BASIC)
                        } else {
                            // Error
                            showAlert()
                        }
                    }
            }
        }

        // PULSAR EL BOTON LOGUEAR
        binding.btnLogin.setOnClickListener {
            //comprobamos que email y contraseña no estén vacíos
            if ( binding.etEmail.text.isNotEmpty() && binding.etPassword.text.isNotEmpty()) {
                // Iniciamos el LOGIN de usuario en Firebase
                FirebaseAuth.getInstance().signInWithEmailAndPassword(
                    binding.etEmail.text.toString(),
                    binding.etPassword.text.toString()
                )
                    // Le añadimos unlistener para comprobar si se ha registrado completamente el usuario
                    .addOnCompleteListener {
                        if (it.isSuccessful) {
                            // Si se ha añadido el usuario pasamos a Home
                            showHome(it.result?.user?.email ?: "", ProviderType.BASIC)
                        } else {
                            // Error
                            showAlert()
                        }
                    }
            }
        }



    }

    private fun showAlert() {
        val builder = AlertDialog.Builder(this)
        builder.setTitle("Error")
        builder.setMessage("Se ha producido un error al autenticar al usuario")
        builder.setPositiveButton("Aceptar", null)
        val dialog: AlertDialog = builder.create()
        dialog.show()
    }

    private fun showHome(email : String, provider : ProviderType) {
        val homeIntent = Intent(this, HomeActivity::class.java).apply {
            putExtra("email", email)
            putExtra("provider", provider.name)
        }
        startActivity(homeIntent)
    }
}

















