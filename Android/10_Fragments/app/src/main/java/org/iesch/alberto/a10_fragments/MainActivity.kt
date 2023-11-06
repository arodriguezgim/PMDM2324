package org.iesch.alberto.a10_fragments

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.core.os.bundleOf
import androidx.fragment.app.add
import androidx.fragment.app.commit

import org.iesch.alberto.a10_fragments.FirstFragment.Companion.DIRECCION
import org.iesch.alberto.a10_fragments.FirstFragment.Companion.NOMBRE

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val bundle = bundleOf(
            NOMBRE to "Alberto",
            DIRECCION to "mi casa"
        )

        supportFragmentManager.commit {
            // paso obligatorio
            setReorderingAllowed(true)
            add<FirstFragment>(R.id.fragmentContainer, args = bundle)
        }
    }
}

