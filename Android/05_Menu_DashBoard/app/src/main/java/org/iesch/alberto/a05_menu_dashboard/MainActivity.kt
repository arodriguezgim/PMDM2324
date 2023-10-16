package org.iesch.alberto.a05_menu_dashboard

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import org.iesch.alberto.a05_menu_dashboard.databinding.ActivityMainBinding
import org.iesch.alberto.a05_menu_dashboard.ui.CalculadoraActivity
import org.iesch.alberto.a05_menu_dashboard.ui.EdadCaninaActivity
import org.iesch.alberto.a05_menu_dashboard.ui.GaleriaActivity
import org.iesch.alberto.a05_menu_dashboard.ui.MapasActivity
import org.iesch.alberto.a05_menu_dashboard.ui.QuizzesActivity
import org.iesch.alberto.a05_menu_dashboard.ui.RestaurantesActivity
import org.iesch.alberto.a05_menu_dashboard.ui.SettingsActivity
import org.iesch.alberto.a05_menu_dashboard.ui.SuperHeroesActivity

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.rellayCalculadora.setOnClickListener {
            intent = Intent(this, CalculadoraActivity::class.java)
            startActivity(intent)
        }
        binding.rellaySuperheroes.setOnClickListener {
            intent = Intent(this, SuperHeroesActivity::class.java)
            startActivity(intent)
        }
        binding.rellayEdadCanina.setOnClickListener {
            intent = Intent(this, EdadCaninaActivity::class.java)
            startActivity(intent)
        }
        binding.rellayQuizzes.setOnClickListener {
            intent = Intent(this, QuizzesActivity::class.java)
            startActivity(intent)
        }
        binding.rellayGaleria.setOnClickListener {
            intent = Intent(this, GaleriaActivity::class.java)
            startActivity(intent)
        }
        binding.rellayMapas.setOnClickListener {
            intent = Intent(this, MapasActivity::class.java)
            startActivity(intent)
        }
        binding.rellayRestaurantes.setOnClickListener {
            intent = Intent(this, RestaurantesActivity::class.java)
            startActivity(intent)
        }
        binding.rellaySettings.setOnClickListener {
            intent = Intent(this, SettingsActivity::class.java)
            startActivity(intent)
        }
    }
}