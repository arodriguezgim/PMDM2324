package org.iesch.alberto.a08_recyclerview_terremotos.model

// 1
// 11 Añadimos data
data class Terremoto( val id: String, val lugar: String, val magnitud:Double, val hora: Long, val longitud: Double, val latitud: Double) {
}