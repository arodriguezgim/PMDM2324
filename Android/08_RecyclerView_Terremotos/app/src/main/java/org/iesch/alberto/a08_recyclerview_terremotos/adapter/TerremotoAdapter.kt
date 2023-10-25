package org.iesch.alberto.a08_recyclerview_terremotos.adapter

import android.annotation.SuppressLint
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import androidx.recyclerview.widget.RecyclerView.ViewHolder
import org.iesch.alberto.a08_recyclerview_terremotos.R
import org.iesch.alberto.a08_recyclerview_terremotos.databinding.TerremotoItemBinding
import org.iesch.alberto.a08_recyclerview_terremotos.model.Terremoto

// 4 - Hemos de heredar de ListAdapter y nos pide dos valores:
// - El tipo de datos que procesará el adaptador
// - El viewHolder que se encargará de reciclar las vistas

class TerremotoAdapter : ListAdapter<Terremoto, TerremotoAdapter.TerremotoViewHolder>(DiffCallback){
    // 10
    // Ayuda al Adapter a que cuando cambie un elemento sepa cual se quita o cual se añade
    companion object DiffCallback: DiffUtil.ItemCallback<Terremoto>(){
        override fun areItemsTheSame(oldItem: Terremoto, newItem: Terremoto): Boolean {
            return  oldItem.id == newItem.id
        }

        override fun areContentsTheSame(oldItem: Terremoto, newItem: Terremoto): Boolean {
            return  oldItem.equals(newItem)
        }


    }

    // 7 - Estos dos metodos se llaman para CADA ELEMENTO DEL RECYCLER
    override fun onCreateViewHolder(
        parent: ViewGroup,
        viewType: Int
    ): TerremotoAdapter.TerremotoViewHolder {
        // 13 dataBinding
        val binding = TerremotoItemBinding.inflate(LayoutInflater.from(parent.context))

        // 7b - Creamos el ViewHolder para cada elemento
        // Del LayoutInflater tomamos el contexto y a partir de ese contexto inflamos un layout
        // parent es simplemente el RecyclreView en el que estara funcionando ese adapter
        //val view = LayoutInflater.from(parent.context).inflate(R.layout.terremoto_item, parent, false)
        // 8 - Regresamos el terremotoAdapter con el layout que acabamos de crear
        return TerremotoViewHolder(binding)
        // 14 En lugar de un view le devuelvo el binding
    }

    override fun onBindViewHolder(holder: TerremotoAdapter.TerremotoViewHolder, position: Int) {
        // 9 - Obteniendo la posicion del elemento obtendremos el elemento correspondiente y lo dibujamos
        val terremoto = getItem(position)
        //holder.magnitudTerremoto.text = terremoto.magnitud.toString()
        //holder.lugarTexto.text = terremoto.lugar.toString()
        holder.bind(terremoto)
    }
    // 5 - Creamos nuestro ViewHolder
    // inner class porque es una clase que pertenece al Adapter
    // Le ponemos TerremotoViewHolder y le pasamos un View (terremoto_item)
    // Una vez pasada, vamos a heredar de RecyclerView.ViewHolder y le pasamos el mismo View al padre
    inner class TerremotoViewHolder(val binding: TerremotoItemBinding ): RecyclerView.ViewHolder(binding.root){
        // 6
        //val magnitudTerremoto = view.findViewById<TextView>(R.id.eq_magnitud_text)
        //val lugarTexto = view.findViewById<TextView>(R.id.eq_place_text)
        fun bind(terremoto: Terremoto){
            binding.eqMagnitudText.text = terremoto.magnitud.toString()
            binding.eqPlaceText.text = terremoto.lugar.toString()
        }
    }

}






















