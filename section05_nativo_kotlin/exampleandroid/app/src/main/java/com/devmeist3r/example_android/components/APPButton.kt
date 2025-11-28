package com.devmeist3r.example_android.components

import android.content.Context
import android.graphics.Typeface
import android.util.AttributeSet
import androidx.appcompat.widget.AppCompatButton
import com.devmeist3r.example_android.R

class APPButton @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defStyle: Int = 0
) : AppCompatButton(context, attrs, defStyle) {
    init {
        context.theme.obtainStyledAttributes(
            attrs,
            R.styleable.APPButton,
            0,
            0
        ).apply {
            try {
                var variant = getString(R.styleable.APPButton_variant)

                when (variant) {
                    "secondary" -> {
                        setBackgroundResource(R.drawable.bg_secondary_button)
                        setTextColor(context.getColor(R.color.black))
                    }

                    else -> {
                        setBackgroundResource(R.drawable.bg_primary_button)
                        setTextColor(context.getColor(R.color.white))
                    }
                }
            } finally {
                recycle()
            }
        }

        gravity = android.view.Gravity.CENTER
        textSize = 16f
        typeface = Typeface.DEFAULT_BOLD
    }
}