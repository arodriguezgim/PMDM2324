package com.creater.a04_basketball_score

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class MainViewModel: ViewModel() {
    // 1- Usamos MutableLiveData para los marcadores
    var localScore : MutableLiveData<Int> = MutableLiveData()
    var visitorScore : MutableLiveData<Int> = MutableLiveData()
    // 4 - Cuando inicializamos viewModel se ejecuta este metodo
    // de manera que nos aseguramos no tener nulos
    init {
        resetScores()
    }


    fun resetScores() {
        // 2 - En vez de asignar valores...
        localScore.value = 0
        visitorScore.value = 0
        // El valor que viene por defecto es NULO. Hay que tener cuidado si no lo hemos asignado.
    }


    fun addPointsToScore(points: Int, isLocal: Boolean) {
        // 3 - Macemos lo mismo para el resto de métodos
        if (isLocal) {
            localScore.value = localScore.value?.plus(points)
            // localScore.value = localScore.value!! + points
        } else {
            visitorScore.value = visitorScore.value!! + points
        }
    }

    fun decreaseLocalScore() {
        if (localScore.value!! > 0){
            localScore.value = localScore.value!! - 1
        }
    }
    fun decreaseVisitorScore() {
        if (visitorScore.value!! > 0){
            visitorScore.value = visitorScore.value!! - 1
        }
    }

}


















