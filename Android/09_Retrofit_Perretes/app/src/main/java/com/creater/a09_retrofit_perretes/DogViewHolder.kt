package com.creater.a09_retrofit_perretes

import android.view.View
import androidx.recyclerview.widget.RecyclerView
import com.creater.a09_retrofit_perretes.databinding.ItemDogBinding
import com.squareup.picasso.Picasso

// 3 - esta clase recibirá la view que vamos a pintar
// 10 Añadimos el binding
class DogViewHolder(view:View):RecyclerView.ViewHolder(view) {
    // 4 creamos el metodo que recibira la image por cada celda que vayamos a mostrar
    private val binding = ItemDogBinding.bind(view)
    fun bind(image:String){
        // 11 A traves de picasso obtendremos la imagen a traves de una url
        Picasso.get().load(image).into(binding.ivDog)
    }
}