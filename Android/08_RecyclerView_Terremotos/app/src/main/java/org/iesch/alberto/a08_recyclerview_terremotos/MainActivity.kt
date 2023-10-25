package org.iesch.alberto.a08_recyclerview_terremotos

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import org.iesch.alberto.a08_recyclerview_terremotos.adapter.TerremotoAdapter
import org.iesch.alberto.a08_recyclerview_terremotos.databinding.ActivityMainBinding
import org.iesch.alberto.a08_recyclerview_terremotos.model.Terremoto

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.eqRecycler.layoutManager = LinearLayoutManager(this)

        val listaTerremotos = mutableListOf<Terremoto>()
        listaTerremotos.add(Terremoto("1","Madrid",4.5, 273846152L, -1.3343, 40.98786754))
        listaTerremotos.add(Terremoto("2","Teruel",3.5, 273846152L, -1.3343, 40.98786754))
        listaTerremotos.add(Terremoto("3","Murcia",7.3, 273846152L, -1.3343, 40.98786754))
        listaTerremotos.add(Terremoto("4","Lorca",2.5, 273846152L, -1.3343, 40.98786754))
        listaTerremotos.add(Terremoto("5","Castralvo",4.5, 273846152L, -1.3343, 40.98786754))
        listaTerremotos.add(Terremoto("6","Algeciras",5.4, 273846152L, -1.3343, 40.98786754))
        listaTerremotos.add(Terremoto("7","Lima",7.1, 273846152L, -1.3343, 40.98786754))
        listaTerremotos.add(Terremoto("8","Los Angeles",4.5, 273846152L, -1.3343, 40.98786754))


        val adapter = TerremotoAdapter()
        binding.eqRecycler.adapter = adapter
        adapter.submitList(listaTerremotos)
    }
}
















