package com.creater.a09_retrofit_perretes

import retrofit2.Response
import retrofit2.http.GET
import retrofit2.http.Url

// 2 - Creamos la interfaz, la cual va a contener el metodo ( o los metodos)
// por los cuales queramos acceder a nuestro servicio (consumir ese API)
interface APIService {
    // 3 - Tipo de llamada
    // 4 - Esta funcion recibirá por parámetro algo. Una direccion fina y hound/images
    // Devolvera una respuesta de tipo DogsResponse
    // 22 suspend
    @GET
    suspend fun getPerrosPorRaza(@Url url: String):Response<DogsResponse>
}