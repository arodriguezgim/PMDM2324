package org.iesch.alberto.a11_menu_tabs

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import org.iesch.alberto.a11_menu_tabs.databinding.ActivityMainBinding

private lateinit var binding : ActivityMainBinding
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
    }
}