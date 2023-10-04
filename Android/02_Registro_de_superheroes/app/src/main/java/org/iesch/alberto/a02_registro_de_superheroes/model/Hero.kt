package org.iesch.alberto.a02_registro_de_superheroes.model

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

// 15 - Creamos la clase Hero y añadimos los parametros necesarios
// 17 - Hacemos que el objeto sea parcelable
@Parcelize
class Hero(
    val name: String,
    val alterEgo: String,
    val bio: String,
    val power: Float
) : Parcelable