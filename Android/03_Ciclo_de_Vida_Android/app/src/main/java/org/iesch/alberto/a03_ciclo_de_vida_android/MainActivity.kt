package org.iesch.alberto.a03_ciclo_de_vida_android

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        Log.i("CICLO_DE_VIDA_ANDROID","Entramos al método onCreate")
    }

    override fun onStart() {
        super.onStart()
        Log.i("CICLO_DE_VIDA_ANDROID","Entramos al método onStart")
    }

    override fun onResume() {
        super.onResume()
        Log.i("CICLO_DE_VIDA_ANDROID","Entramos al método onResume")
    }

    override fun onPause() {
        super.onPause()
        Log.i("CICLO_DE_VIDA_ANDROID","Entramos al método onPause")
    }

    override fun onStop() {
        super.onStop()
        Log.i("CICLO_DE_VIDA_ANDROID","Entramos al método onStop")
    }

    override fun onDestroy() {
        super.onDestroy()
        Log.i("CICLO_DE_VIDA_ANDROID","Entramos al método onDestroy")
    }

    override fun onRestart() {
        super.onRestart()
        Log.i("CICLO_DE_VIDA_ANDROID","Entramos al método onRestart")
    }
}






















