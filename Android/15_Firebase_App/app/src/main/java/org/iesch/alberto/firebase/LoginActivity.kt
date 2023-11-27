package org.iesch.alberto.firebase

import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AlertDialog
import androidx.core.content.ContextCompat
import com.google.android.gms.auth.api.signin.GoogleSignIn
import com.google.android.gms.auth.api.signin.GoogleSignInOptions
import com.google.android.gms.common.api.ApiException
import com.google.firebase.Firebase
import com.google.firebase.analytics.FirebaseAnalytics
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.auth.GoogleAuthProvider
import com.google.firebase.messaging.FirebaseMessaging
import com.google.firebase.remoteconfig.FirebaseRemoteConfig
import com.google.firebase.remoteconfig.FirebaseRemoteConfigSettings
import com.google.firebase.remoteconfig.remoteConfig
import com.google.firebase.remoteconfig.remoteConfigSettings
import org.iesch.alberto.firebase.databinding.ActivityLoginBinding

private lateinit var binding: ActivityLoginBinding
class LoginActivity : AppCompatActivity() {

    private val GOOGLE_SIGN_IN = 100




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
        ///Configuramos Remote Config
        val configSettings : FirebaseRemoteConfigSettings = remoteConfigSettings {
            // cada cuantos segundos se actualizan esos valores
            minimumFetchIntervalInSeconds = 60
        }
        val firebaseConfig : FirebaseRemoteConfig = Firebase.remoteConfig
        firebaseConfig.setConfigSettingsAsync(configSettings)
        firebaseConfig.setDefaultsAsync(
            mapOf(
                "show_optional_button" to false,
                "optional_button_text" to "Menú Especial"
            )
        )






        // Notificacion
        notification()
        //Autenticacion
        setup()
        // Sesion
        session()

    }

    private fun notification() {
        FirebaseMessaging.getInstance().token.addOnCompleteListener {
            it.result?.let {
                token ->
                println("Este es el token del dispositivo: $token")
            }
        }

        // Nos podemos suscribir a temas
        FirebaseMessaging.getInstance().subscribeToTopic("DAM")
        //Recuperasmos informacion de una notificacion recibida
        val url = intent.getStringExtra("url")
        url?.let {
            println("Ha llegado informacion extra en un Push: $it")
        }
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

        // PULSAR EL BOTON DE LOGIN GOOGLE
        binding.btnLoginGoogle.setOnClickListener {
            // Configuracion
            val googleConf = GoogleSignInOptions.Builder(GoogleSignInOptions.DEFAULT_SIGN_IN)
                .requestIdToken(getString(R.string.default_web_client_id))
                .requestEmail()
                .build()
            // Iniciamos la autenticacion
            val googleSignInClient = GoogleSignIn.getClient(this, googleConf)

            startActivityForResult(googleSignInClient.signInIntent, GOOGLE_SIGN_IN)
        }



    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if ( requestCode == GOOGLE_SIGN_IN){
            val task = GoogleSignIn.getSignedInAccountFromIntent(data)

            try {
                //Si to do ha ido bien tendremos la cuenta de google. Ahora nos autencamos en Firebase
                val account = task.getResult(ApiException::class.java)
                if ( account != null){
                    val credetial = GoogleAuthProvider.getCredential(account.idToken, null)
                    FirebaseAuth.getInstance().signInWithCredential(credetial)
                        // Le añadoimos un listener para comprobar si se ha registrado o no el usuario
                        .addOnCompleteListener {
                            if (it.isSuccessful){
                                // Ir a home
                                showHome(account.email ?: "", ProviderType.GOOGLE)
                            } else {
                                showAlert()
                            }
                        }
                }
            } catch (e: ApiException){
                showAlert()
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

















