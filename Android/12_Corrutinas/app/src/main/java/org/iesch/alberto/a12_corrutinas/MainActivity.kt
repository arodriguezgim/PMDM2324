package org.iesch.alberto.a12_corrutinas

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import androidx.lifecycle.lifecycleScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

class MainActivity : AppCompatActivity() {

    val retrofit = RetrofitHelper.getInstance()

    // Main -> Hilo principal. Es el que pinta la UI. No usar nunca que no sea para pintar la interfaz.
    // IO -> Peticiones no muy pesadas.
    // Default -> Operaciones muy pesadas que requieran mucha cpu.




    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        lifecycleScope.launch(Dispatchers.IO) {

            val response = retrofit.getSuperheroes("a")

            withContext(Dispatchers.Main){
                if (response.isSuccessful){
                    Toast.makeText(this@MainActivity,"FUNCIONA",Toast.LENGTH_SHORT).show()
                }
            }


        }



    }

    suspend fun ejemplo(){

    }
}





















