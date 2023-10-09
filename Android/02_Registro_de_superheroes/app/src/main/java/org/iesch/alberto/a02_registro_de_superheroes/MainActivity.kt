package org.iesch.alberto.a02_registro_de_superheroes

import android.app.Activity
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.net.Uri
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Environment
import android.provider.MediaStore
import android.util.Log
import android.widget.ImageView
import androidx.activity.result.contract.ActivityResultContracts
import androidx.core.content.FileProvider
import androidx.core.graphics.drawable.toBitmap
import org.iesch.alberto.a02_registro_de_superheroes.databinding.ActivityMainBinding
import org.iesch.alberto.a02_registro_de_superheroes.model.Hero
import java.io.File

class MainActivity : AppCompatActivity() {

    // 27a - Nos creamos la variable global y la declaramos en el onCreate
    private lateinit var heroImage: ImageView
    // lateinit sirve para prometer a kotlin que cuando esta variable se establece ya estará declarada.
    // Esta variable no puede ser nula

    // 30 a
    private var heroBitmap: Bitmap? = null
    /*
    private val getContent = registerForActivityResult(ActivityResultContracts.TakePicturePreview()){
        // Esta funcion nos devuelve un bitmap y seteamos heroBitmap al bitmap que nos devuelve
        bitmap ->
            heroBitmap = bitmap
            //Pintamos la imagen en miniatura
            heroImage.setImageBitmap(heroBitmap!!)
    }
    */
    private var pictureFullPath = ""
    private val getContent = registerForActivityResult(ActivityResultContracts.TakePicture()){
        // Ahora nos devuelve un booleano. Si la toma de la foto fue exitosa devolvemos un success
        success ->
        if ( success && pictureFullPath.isNotEmpty()){
            heroBitmap = BitmapFactory.decodeFile(pictureFullPath)
            // Pintamos la imagen en miniatura
            heroImage.setImageBitmap(heroBitmap!!)
        }
    }


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // 1 - Aplicamos dataBinding
        val binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        //27 b
        heroImage = binding.superheroImage
        // 2 - Comprobamos que tenemos el binding y llamamos a la función que abre el Activity de Detalle
        binding.saveButton.setOnClickListener {
            // 6 - Nos creamos las variables necesarias para pasárselas al intent
            val superHeroName = binding.heroNameEdit.text.toString()
            val alterEgo = binding.alterEgoEdit.text.toString()
            val bio = binding.bioEdit.text.toString()
            val power = binding.powerBar.rating
            // 14 - ME creo un herop con los valores que he introducido
            val heroe = Hero(superHeroName, alterEgo, bio, power)
            abrirDetailActivity(heroe)
        }

        //25 - Añadoimos el onclickListener a la Imagen
        binding.superheroImage.setOnClickListener {
            abrirCamara()
        }
    }

    private fun abrirCamara() {
        /* abrimos el INTENT IMPLICITO yq ue android es quien elige qué aplicacion abre este intent
        val cameraIntent = Intent(MediaStore.ACTION_IMAGE_CAPTURE)
        startActivityForResult(cameraIntent, 1000)*/
        // Creamos un File y de ese file recuperamos el uri. Creamos la funcion
        val imageFile = createImageFile()
        // Dependiendo de la version de ANDROID que tengamos, esa uri la podemos obtener de una manera u otra
        val uri = if ( Build.VERSION.SDK_INT >= Build.VERSION_CODES.N){
            // En las nuevas versiones de Android se necesita tener permisos para hacer uso de otras aplicaciones
            // Para dar ese permiso necesitamos el fileProvider
            // Hemos de ir al manifest desde aqui
            FileProvider.getUriForFile(
                this,
                "$packageName.provider",
                imageFile
            )
        } else {
            //Uri es como un String en formato URI
            Uri.fromFile(imageFile)
        }

        //30 b Nos pide un uri, vamos a crear esto
        getContent.launch(uri)

    }

    private fun createImageFile(): File {
        val filename = "superhero_image"
        // Directorio donde vamos a guardar la imagen. Directorio PICTURES se utiliza por defecto para guardar imagenes
        val fileDirectory = getExternalFilesDir(Environment.DIRECTORY_PICTURES)
        // Creamos nuestro file, nos pide el nombre, el formato y el directorio
        val file = File.createTempFile(filename,".jpg", fileDirectory)
        // El path absoluto se va a guardar en PicturePath
        pictureFullPath = file.absolutePath
        //Devolvemos el File
        return file
    }


    // 3- esta función generará un Intent y nos llevará a detalle
    // 7
    // 15 - Modificamos el metodo para que reciba solo un Hero
    private fun abrirDetailActivity(heroe:Hero) {
        // 4 - El Intent debe tener la información de desde dónde se envía y hacia dónde quiero ir
        val intent = Intent(this, DetailActivity::class.java)
        // 8 - Agregamos los valores al intent
        /*
        intent.putExtra(DetailActivity.SUPERHERO_NAME_KEY, superHeroName)
        intent.putExtra(DetailActivity.ALTER_EGO_KEY, alterEgo)
        intent.putExtra(DetailActivity.BIO_KEY, bio)
        intent.putExtra(DetailActivity.POWER_KEY, power)
        Log.d("MainActivity", superHeroName)
         */
        //18 - Pasamos solamente el superhero
        intent.putExtra(DetailActivity.HERO_KEY, heroe)
        //intent.putExtra(DetailActivity.IMAGE_PATH_KEY, heroImage.drawable.toBitmap())
        // 31
        intent.putExtra(DetailActivity.IMAGE_PATH_KEY, pictureFullPath)
        // 5 - Para utilizar el intent hemos de llamar a startActivity
        startActivity(intent)
    }


    //26 - onActivityResult es para recibir los datos de la camara
    /*
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if ( resultCode == Activity.RESULT_OK && requestCode == 1000){
            val extras = data?.extras
            val heroBitmap = extras?.getParcelable<Bitmap>("data")
            // desde aqui no puedo aaceeder a heroImage. Hemos de crear la variable global
            // 27 c
            heroImage.setImageBitmap(heroBitmap)
        }

    }*/
}




















