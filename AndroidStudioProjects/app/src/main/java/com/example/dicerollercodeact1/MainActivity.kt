package com.example.dicerollercodeact1

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        this.setupView()
    }

    private fun setupView(){
        // SetupViews
        val resultText: TextView = findViewById(R.id.resultText)
        val rollBtn: Button = findViewById(R.id.rollBtn)

        // rollBtn listener method
        rollBtn.setOnClickListener {
            val diceNumb = (1..6).random()
            resultText.text = diceNumb.toString()
        }


        // The code below is part of the Coding challenge
        val countUpBtn: Button = findViewById(R.id.countUp)
        // countUpBtn listener method
        countUpBtn.setOnClickListener {
            if (resultText.text.toString() == "Click Roll") {
                resultText.text = "1"
            } else if (resultText.text.toString().toInt() <= 5) {
                val result = resultText.text.toString()
                val sum = result.toInt() + 1
                resultText.text = sum.toString()
            }
        }

    }


}