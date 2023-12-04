package org.iesch.alberto.firebase

import android.content.Intent
import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import androidx.activity.result.contract.ActivityResultContracts
import org.iesch.alberto.firebase.databinding.ActivityUploadPhotoBinding

class UploadPhotoActivity : AppCompatActivity() {

    //2
    private lateinit var binding : ActivityUploadPhotoBinding
    private var currentFile : Uri? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityUploadPhotoBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.ivFoto.setOnClickListener {
            // abrimos el storage (la galeria)
            Intent(Intent.ACTION_GET_CONTENT).also {
                // Filtramos solamente las imagenes
                it.type = "image/*"
                imageLauncher.launch(it)
            }
        }

    }

    private val imageLauncher = registerForActivityResult(ActivityResultContracts.StartActivityForResult()){
            result ->
        if ( result.resultCode == RESULT_OK){
            // 3
            result?.data?.data?.let {
                currentFile = it
                binding.ivFoto.setImageURI(it)
            }
        } else {
            Toast.makeText(this, "No se ha seleccionado ninguna imagen", Toast.LENGTH_SHORT).show()
        }
    }
}