package com.creater.a09_retrofit_perretes

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.inputmethod.InputMethodManager
import android.widget.Toast
import androidx.appcompat.widget.SearchView.OnQueryTextListener
import androidx.recyclerview.widget.LinearLayoutManager
import com.creater.a09_retrofit_perretes.databinding.ActivityMainBinding
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.create

// 18 - Para poder usar el buscador y nos avise al pulsar el boton (androidx) e implemento metodos
class MainActivity : AppCompatActivity(), OnQueryTextListener {

    private lateinit var binding: ActivityMainBinding
    // 13
    private lateinit var adapter: DogAdapter
    private val dogImages = mutableListOf<String>()
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        // 21 -
        binding.svDogs.setOnQueryTextListener(this)

        // 1 - Creamos un metodo que inicie el recyclerView
        initRecyclerView()
    }

    // 1b
    private fun initRecyclerView() {
        // primero hemos de crear un Adapter

        // 12
        adapter = DogAdapter(dogImages)
        binding.rvDogs.layoutManager = LinearLayoutManager(this)
        // 14

        binding.rvDogs.adapter = adapter
    }

    private fun getRetrofit():Retrofit{
       return  Retrofit.Builder()
           .baseUrl("https://dog.ceo/api/breed/")
           .addConverterFactory(GsonConverterFactory.create())
           .build()
    }

    // 6
    private fun buscarPorRaza(query: String){
        CoroutineScope(Dispatchers.IO).launch {
            val call = getRetrofit().create<APIService>(APIService::class.java).getPerrosPorRaza("$query/images")
            val puppies = call.body()
            // 15 - Estamos en una Corrutina. Hemos de volver al hilo principal.
            runOnUiThread {
                // to-do lo que ejecutemos aqui dentro se ejecutara en el hilo principal
                // Y como el if pintara un toast o el adapter lo metemos aqui
                if (call.isSuccessful){
                    // mostrar recyclerview
                    // 17a almacenamosen una variable las imagenes.Como puede ser nulo ponemos ?: para decirle que puede ser nada
                    val images = puppies?.images ?: emptyList()
                    // 17b Primero borramos to-do que tengamos y añadimos to-do lo que hemos recibido
                    dogImages.clear()
                    dogImages.addAll(images)
                    // 17c Avisamos al adapter que han habido cambios
                    adapter.notifyDataSetChanged()
                }else{
                    // mostrar error
                    //16 si falla la peticion llamamos al metodo y creamos el metodo
                    showError()
                }
                // 23a
                hideKeyBoard()
            }

        }
    }

    //23 b
    private fun hideKeyBoard() {
        // ocultamos el teclado
        val imm = getSystemService(INPUT_METHOD_SERVICE) as InputMethodManager
        imm.hideSoftInputFromWindow(binding.viewR oot.windowToken, 0)
    }


    private fun showError() {
        Toast.makeText(this,"HA ocurrido un error",Toast.LENGTH_LONG).show()
    }

    override fun onQueryTextSubmit(query: String?): Boolean {
        // 20 - Cuando pulsamos buscar se llamara a aeste metodo
        if(!query.isNullOrEmpty()){
            buscarPorRaza(query.lowercase())
        }
        return true
    }

    override fun onQueryTextChange(newText: String?): Boolean {
        // 19 Estos metodo nos avisaran cuando el usuario escriba cada letra o borre. No nos interesa
        return true
    }
}