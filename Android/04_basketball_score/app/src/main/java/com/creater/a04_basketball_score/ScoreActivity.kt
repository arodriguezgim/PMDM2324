package com.creater.a04_basketball_score

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.creater.a04_basketball_score.databinding.ActivityScoreBinding

class ScoreActivity : AppCompatActivity() {

    companion object {
        const val LOCAL_SCORE_KEY = "local_score"
        const val VISITOR_SCORE_KEY = "visitor_score"
    }
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding = ActivityScoreBinding.inflate(layoutInflater)
        setContentView(binding.root)

        val localScore = intent.extras!!.getInt(LOCAL_SCORE_KEY)
        val visitorScore = intent.extras!!.getInt(VISITOR_SCORE_KEY)

        binding.scoreText.text = getString(R.string.local_visitor_score_format, localScore,
            visitorScore)

        when {
            localScore > visitorScore -> binding.whoWonText.text = getString(R.string.local_won)
            visitorScore > localScore -> binding.whoWonText.text = getString(R.string.visitor_won)
            else -> binding.whoWonText.text = getString(R.string.it_was_a_tie)
        }
    }
}