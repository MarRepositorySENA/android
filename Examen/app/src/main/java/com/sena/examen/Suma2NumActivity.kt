package com.sena.examen

import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class Suma2NumActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_suma2_num)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        var num1EditText = findViewById<EditText>(R.id.editTextNum1)
        var num2EditText = findViewById<EditText>(R.id.editTextNum2)
        var resultadoEditText = findViewById<EditText>(R.id.editTextResultado)
        var sumarButton = findViewById<Button>(R.id.btnSumar)


        sumarButton.setOnClickListener {
            var num1 = num1EditText.text.toString().toDoubleOrNull()
            var num2 = num2EditText.text.toString().toDoubleOrNull()

            if (num1 != null && num2 != null){
                var resultado = num1+num2

                resultadoEditText.setText(resultado.toString())
            } else {
                resultadoEditText.setText("Error: numeros mal ingresados")
            }
        }
    }
}