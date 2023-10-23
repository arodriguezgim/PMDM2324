package org.iesch.alberto.a08_recyclerview_terremotos

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import org.iesch.alberto.a08_recyclerview_terremotos.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
    }
}