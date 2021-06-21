package com.bgomez.flutter_weather


import okhttp3.Response
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.Call
import okhttp3.Callback
import okhttp3.HttpUrl
import java.lang.Exception
import java.io.IOException
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext


object OpenWeatherService {
    val URL = "api.openweathermap.org"

    suspend fun getForecast(appId: String, lat: Double, lon: Double) : String {
        var ret = ""

        try {
            var urlBuilder : HttpUrl.Builder = HttpUrl.Builder().host(URL).scheme("https")
                .addPathSegment("data")
                .addPathSegment("2.5")
                .addPathSegment("onecall")
                .addQueryParameter("exclude", "minutely,daily")
                .addQueryParameter("lat", "$lat")
                .addQueryParameter("lon", "$lon")
                .addQueryParameter("appId", appId)

            var url : String = urlBuilder?.build()?.toString()!!

            var req : Request = Request.Builder().url(url).build();

            val client : OkHttpClient = OkHttpClient()

            withContext(Dispatchers.IO) {
                val response = client.newCall(req).execute()

                ret = response.body().string()
            }

        } catch (e: Exception) {
            e.printStackTrace()

            ret =  ""
        }

        return ret
    }

    suspend fun getCurrentWeather(appId: String, lat: Double, lon: Double) : String {
        var ret = ""

        try {
            var urlBuilder : HttpUrl.Builder = HttpUrl.Builder().host(URL).scheme("https")
                .addPathSegment("data")
                .addPathSegment("2.5")
                .addPathSegment("weather")
                .addQueryParameter("lat", "$lat")
                .addQueryParameter("lon", "$lon")
                .addQueryParameter("appId", appId)

            var url : String = urlBuilder?.build()?.toString()!!

            var req : Request = Request.Builder().url(url).build();

            val client : OkHttpClient = OkHttpClient()

            withContext(Dispatchers.IO) {
                val response  = client.newCall(req).execute()

                ret = response.body().string()
            }


            /*
             client.newCall(req).enqueue(object : Callback {
                    override fun onFailure(call: Call, e: IOException) {
                        e.printStackTrace()
                    }

                    override fun onResponse(call: Call, response: Response) {
                        if (!response.isSuccessful) throw Exception("Network error")

                        System.out.println(response.body()!!.string())
                    }
                })
            */

        } catch (e: Exception) {
            e.printStackTrace()

            ret =  ""
        }

        return ret
    }
}
