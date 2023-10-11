package com.creater.a04_basketball_score

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class MainViewModel: ViewModel() {

    // 1 - Usamos MutableLiveData para los marcadores
    var localScore : MutableLiveData<Int> = MutableLiveData()
    var visitorScore : MutableLiveData<Int> = MutableLiveData()
    // 4 - Cuando inicialicemos el ViewModel se ejecuta este metodo
    // de manera que nos aseguramos que los valores no sean nulos
    init {
        resetScores()
    }

    fun resetScores() {
        // 2 - En vez de asignar valores...
        localScore.value = 0
        visitorScore.value = 0
        // El valor que viene por defecto es Nulo. Hay qu etener cuidado si no lo hemos asignado.
    }


    fun addPointsToScore(points: Int, isLocal: Boolean) {
        // 3a Hacemos lo mismo para el resto de metodos
        if (isLocal) {
            //value trae un metodo value?.plus(points)
            localScore.value = localScore.value!! + points
        } else {
            visitorScore.value = visitorScore.value!! + points
        }
    }
    fun decreaseLocalScore() {
        //3b
        if (localScore.value!! > 0){
            localScore.value = localScore.value!! - 1
        }
    }
    fun decreaseVisitorScore() {
        //3c
        if (localScore.value!! > 0){
            localScore.value = visitorScore.value!! - 1
        }
    }
}