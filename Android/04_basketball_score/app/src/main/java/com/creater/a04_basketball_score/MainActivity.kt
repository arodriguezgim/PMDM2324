package com.creater.a04_basketball_score

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.get
import com.creater.a04_basketball_score.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {


    private lateinit var viewModel: MainViewModel
    private lateinit var binding: ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        viewModel = ViewModelProvider(this).get(MainViewModel::class.java)
        setupButtons()
    }

    private fun setupButtons() {
        binding.localMinusButton.setOnClickListener {
            viewModel.decreaseLocalScore()
            binding.localScoreText.text = viewModel.localScore.toString()

        }

        binding.localPlusButton.setOnClickListener {
            addPointsToScore(1, isLocal = true)
        }

        binding.localTwoPointsButton.setOnClickListener {
            addPointsToScore(2, isLocal = true)
        }

        binding.visitorMinusButton.setOnClickListener {
            viewModel.decreaseVisitorScore()
            binding.visitorScoreText.text = viewModel.visitorScore.toString()

        }

        binding.visitorPlusButton.setOnClickListener {
            addPointsToScore(1, isLocal = false)
        }

        binding.visitorTwoPointsButton.setOnClickListener {
            addPointsToScore(2, isLocal = false)
        }

        binding.restartButton.setOnClickListener {
            resetScores()
        }

        binding.resultsButton.setOnClickListener {
            startScoreActivity()
        }
    }

    private fun resetScores() {
        viewModel.resetScores()
        binding.visitorScoreText.text = viewModel.localScore.toString()
        binding.localScoreText.text = viewModel.visitorScore.toString()
    }

    private fun addPointsToScore(points: Int, isLocal: Boolean) {
        viewModel.addPointsToScore(points, isLocal)
        if (isLocal) {
            binding.localScoreText.text = viewModel.localScore.toString()
        } else {
            binding.visitorScoreText.text = viewModel.visitorScore.toString()
        }
    }

    private fun startScoreActivity() {
        val intent = Intent(this, ScoreActivity::class.java)
        intent.putExtra(ScoreActivity.LOCAL_SCORE_KEY, viewModel.localScore)
        intent.putExtra(ScoreActivity.VISITOR_SCORE_KEY, viewModel.visitorScore)
        startActivity(intent)
    }
}