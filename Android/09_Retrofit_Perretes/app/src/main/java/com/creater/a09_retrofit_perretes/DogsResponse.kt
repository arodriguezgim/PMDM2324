package com.creater.a09_retrofit_perretes

import com.google.gson.annotations.SerializedName

// 1 - Añadimos data y le quitamos las llaves.
// Observamos la resopuesta y fabriv¡camos la llegada.
data class DogsResponse (
    @SerializedName("status") var status:String,
    @SerializedName("message") var images: List<String>
)