package org.iesch.alberto.a12_corrutinas

import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.create

object RetrofitHelper {

    private const val URL = "https://superheroapi.com/"

    private var retrofit = Retrofit
        .Builder()
        .baseUrl(URL)
        .addConverterFactory(GsonConverterFactory.create())
        .build()

    fun getInstance() : ApiServices {
        return retrofit.create(ApiServices::class.java)
    }
}