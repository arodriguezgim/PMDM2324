package org.iesch.alberto.a13_sharedpreferences

import android.app.Application

class UserVipApplicaton : Application() {
    // To do lo que  tengamos aqui se ejecutara al comenzar la aplicacion.

    companion object {
        lateinit var prefs: Prefs
    }

    override fun onCreate() {
        super.onCreate()
        // Cuando se encienda esta app haz lo que te diga aqui
        prefs = Prefs(applicationContext)
    }
}