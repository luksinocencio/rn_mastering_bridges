package com.devmeist3r.example_android.screens

import android.os.Bundle
import android.widget.Button
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import com.devmeist3r.example_android.R

class LoginActivity : AppCompatActivity() {

    private lateinit var buttonEnter: Button
    private lateinit var buttonRegister: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_login)
        initViews()
        setupListeners()
    }

    private fun initViews() {
        buttonEnter = findViewById(R.id.buttonEnter)
        buttonRegister = findViewById(R.id.buttonRegister)
    }

    private fun setupListeners() {
        buttonEnter.setOnClickListener {
            println("Botão Enter pressionado")
        }

        buttonRegister.setOnClickListener {
            println("Botão Register pressionado")
        }
    }
}