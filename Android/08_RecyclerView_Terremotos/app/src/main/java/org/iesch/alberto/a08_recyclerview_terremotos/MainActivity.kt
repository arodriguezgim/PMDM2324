package org.iesch.alberto.a08_recyclerview_terremotos

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
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



        val adapter = TerremotoAdapter()
        binding.eqRecycler.adapter = adapter
        adapter.submitList(listaTerremotos)

        if (listaTerremotos.isEmpty()){
            binding.terremotoEmptyView.visibility = View.VISIBLE
        } else {
            binding.terremotoEmptyView.visibility = View.GONE
        }
    }
}
















