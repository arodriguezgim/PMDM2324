package org.iesch.alberto.a06_listview_splashscreen

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.ArrayAdapter
import android.widget.ListView
import android.widget.Toast

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // 1 - Creo un ArrayAdapter para trabajar con los elementos que van dentro des ListView
        val arrayAdapter: ArrayAdapter<*>
        // 2 - Me creo una lista MUTABLE y coloco elementos
        val versiones = mutableListOf("Pie","Oreo","Nougat","Marshmallow","Lollipop","Kitkat","JellyBean","Ice Cream","...")
        // 3 - Declaro la variable que va a llamar de forma gráfica a mi ListView
        val lvDatos = findViewById<ListView>(R.id.lvVersiones)
        // 4 - Para llenar de datos nuestra lista hemos de crear un Adaptador que es un objeto de tipo ArrayAdapter
        // Recibe 3 parámetros:
        // - el contexto (this)
        // -Cómo quiero mostrar en la pantalla los elementos listados (usaré una lista generica de android)
        // - Qué datos muestro por pantalla
        arrayAdapter = ArrayAdapter(this, android.R.layout.simple_list_item_1, versiones)
        // 5 - Llamo a lvDatos y lo adapto, el adaptador traerá toda la informacion y lo adaptará a la lista
        lvDatos.adapter = arrayAdapter

        // 6 Quiero hacer algo en base al aelemento de la lista en el que pulso.
        // parent es el elemento visual donde estan los datos
        // view es la Vista
        // position es la posicion del elemento en el que estoy trabajando
        // id es el index de ese elemento
        lvDatos.setOnItemClickListener { parent, view, position, id ->
            Toast.makeText(this, parent.getItemAtPosition(position).toString(), Toast.LENGTH_SHORT).show()
        }

    }
}

















