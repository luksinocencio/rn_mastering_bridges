package com.devmeist3r.example_android.components

import android.content.Context
import android.graphics.Typeface
import android.util.AttributeSet
import androidx.appcompat.widget.AppCompatEditText
import androidx.core.view.setPadding
import com.devmeist3r.example_android.R

class APPEditText @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet,
    defStyleAttr: Int = 0
) : AppCompatEditText(context, attrs, defStyleAttr) {
    init {
        styleText()
    }

    private fun styleText() {
        setPadding(18)
        setBackgroundResource(R.drawable.bg_edittext)
        typeface = Typeface.DEFAULT_BOLD
        textSize = 16F
        gravity = android.view.Gravity.CENTER_VERTICAL
    }
}