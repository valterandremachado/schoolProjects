package com.example.tiptime

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.tiptime.databinding.ActivityMainBinding
import java.text.NumberFormat
import java.util.zip.Inflater
import kotlin.math.ceil

class MainActivity : AppCompatActivity() {

    lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        val calculateBtn = binding.btnCalculateID
        calculateBtn.setOnClickListener {
            calculateTip()
        }

    }

    fun calculateTip() {
        // Getting the editText input as string then convert it as double
        val costString = binding.editCostID.text.toString()
        val cost = costString.toDouble()

        // Checks which radioButton was pressed
        val selectedOption = binding.tipOptions.checkedRadioButtonId

        // Hardcoded tip percentage
        val percentage = when (selectedOption) {
            R.id.option20ID -> 0.2
            R.id.option18ID -> 0.18
            else -> 0.15
        }

        // Instantiating tipAmount with cost * percentage
        var tipAmount = cost * percentage
        // Check switchBtn state (true/false)
        val roundup = binding.switchRoundUpID.isChecked
        if (roundup) {
            tipAmount = ceil(tipAmount)
        }

        // Formatting tipAmount
        val formattedTip = NumberFormat.getCurrencyInstance().format(tipAmount)
        val output = "Tip Amount: "+formattedTip

        // Presenting a new activityView
        var intent = Intent(this, OutputActivity::class.java)
        intent.putExtra("amount", output)
        startActivity(intent)
    }

}