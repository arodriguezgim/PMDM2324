package org.iesch.alberto.a13_sharedpreferences

import android.content.Context

class Prefs(val context : Context) {
    // Nuestra clase prefs guardará y recuperará informacion
    // Necesitaremos el Contexto de la aplicacion, y aqui no lo tenemos inicialmente.
    // Me creo una variable para que que quede más bonito, este será mi BD
    val SHARED_USER_NAME = "username"
    val SHARED_VIP = "vip"


    val SHARED_BD = "MiBD"
    val storage = context.getSharedPreferences(SHARED_BD, 0)

    fun guardarNombre(nombre : String){
        storage.edit().putString(SHARED_USER_NAME, nombre).apply()
    }
    fun guardarVIP(vip : Boolean){
        storage.edit().putBoolean(SHARED_VIP, vip).apply()
    }
    fun getNombre() : String {
        return storage.getString(SHARED_USER_NAME,"")!!
    }
    fun getVIP() : Boolean {
        return storage.getBoolean(SHARED_VIP, false)
    }

    fun borrarAll(){
        storage.edit().clear().apply()
    }

}

















