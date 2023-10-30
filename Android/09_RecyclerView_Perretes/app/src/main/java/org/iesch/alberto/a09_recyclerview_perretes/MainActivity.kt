package org.iesch.alberto.a09_recyclerview_perretes

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import org.iesch.alberto.a09_recyclerview_perretes.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
    }
}