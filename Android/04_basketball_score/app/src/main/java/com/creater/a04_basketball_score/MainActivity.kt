package com.creater.a04_basketball_score

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.lifecycle.Observer
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
        // 5 - Una vez tenemos los Live Data hemos de OBSERVARLOS
        // 1er argumento: Alguien que tenga un LifeCycle. La activity lo tiene
        // 2ndo arg: Es un Observador: se nos genera un metodo lambda. Cuando se observe que el local Score cambia
        // llamará a este lambda trayendo el valor nuevo
        viewModel.localScore.observe(
            this,
            Observer {
                localScoreValue ->
                binding.localScoreText.text = localScoreValue.toString()
            }
        )
        viewModel.visitorScore.observe(
            this,
            Observer {
                    visitorScoreValue ->
                    binding.visitorScoreText.text = visitorScoreValue.toString()
            }
        )
        // Teniendo esto, cada vez que se edite local o visitante se van a actualizar los textos
        // Ya no es necesario actualizarlos

        setupButtons()
    }

    private fun setupButtons() {
        binding.localMinusButton.setOnClickListener {
            viewModel.decreaseLocalScore()

        }

        binding.localPlusButton.setOnClickListener {
            addPointsToScore(1, isLocal = true)
        }

        binding.localTwoPointsButton.setOnClickListener {
            addPointsToScore(2, isLocal = true)
        }

        binding.visitorMinusButton.setOnClickListener {
            viewModel.decreaseVisitorScore()

        }

        binding.visitorPlusButton.setOnClickListener {
            addPointsToScore(1, isLocal = false)
        }

        binding.visitorTwoPointsButton.setOnClickListener {
            addPointsToScore(2, isLocal = false)
        }

        binding.restartButton.setOnClickListener {
            viewModel.resetScores()
        }

        binding.resultsButton.setOnClickListener {
            startScoreActivity()
        }
    }



    private fun addPointsToScore(points: Int, isLocal: Boolean) {
        viewModel.addPointsToScore(points, isLocal)
    }

    private fun startScoreActivity() {
        val intent = Intent(this, ScoreActivity::class.java)
        intent.putExtra(ScoreActivity.LOCAL_SCORE_KEY, viewModel.localScore.value)
        intent.putExtra(ScoreActivity.VISITOR_SCORE_KEY, viewModel.visitorScore.value)
        startActivity(intent)
    }
}