package com.creater.a04_basketball_score

import androidx.lifecycle.ViewModel
// 4 - Esta clase ha de heredar del ViewModel
class MainViewModel: ViewModel() {
    // El ViewModel tiene que hacer TO DO lo que tenga que ver con la logica d enuestra APP
    // 5 corto y pego
    var localScore = 0
    var visitorScore = 0
    // 6 - Copio y pego
    fun resetScores() {
        localScore = 0
        visitorScore = 0
        //Quitamos los binding porque el ViewModel jamás tendrá que hacer nada de los views
    }

    // 8 Copio y pego esto
    fun addPointsToScore(points: Int, isLocal: Boolean) {
        if (isLocal) {
            localScore += points
        } else {
            visitorScore += points
        }
    }
    // 10 Nos creamos dos metodos
    fun decreaseLocalScore() {
        if (localScore > 0){
            localScore--
        }
    }
    fun decreaseVisitorScore() {
        if (visitorScore > 0){
            visitorScore--
        }
    }

}


















