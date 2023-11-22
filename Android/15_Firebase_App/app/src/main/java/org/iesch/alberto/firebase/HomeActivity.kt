package org.iesch.alberto.firebase

import android.content.Context
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.provider.ContactsContract.CommonDataKinds.Email
import com.google.firebase.auth.FirebaseAuth
import org.iesch.alberto.firebase.databinding.ActivityHomeBinding

enum class ProviderType {
    BASIC,
    GOOGLE,
}
class HomeActivity : AppCompatActivity() {
    private lateinit var binding : ActivityHomeBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityHomeBinding.inflate(layoutInflater)
        setContentView(binding.root)
        // Recuperar los datos
        val bundle = intent.extras
        val email = bundle?.getString("email")
        val provider = bundle?.getString("provider")
        setup(email ?: "", provider ?: "")

        // Guardado de datos con SharedPreferences
        val prefs = getSharedPreferences("preferencias", Context.MODE_PRIVATE)
        prefs.edit().putString("email", email).putString("provider", provider).apply()
    }

    private fun setup(email: String, provider: String) {
        title = "Home"
        binding.tvEmail.text = email.toString()
        binding.tvProvider.text = provider.toString()

        //BOTON CERRAR SESION
        binding.btnCerrarSesion.setOnClickListener {
            // Borrado de datos
            val prefs = getSharedPreferences("preferencias", Context.MODE_PRIVATE)
            prefs.edit().clear().apply()

            FirebaseAuth.getInstance().signOut()
            finish()
        }
    }
}








































