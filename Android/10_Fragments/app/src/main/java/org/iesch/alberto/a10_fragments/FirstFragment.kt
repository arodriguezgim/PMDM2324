package org.iesch.alberto.a10_fragments

import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup


class FirstFragment : Fragment() {

    private var nombre: String? = null
    private var direccion: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        arguments?.let {
            nombre = it.getString(NOMBRE)
            direccion = it.getString(DIRECCION)

            Log.i("dam2", nombre.orEmpty())
        }
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_first, container, false)
    }

    companion object {
        const val NOMBRE = "nombre"
        const val DIRECCION = "direccion"
        @JvmStatic
        fun newInstance(nombre: String, direccion: String) =
            FirstFragment().apply {
                arguments = Bundle().apply {
                    putString(NOMBRE, nombre)
                    putString(DIRECCION, direccion)
                }
            }
    }
}