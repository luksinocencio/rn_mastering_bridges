package com.devmeist3r.example_android.screens

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.widget.Button
import android.widget.EditText
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import com.devmeist3r.example_android.R
import com.google.android.material.bottomsheet.BottomSheetDialog

class LoginActivity : AppCompatActivity(), View.OnClickListener {

    private lateinit var buttonEnter: Button
    private lateinit var buttonRegister: Button

    private lateinit var editTextEmail: EditText
    private lateinit var editTextPassword: EditText


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_login)

        buttonEnter = findViewById(R.id.buttonEnter)
        buttonRegister = findViewById(R.id.buttonRegister)

        editTextEmail = findViewById(R.id.editTextEmail)
        editTextPassword = findViewById(R.id.editTextPassword)

        buttonEnter.setOnClickListener(this)
        buttonRegister.setOnClickListener(this)
    }


    override fun onClick(v: View?) {
        when (v?.id) {
            R.id.buttonEnter -> {
                validateInformation()
            }

            R.id.buttonRegister -> {

            }
        }
    }

    fun validateInformation() {
        val email = editTextEmail.text.toString()
        val password = editTextPassword.text.toString()

        if (email == "teste@mail.com" && password.equals("123")) {
            showModal()
        } else {
            showAlert("Ops!", "Parece que o seu usuário e senha estão incorretos.")
        }
    }

    private fun showAlert(title: String, description: String) {
        val alert = AlertDialog.Builder(this)

        alert.setTitle(title)
        alert.setMessage(description)
        alert.setPositiveButton("Ok") { dialog, _ ->
            dialog.dismiss()
        }

        val dialog: AlertDialog = alert.create()
        dialog.show()
    }

    private fun showModal() {
        val bottomSheetModal = BottomSheetDialog(this)
        val bottomSheetView: View =
            LayoutInflater.from(applicationContext).inflate(R.layout.bottom_modal, null)

        bottomSheetModal.setContentView(bottomSheetView)

        bottomSheetModal.show()
    }
}