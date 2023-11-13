package org.iesch.alberto.a13_sharedpreferences

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.core.content.ContextCompat
import org.iesch.alberto.a13_sharedpreferences.UserVipApplicaton.Companion.prefs
import org.iesch.alberto.a13_sharedpreferences.databinding.ActivityResultBinding


private lateinit var binding : ActivityResultBinding
class ResultActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityResultBinding.inflate(layoutInflater)
        setContentView(binding.root)

        initUI()

        binding.btnVolver.setOnClickListener {
            prefs.borrarAll()
            onBackPressed()
        }




    }

    private fun initUI() {

        val username = prefs.getNombre()
        binding.tvName.text = "Bienvenido $username"
        if (prefs.getVIP()){
            setColorBackground()
        }
    }

    private fun setColorBackground() {
        binding.container.setBackgroundColor(ContextCompat.getColor(this, R.color.vip_yellow))
    }
}
















