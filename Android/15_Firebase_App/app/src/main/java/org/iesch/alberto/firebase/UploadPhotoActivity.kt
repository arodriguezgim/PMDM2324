package org.iesch.alberto.firebase

import android.content.Intent
import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import androidx.activity.result.contract.ActivityResultContracts
import com.google.firebase.Firebase
import com.google.firebase.storage.storage
import org.iesch.alberto.firebase.databinding.ActivityUploadPhotoBinding
import java.lang.Exception

class UploadPhotoActivity : AppCompatActivity() {

    //2
    private lateinit var binding : ActivityUploadPhotoBinding
    private var currentFile : Uri? = null
    private var imageReference = Firebase.storage.reference




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

        binding.btnUpload.setOnClickListener {
            uploadImageToStorage("1")
        }

    }

    private fun uploadImageToStorage(fileName: String) {
        // Esta funcion me subira la foto a Storage
        try {
            currentFile?.let {
                imageReference.child("imagenes/$fileName").putFile(it).addOnSuccessListener {
                    Toast.makeText(this, "La imagen se ha subido correctamente.", Toast.LENGTH_SHORT).show()
                } .addOnFailureListener{
                    Toast.makeText(this, "Error al subir la imagen.", Toast.LENGTH_SHORT).show()
                }
            }

        } catch (e: Exception){
            Toast.makeText(this, e.message, Toast.LENGTH_SHORT).show()
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