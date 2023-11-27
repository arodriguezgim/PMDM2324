package org.iesch.alberto.firebase

import android.os.Handler
import android.os.Looper
import android.widget.Toast
import com.google.firebase.messaging.FirebaseMessagingService
import com.google.firebase.messaging.RemoteMessage

// Esta clase sera capaz de recibir las notificaciones y mediante la cual podremos manejarlas a nuestro antojo
class MyFirebaseMessagingService : FirebaseMessagingService() {

    //Si enviamos una notificacion cuando la app esta enprimer plano, debemos manejarla nosotros
    override fun onMessageReceived(message: RemoteMessage) {
        super.onMessageReceived(message)
        // Al recibirla vamos a mostrar un Toast
        Looper.prepare()
        Handler().post {
            Toast.makeText(this, message.data.toString(), Toast.LENGTH_SHORT).show()
        }
    }

}