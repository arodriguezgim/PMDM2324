package org.iesch.alberto.a09_recyclerview_perretes

import retrofit2.Response
import retrofit2.http.GET
import retrofit2.http.Url

// Creamos la interfaz, que contendrá el método ( o los metodos)
// por los cuales queremos acceder  a nuestra API
interface APIService {
    @GET
    fun getPerrosPorRaza(@Url url: String):Response<DogsResponse>
}