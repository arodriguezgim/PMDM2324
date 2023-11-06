package com.creater.a09_retrofit_perretes

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView

// 2 - Nuestro Dog Adapter recibira uuna lista de Strings, le tendremos que pasar el ViewHolder que todavia no hemos realizado
class DogAdapter(val images:List<String>):RecyclerView.Adapter<DogViewHolder>() {
    // 5 - Implementamos los metodos (3)
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): DogViewHolder {
        // 8 el + coñazo
        val layoutInflater = LayoutInflater.from(parent.context)
        // 9 aqui tendremos que crear el nombre del layout que vamos a inflar que aun no tenemos.
        return DogViewHolder(layoutInflater.inflate(R.layout.item_dog , parent, false))
    }

    override fun getItemCount(): Int {
        // 6 devolverá el tamaño de la lista que obtengamos
        return images.size
    }

    override fun onBindViewHolder(holder: DogViewHolder, position: Int) {
        // 7 crearemos un val item = a images y la posicion del item
        // llamamos a nuestro holder y le pasamos el item
        val item = images[position]
        holder.bind(item)
    }
}