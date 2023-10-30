package org.iesch.alberto.a09_recyclerview_perretes

import com.google.gson.annotations.SerializedName

data class DogsResponse (@SerializedName("status") var status: String, @SerializedName("message") var images: List<String>)