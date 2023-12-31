package org.iesch.alberto.a01_edad_canina

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import org.iesch.alberto.a01_edad_canina.databinding.ActivityMainBinding


//3 - Añadimos Data Binding
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        //setContentView(R.layout.activity_main)

        // 1 - Tomamos el control sobre las Vistas que vamos a necesitar en la Activity
        //val resulText = findViewById<TextView>(R.id.result_text)
        //val calculateButton = findViewById<Button>(R.id.calculate_button)
        //val ageEdit = findViewById<EditText>(R.id.age_edit)
        // Creamos un nuevo objeto binding. Esto enlazará con el Layout que se formó y lo va a inflar.
        // INFLAR: Formar un layout
        val binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // En Android tenemos diferentes tipos de Logs
        //Log.i("MainActivity","Activity creada info")
        //Log.v("MainActivity","Activity creada verbose")
        //Log.d("MainActivity","Activity creada debug")
        //Log.w("MainActivity","Activity creada warning")
        //Log.e("MainActivity","Activity creada error")

        // 2 - Los botones tienen la propiedad onClickListener al pulsarlos
        binding.calculateButton.setOnClickListener {
            val ageString = binding.ageEdit.text.toString()

            if (ageString.isEmpty()){
                //Mostramos un mensaje de tipo Toast para avisar al usuario de que introduzca un número
                Toast.makeText(this,getString(R.string.debes_numero),Toast.LENGTH_LONG).show()
            } else {
                val ageInt = ageString.toInt()
                val dogAge = ageInt * 7
                binding.resultText.text = getString(R.string.resultado, dogAge)
            }

        }
    }
}