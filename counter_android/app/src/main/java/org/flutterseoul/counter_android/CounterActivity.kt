package org.flutterseoul.counter_android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material3.FloatingActionButton
import androidx.compose.material3.Icon
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import io.flutter.embedding.android.FlutterActivity
import org.flutterseoul.counter_android.ui.theme.Counter_androidTheme

class CounterActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        fun onCounter10() {
            startActivity(FlutterActivity.createDefaultIntent(this))
        }
        setContent {
            Counter_androidTheme {
                var counter by remember { mutableIntStateOf(0) }
                if (counter > 0 && counter % 10 == 0) {
                    onCounter10()
                }

                Scaffold(
                    floatingActionButton = {
                        FloatingActionButton(onClick = { counter++ }) {
                            Icon(Icons.Default.Add, contentDescription = "Add")
                        }
                    },
                    topBar = {
                        Text(text = "Android Counter", modifier = Modifier.padding(16.dp), fontSize = 24.sp)
                    },
                    content = { innerPadding ->
                        Column(
                            verticalArrangement = Arrangement.Center,
                            horizontalAlignment = Alignment.CenterHorizontally,
                            modifier = Modifier.fillMaxSize().padding(innerPadding),
                        ) {
                            Text(text = "$counter", fontSize = 24.sp, textAlign = TextAlign.Center)
                        }
                    }
                )
            }
        }
    }
}