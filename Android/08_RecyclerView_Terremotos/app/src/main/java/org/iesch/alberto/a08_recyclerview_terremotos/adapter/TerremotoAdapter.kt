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

class TerremotoAdapter : ListAdapter<Terremoto, TerremotoAdapter.TerremotoViewHolder>(DiffCallback){

    companion object DiffCallback: DiffUtil.ItemCallback<Terremoto>(){
        override fun areItemsTheSame(oldItem: Terremoto, newItem: Terremoto): Boolean {
            return  oldItem.id == newItem.id
        }

        override fun areContentsTheSame(oldItem: Terremoto, newItem: Terremoto): Boolean {
            return  oldItem.equals(newItem)
        }
    }
    override fun onCreateViewHolder(
        parent: ViewGroup,
        viewType: Int
    ): TerremotoAdapter.TerremotoViewHolder {
        val binding = TerremotoItemBinding.inflate(LayoutInflater.from(parent.context))
        return TerremotoViewHolder(binding)
    }

    override fun onBindViewHolder(holder: TerremotoAdapter.TerremotoViewHolder, position: Int) {
        val terremoto = getItem(position)
        holder.bind(terremoto)
    }
    inner class TerremotoViewHolder(val binding: TerremotoItemBinding ): RecyclerView.ViewHolder(binding.root){
        fun bind(terremoto: Terremoto){
            binding.eqMagnitudText.text = terremoto.magnitud.toString()
            binding.eqPlaceText.text = terremoto.lugar.toString()
        }
    }

}






















