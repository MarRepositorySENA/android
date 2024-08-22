package com.sena.examen

import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class NumPrimoActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_num_primo)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }
        var btnCalcularPrimo = findViewById<Button>(R.id.btnCalcularPrimo)
        var editTextNumPrimo = findViewById<EditText>(R.id.editTextNumPrimo)
        var editTextResultPrimo = findViewById<EditText>(R.id.editTextResultPrimo)

        btnCalcularPrimo.setOnClickListener{
            val numero = editTextNumPrimo.text.toString().toIntOrNull()

            if (numero != null && numero > 1)
                var esPrimo = (2 until numero).none { numero % it == 0 }

        }
        }


    }
}