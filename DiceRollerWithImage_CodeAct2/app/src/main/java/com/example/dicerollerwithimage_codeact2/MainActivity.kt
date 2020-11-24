package com.example.dicerollerwithimage_codeact2

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import androidx.core.view.isVisible

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        setupView()
    }

    private  fun setupView() {
        rollDice()
    }

    private fun rollDice(){
        lateinit var dice1ImageView: ImageView
        dice1ImageView = findViewById(R.id.dice_image)

        lateinit var dice2ImageView: ImageView
        dice2ImageView = findViewById(R.id.dice_image2)

        val rollBtn: Button = findViewById(R.id.roolBtn)
        val defaultText: TextView = findViewById(R.id.displayLabel)

        rollBtn.setOnClickListener {
            defaultText.isVisible = false

            val dice1Numb = (1..6).random()
            val pairedDrawable1 = when (dice1Numb) {
                1 -> R.drawable.dice_1
                2 -> R.drawable.dice_2
                3 -> R.drawable.dice_3
                4 -> R.drawable.dice_4
                5 -> R.drawable.dice_5
                else -> R.drawable.dice_6
            }

            dice1ImageView.setImageResource(pairedDrawable1)

            // The scope below is part of the Coding Challenge
            val dice2Numb = (1..6).random()
            val pairedDrawable2 = when (dice2Numb) {
                1 -> R.drawable.dice_1
                2 -> R.drawable.dice_2
                3 -> R.drawable.dice_3
                4 -> R.drawable.dice_4
                5 -> R.drawable.dice_5
                else -> R.drawable.dice_6
            }
            dice2ImageView.setImageResource(pairedDrawable2)

        }

    }
}