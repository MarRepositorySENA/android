package com.Sena.libreriaapi.Entity
//se crean los atributos del modelo
data class book(
    var id:Int,
    var titulo:String,
    var autor: String,
    var isbn: Long,
    var genero: String,
    var num_ejem_disponible: Int,
    var num_ejem_ocupados: Int
)
