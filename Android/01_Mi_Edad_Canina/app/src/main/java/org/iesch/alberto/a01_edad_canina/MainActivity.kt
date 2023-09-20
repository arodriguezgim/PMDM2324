package org.iesch.alberto.a01_edad_canina

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // 1 - Tomamos el control sobre las Vistas que vamos a necesitar en la Activity
        val resulText = findViewById<TextView>(R.id.result_text)
        val calculateButton = findViewById<Button>(R.id.calculate_button)
        val ageEdit = findViewById<EditText>(R.id.age_edit)

        // 2 - Los botones tienen la propiedad onClickListener al pulsarlos
        calculateButton.setOnClickListener {
            val ageString = ageEdit.text.toString()
            val ageInt = ageString.toInt()
            val dogAge = ageInt * 7
            resulText.text = "Si fuesras perro, tu edad sería de $dogAge años"

        }
    }
}