package com.Sena.libreriaapi

import android.os.Bundle
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.Sena.libreriaapi.config.urls
import com.android.volley.Request
import com.android.volley.toolbox.JsonArrayRequest
import com.android.volley.toolbox.Volley

class listarLibrosActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_listar_libros)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets

        }
        cargar_lista_libros()
    }
    fun cargar_lista_libros(){
        try{
            /**
             * se define el tipo de respuesta
             * JsonArrayRquest= respuesta en formato Json
             * porque trae varios registros
             * JsonObjectRequest=Respuesta en formato Json de un unico registro
             * StringRequest= Respuesta en formato String
             *
             * */

            var request= JsonArrayRequest(
                    Request.Method.GET, //Metodo
                urls.urlLibro,  //url del servicio
                null, //parametros
                {response-> //respuesta es correcta
                    var registros= response
                //TAREA: Crear un recyclerView que permite mostrar los datos (el scroll de facebook infinito Mar)
                },{error->// respuesta es incorrecta
                // no es la esperada
                    // errores que existen: TimeOutError(500)
                    // el servidor se demora tanto en responder que se paso el tiempo de espera
                    // primera posible solucion: poner la misma red al servidor y al telefono si se esta trabajando desde el celular
                    // segunda solucion: desactivar el firewall pero solo mientras se este ejecutando el programa, pero se debe activar una vez no se este trabajando
                    //-----------------------------
                    // error: clientError(400): solucion revisar la url a ver si esta correctamente
                    //error: clearText HTTP trafic: se da por eliminar esta ruta en el manifest: android:usesCleartextTraffic="true"
                    // error: por no escribir la conxion a internet en el manifest:<uses-permission android:name="android.permission.INTERNET" />

                    var registro= error
                }

            )
            val queue= Volley.newRequestQueue(this)
            queue.add(request)
        }catch (error:Exception){

        }
    }

}