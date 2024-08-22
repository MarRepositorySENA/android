package com.sena.examen

import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class ParImparActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_par_impar)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        var editTextNum = findViewById<EditText>(R.id.editTextNumPrimo)
        var editTextResultParImpar = findViewById<EditText>(R.id.editTextResultParImpar)
        var btnIdentificar = findViewById<Button>(R.id.btnIdentificar)

        btnIdentificar.setOnClickListener {
            var number = editTextNum.text.toString().toIntOrNull()

            if (number != null) {
                if (number % 2 == 0){
                    editTextResultParImpar.setText("El numero digitado es Par")
                }else {
                    editTextResultParImpar.setText("El numero digitado es Impar")
                }
            }else {
                editTextResultParImpar.setText("por favor ingresar un numero valido")
            }
        }

    }
}