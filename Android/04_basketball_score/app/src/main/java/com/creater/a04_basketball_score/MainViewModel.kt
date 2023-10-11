package com.creater.a04_basketball_score

import androidx.lifecycle.ViewModel

class MainViewModel: ViewModel() {

    var localScore = 0
    var visitorScore = 0

    fun resetScores() {
        localScore = 0
        visitorScore = 0

    }


    fun addPointsToScore(points: Int, isLocal: Boolean) {
        if (isLocal) {
            localScore += points
        } else {
            visitorScore += points
        }
    }

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


















