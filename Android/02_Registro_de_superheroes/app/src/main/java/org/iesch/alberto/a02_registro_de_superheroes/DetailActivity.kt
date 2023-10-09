package org.iesch.alberto.a02_registro_de_superheroes

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import org.iesch.alberto.a02_registro_de_superheroes.databinding.ActivityDetailBinding
import org.iesch.alberto.a02_registro_de_superheroes.model.Hero

class DetailActivity : AppCompatActivity() {

    companion object{
        const val HERO_KEY = "superhero_name"
        const val IMAGE_PATH_KEY = "bitmap_key"
    }
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val binding = ActivityDetailBinding.inflate(layoutInflater)
        setContentView(binding.root)
        val extras:Bundle = intent.extras!!
        val superHero = extras.getParcelable<Hero>(HERO_KEY)!!
        val imagePath = extras.getString(IMAGE_PATH_KEY)
        val bitmap = BitmapFactory.decodeFile(imagePath)

        if (bitmap != null) {
            binding.imageView.setImageBitmap(bitmap)
        }
        binding.superHero = superHero

    }
}