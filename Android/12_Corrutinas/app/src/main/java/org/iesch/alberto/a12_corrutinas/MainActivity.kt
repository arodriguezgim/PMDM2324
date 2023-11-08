package org.iesch.alberto.a12_corrutinas

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import androidx.lifecycle.lifecycleScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
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
            waitForCourutines()
            val response = retrofit.getSuperheroes("a")

//            withContext(Dispatchers.Main){
//                if (response.isSuccessful){
//                    Toast.makeText(this@MainActivity,"FUNCIONA",Toast.LENGTH_SHORT).show()
//                }
//            }
            runOnUiThread { Toast.makeText(this@MainActivity,"FUNCIONA",Toast.LENGTH_SHORT).show() }

        }

    }

    suspend fun waitForCourutines(){

        lifecycleScope.launch(Dispatchers.IO) {

//            val deferred1 = async { retrofit.getSuperheroes("a") }
//            val deferred2 = async { retrofit.getSuperheroes("b") }
//            val deferred3 = async { retrofit.getSuperheroes("c") }
//            val deferred4 = async { retrofit.getSuperheroes("d") }
//
//            val response1 = deferred1.await()
//            val response2 = deferred2.await()
//            val response3 = deferred3.await()
//            val response4 = deferred4.await()

            val deferreds = listOf(
                async { retrofit.getSuperheroes("a") },
                async { retrofit.getSuperheroes("b") },
                async { retrofit.getSuperheroes("c") },
                async { retrofit.getSuperheroes("d") },
                async { retrofit.getSuperheroes("e") },
                async { retrofit.getSuperheroes("f") },
                async { retrofit.getSuperheroes("g") }
            )
            val response = deferreds.awaitAll()

        }

    }
}





















