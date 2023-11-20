package org.iesch.alberto.firebase

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

class LoginActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {

        //Cambiar de tema
        Thread.sleep(3000)
        setTheme(R.style.Theme__15_Firebase_App)
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)
    }
}