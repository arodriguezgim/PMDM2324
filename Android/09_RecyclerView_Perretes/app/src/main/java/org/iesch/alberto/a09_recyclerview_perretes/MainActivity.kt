package org.iesch.alberto.a09_recyclerview_perretes

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.inputmethod.InputMethodManager
import android.widget.Toast
import androidx.appcompat.widget.SearchView.OnQueryTextListener
import androidx.recyclerview.widget.LinearLayoutManager
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import org.iesch.alberto.a09_recyclerview_perretes.databinding.ActivityMainBinding
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.create

class MainActivity : AppCompatActivity(), OnQueryTextListener {

    private lateinit var binding: ActivityMainBinding
    private lateinit var adapter: DogAdapter
    private val dogImages = mutableListOf<String>()
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.svDogs.setOnQueryTextListener(this)

        // 1 Iniciamos el metodopara iniciar el RecyclerView
        initRecyclerView()
    }

    private fun initRecyclerView() {
        adapter = DogAdapter(dogImages)
        // antes de empezar aqui debemos crear un Adapter
        binding.rvDogs.layoutManager = LinearLayoutManager(this)
        binding.rvDogs.adapter = adapter

    }

    // Nos creamos una instancia de Retrofit
    private fun getRetrofit():Retrofit{
        return Retrofit.Builder()
            .baseUrl("https://dog.ceo/api/breed/")
            .addConverterFactory(GsonConverterFactory.create())
            .build()
    }

    // Usaremos corrutinas
    private fun buscarPorRaza(raza: String){
        CoroutineScope(Dispatchers.IO).launch {
            // To-do lo que hagamos aqui se hará en un hilo secundario
            val call = getRetrofit().create<APIService>(APIService::class.java).getPerrosPorRaza("$raza/images")
            val puppies = call.body()
            runOnUiThread {
                // To do lo que ejecutemos aqui dentro se ejecutará en el hilo principal
                if (call.isSuccessful){
                    // Mostrar RecyclerView
                    val images = puppies?.images ?: emptyList()

                    dogImages.clear()
                    dogImages.addAll(images)
                    // Avisamos al Adapter que ha habido cambios
                    adapter.notifyDataSetChanged()
                }else{
                    // Mostrar un error
                    showError()
                }
                hideKeyBoard()
            }

        }
    }

    private fun hideKeyBoard() {
        // Ocultamos el teclado
        val imm = getSystemService(INPUT_METHOD_SERVICE) as InputMethodManager
        imm.hideSoftInputFromWindow(binding.viewRoot.windowToken, 0)
    }

    private fun showError() {
        Toast.makeText(this,"Ha ocurrido un error", Toast.LENGTH_SHORT).show()
    }

    override fun onQueryTextSubmit(query: String?): Boolean {
        // Cuando pulsamos search se llamará a este metodo
        if (!query.isNullOrEmpty()){
            buscarPorRaza(query.lowercase())
        }
        return true
    }

    override fun onQueryTextChange(newText: String?): Boolean {
        return true
    }
}























