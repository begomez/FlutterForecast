package com.bgomez.flutter_weather

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext


class MainActivity: FlutterActivity() {

    private val CHANNEL = "com.bgomez.flutter_weather"
    private val SUFFIX = "/openweather"

    private val GET_CURRENT = "getCurrentWeather"
    private val GET_FORECAST = "getForecast"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Force invocation on UI thread
        android.os.Handler(android.os.Looper.getMainLooper()).post {

            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "$CHANNEL$SUFFIX").setMethodCallHandler { call, result ->

                // CURRENT WEATHER
                if (call.method == GET_CURRENT) {
                    val lat: Double = call.argument("lat")!!
                    val lon: Double = call.argument("lon")!!
                    val appId: String = call.argument("appId")!!

                    runBlocking {
                        val res = OpenWeatherService.getCurrentWeather(appId = appId, lat = lat, lon = lon)

                        result.success(res)
                    }

                // 24H FORECAST
                } else if (call.method == GET_FORECAST) {
                    val lat: Double = call.argument("lat")!!
                    val lon: Double = call.argument("lon")!!
                    val appId: String = call.argument("appId")!!

                    runBlocking {
                        val res= OpenWeatherService.getForecast(appId = appId, lat = lat, lon = lon)

                        result.success(res)
                    }

                } else {
                    result.notImplemented()
                }
            }
        }
    }
}
