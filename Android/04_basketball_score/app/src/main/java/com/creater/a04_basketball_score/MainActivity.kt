package com.creater.a04_basketball_score

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import com.creater.a04_basketball_score.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {


    private lateinit var binding: ActivityMainBinding
    private lateinit var viewModel: MainViewModel
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        viewModel = ViewModelProvider(this).get(MainViewModel::class.java)
        // 5 - Una vez tenemos los Live Data hemos de observarlos
        // 1er argumento: Alguien que tenga un LifeCycle Las activities la tienen
        // 2nd arg: Es un Observador, se nos genera un metodo lambda. Cuando se observe que localScore
        // cambio llamará a este lamda trayendo el valor nuevo
        viewModel.localScore.observe(this, Observer {
                localScoreValue ->
                binding.localScoreText.text = localScoreValue.toString()
        })
        viewModel.visitorScore.observe(this, Observer {
                visitorScoreValue ->
                binding.localScoreText.text = visitorScoreValue.toString()
        })
        // Teniendo esto, como cada vez que se edite local o viistante se van a actualizar los textos
        // ya no es necesario actuializarlos-> paso 6
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
            // 7 reset scores lo ponemos directamente aqui
            viewModel.resetScores()
        }

        binding.resultsButton.setOnClickListener {
            startScoreActivity()
        }
    }


    private fun addPointsToScore(points: Int, isLocal: Boolean) {
        viewModel.addPointsToScore(points,isLocal)

    }

    private fun startScoreActivity() {
        val intent = Intent(this, ScoreActivity::class.java)
        // 8 Ahora el extra es un MutableLiveData
        intent.putExtra(ScoreActivity.LOCAL_SCORE_KEY, viewModel.localScore.value)
        intent.putExtra(ScoreActivity.VISITOR_SCORE_KEY, viewModel.visitorScore.value)
        startActivity(intent)
    }
}