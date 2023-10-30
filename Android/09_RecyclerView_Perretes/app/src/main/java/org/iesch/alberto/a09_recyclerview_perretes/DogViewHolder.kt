package org.iesch.alberto.a09_recyclerview_perretes

import android.view.View
import androidx.recyclerview.widget.RecyclerView
import com.squareup.picasso.Picasso
import org.iesch.alberto.a09_recyclerview_perretes.databinding.ItemDogBinding

// Esta clase recibirá la view que vamos a pintar

class DogViewHolder(view: View):RecyclerView.ViewHolder(view) {
    // Creamos el metodo que recibira la imagen por cada celda que vaya a mostrar
    private val binding = ItemDogBinding.bind(view)
    fun bind(image:String){
        // A traves de la libreria Picasso obtendremos la imagen a traves de una url
        Picasso.get().load(image).into(binding.ivDog)

    }
}