import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let CHANNEL = "com.bgomez.flutter_weather"
    let SUFFIX = "/openweather"
    let GET_CURRENT = "getCurrentWeather"
    let GET_FORECAST = "getForecast"

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: CHANNEL+SUFFIX, binaryMessenger: controller.binaryMessenger)
    //DispatchQueue.main.async{
    channel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        //self.flutterResult = result

        if call.method == GET_CURRENT {
            result(OpenWeatherServiceIOS.getCurrentWeather(appId: "", lat: 0.0, lon: 0.0))

        } else if call.method == GET_FORECAST {
            result(OpenWeatherServiceIOS.getForecast(appId: "", lat: 0.0, lon: 0.0))

        } else {
            result(FlutterMethodNotImplemented)
        }
    })
    //}

    GeneratedPluginRegistrant.register(with: self)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

struct OpenWeatherServiceIOS {

        static func getForecast(appId : String, lat : Double, lon : Double) -> String {
                return "{\n" +
                        "    \"lat\": 33.44,\n" +
                        "    \"lon\": -94.04,\n" +
                        "    \"timezone\": \"America/Chicago\",\n" +
                        "    \"timezone_offset\": -18000,\n" +
                        "    \"current\": {\n" +
                        "        \"dt\": 1624222974,\n" +
                        "        \"sunrise\": 1624187202,\n" +
                        "        \"sunset\": 1624238932,\n" +
                        "        \"temp\": 307.32,\n" +
                        "        \"feels_like\": 310.92,\n" +
                        "        \"pressure\": 1009,\n" +
                        "        \"humidity\": 47,\n" +
                        "        \"dew_point\": 294.4,\n" +
                        "        \"uvi\": 6.6,\n" +
                        "        \"clouds\": 40,\n" +
                        "        \"visibility\": 10000,\n" +
                        "        \"wind_speed\": 3.58,\n" +
                        "        \"wind_deg\": 182,\n" +
                        "        \"wind_gust\": 5.81,\n" +
                        "        \"weather\": [\n" +
                        "            {\n" +
                        "                \"id\": 802,\n" +
                        "                \"main\": \"Clouds\",\n" +
                        "                \"description\": \"scattered clouds\",\n" +
                        "                \"icon\": \"03d\"\n" +
                        "            }\n" +
                        "        ]\n" +
                        "    },\n" +
                        "    \"hourly\": [\n" +
                        "        {\n" +
                        "            \"dt\": 1624222800,\n" +
                        "            \"temp\": 307.32,\n" +
                        "            \"feels_like\": 310.92,\n" +
                        "            \"pressure\": 1009,\n" +
                        "            \"humidity\": 47,\n" +
                        "            \"dew_point\": 294.4,\n" +
                        "            \"uvi\": 6.6,\n" +
                        "            \"clouds\": 40,\n" +
                        "            \"visibility\": 10000,\n" +
                        "            \"wind_speed\": 4.7,\n" +
                        "            \"wind_deg\": 222,\n" +
                        "            \"wind_gust\": 6.97,\n" +
                        "            \"weather\": [\n" +
                        "                {\n" +
                        "                    \"id\": 802,\n" +
                        "                    \"main\": \"Clouds\",\n" +
                        "                    \"description\": \"scattered clouds\",\n" +
                        "                    \"icon\": \"03d\"\n" +
                        "                }\n" +
                        "            ],\n" +
                        "            \"pop\": 0\n" +
                        "        },\n" +
                        "        {\n" +
                        "            \"dt\": 1624226400,\n" +
                        "            \"temp\": 307.08,\n" +
                        "            \"feels_like\": 310.74,\n" +
                        "            \"pressure\": 1009,\n" +
                        "            \"humidity\": 48,\n" +
                        "            \"dew_point\": 294.52,\n" +
                        "            \"uvi\": 3.96,\n" +
                        "            \"clouds\": 33,\n" +
                        "            \"visibility\": 10000,\n" +
                        "            \"wind_speed\": 5.16,\n" +
                        "            \"wind_deg\": 228,\n" +
                        "            \"wind_gust\": 7.54,\n" +
                        "            \"weather\": [\n" +
                        "                {\n" +
                        "                    \"id\": 802,\n" +
                        "                    \"main\": \"Clouds\",\n" +
                        "                    \"description\": \"scattered clouds\",\n" +
                        "                    \"icon\": \"03d\"\n" +
                        "                }\n" +
                        "            ],\n" +
                        "            \"pop\": 0\n" +
                        "        },\n" +
                        "        {\n" +
                        "            \"dt\": 1624230000,\n" +
                        "            \"temp\": 306.22,\n" +
                        "            \"feels_like\": 309.87,\n" +
                        "            \"pressure\": 1008,\n" +
                        "            \"humidity\": 51,\n" +
                        "            \"dew_point\": 294.73,\n" +
                        "            \"uvi\": 1.85,\n" +
                        "            \"clouds\": 26,\n" +
                        "            \"visibility\": 10000,\n" +
                        "            \"wind_speed\": 5.05,\n" +
                        "            \"wind_deg\": 228,\n" +
                        "            \"wind_gust\": 8.74,\n" +
                        "            \"weather\": [\n" +
                        "                {\n" +
                        "                    \"id\": 802,\n" +
                        "                    \"main\": \"Clouds\",\n" +
                        "                    \"description\": \"scattered clouds\",\n" +
                        "                    \"icon\": \"03d\"\n" +
                        "                }\n" +
                        "            ],\n" +
                        "            \"pop\": 0\n" +
                        "        },\n" +
                        "        {\n" +
                        "            \"dt\": 1624233600,\n" +
                        "            \"temp\": 304.7,\n" +
                        "            \"feels_like\": 308.92,\n" +
                        "            \"pressure\": 1008,\n" +
                        "            \"humidity\": 59,\n" +
                        "            \"dew_point\": 295.71,\n" +
                        "            \"uvi\": 0.59,\n" +
                        "            \"clouds\": 19,\n" +
                        "            \"visibility\": 10000,\n" +
                        "            \"wind_speed\": 3.3,\n" +
                        "            \"wind_deg\": 219,\n" +
                        "            \"wind_gust\": 7.64,\n" +
                        "            \"weather\": [\n" +
                        "                {\n" +
                        "                    \"id\": 801,\n" +
                        "                    \"main\": \"Clouds\",\n" +
                        "                    \"description\": \"few clouds\",\n" +
                        "                    \"icon\": \"02d\"\n" +
                        "                }\n" +
                        "            ],\n" +
                        "            \"pop\": 0\n" +
                        "        },\n" +
                        "        {\n" +
                        "            \"dt\": 1624237200,\n" +
                        "            \"temp\": 301.98,\n" +
                        "            \"feels_like\": 304.99,\n" +
                        "            \"pressure\": 1007,\n" +
                        "            \"humidity\": 67,\n" +
                        "            \"dew_point\": 295.24,\n" +
                        "            \"uvi\": 0,\n" +
                        "            \"clouds\": 8,\n" +
                        "            \"visibility\": 10000,\n" +
                        "            \"wind_speed\": 2.49,\n" +
                        "            \"wind_deg\": 216,\n" +
                        "            \"wind_gust\": 2.93,\n" +
                        "            \"weather\": [\n" +
                        "                {\n" +
                        "                    \"id\": 800,\n" +
                        "                    \"main\": \"Clear\",\n" +
                        "                    \"description\": \"clear sky\",\n" +
                        "                    \"icon\": \"01d\"\n" +
                        "                }\n" +
                        "            ],\n" +
                        "            \"pop\": 0\n" +
                        "        },\n" +
                        "        {\n" +
                        "            \"dt\": 1624240800,\n" +
                        "            \"temp\": 299.48,\n" +
                        "            \"feels_like\": 299.48,\n" +
                        "            \"pressure\": 1007,\n" +
                        "            \"humidity\": 71,\n" +
                        "            \"dew_point\": 293.89,\n" +
                        "            \"uvi\": 0,\n" +
                        "            \"clouds\": 0,\n" +
                        "            \"visibility\": 10000,\n" +
                        "            \"wind_speed\": 2.58,\n" +
                        "            \"wind_deg\": 206,\n" +
                        "            \"wind_gust\": 3.41,\n" +
                        "            \"weather\": [\n" +
                        "                {\n" +
                        "                    \"id\": 800,\n" +
                        "                    \"main\": \"Clear\",\n" +
                        "                    \"description\": \"clear sky\",\n" +
                        "                    \"icon\": \"01n\"\n" +
                        "                }\n" +
                        "            ],\n" +
                        "            \"pop\": 0\n" +
                        "        },\n" +
                        "        {\n" +
                        "            \"dt\": 1624244400,\n" +
                        "            \"temp\": 298.77,\n" +
                        "            \"feels_like\": 299.32,\n" +
                        "            \"pressure\": 1008,\n" +
                        "            \"humidity\": 74,\n" +
                        "            \"dew_point\": 294.04,\n" +
                        "            \"uvi\": 0,\n" +
                        "            \"clouds\": 0,\n" +
                        "            \"visibility\": 10000,\n" +
                        "            \"wind_speed\": 3.31,\n" +
                        "            \"wind_deg\": 184,\n" +
                        "            \"wind_gust\": 7.79,\n" +
                        "            \"weather\": [\n" +
                        "                {\n" +
                        "                    \"id\": 800,\n" +
                        "                    \"main\": \"Clear\",\n" +
                        "                    \"description\": \"clear sky\",\n" +
                        "                    \"icon\": \"01n\"\n" +
                        "                }\n" +
                        "            ],\n" +
                        "            \"pop\": 0\n" +
                        "        },\n" +
                        "        {\n" +
                        "            \"dt\": 1624248000,\n" +
                        "            \"temp\": 297.98,\n" +
                        "            \"feels_like\": 298.69,\n" +
                        "            \"pressure\": 1009,\n" +
                        "            \"humidity\": 83,\n" +
                        "            \"dew_point\": 294.85,\n" +
                        "            \"uvi\": 0,\n" +
                        "            \"clouds\": 5,\n" +
                        "            \"visibility\": 10000,\n" +
                        "            \"wind_speed\": 4.04,\n" +
                        "            \"wind_deg\": 188,\n" +
                        "            \"wind_gust\": 10.83,\n" +
                        "            \"weather\": [\n" +
                        "                {\n" +
                        "                    \"id\": 800,\n" +
                        "                    \"main\": \"Clear\",\n" +
                        "                    \"description\": \"clear sky\",\n" +
                        "                    \"icon\": \"01n\"\n" +
                        "                }\n" +
                        "            ],\n" +
                        "            \"pop\": 0\n" +
                        "        },\n" +
                        "        {\n" +
                        "            \"dt\": 1624251600,\n" +
                        "            \"temp\": 297.81,\n" +
                        "            \"feels_like\": 298.55,\n" +
                        "            \"pressure\": 1009,\n" +
                        "            \"humidity\": 85,\n" +
                        "            \"dew_point\": 295.07,\n" +
                        "            \"uvi\": 0,\n" +
                        "            \"clouds\": 5,\n" +
                        "            \"visibility\": 10000,\n" +
                        "            \"wind_speed\": 3.87,\n" +
                        "            \"wind_deg\": 204,\n" +
                        "            \"wind_gust\": 11.93,\n" +
                        "            \"weather\": [\n" +
                        "                {\n" +
                        "                    \"id\": 800,\n" +
                        "                    \"main\": \"Clear\",\n" +
                        "                    \"description\": \"clear sky\",\n" +
                        "                    \"icon\": \"01n\"\n" +
                        "                }\n" +
                        "            ],\n" +
                        "            \"pop\": 0\n" +
                        "        },\n" +
                        "        {\n" +
                        "            \"dt\": 1624255200,\n" +
                        "            \"temp\": 298.02,\n" +
                        "            \"feels_like\": 298.68,\n" +
                        "            \"pressure\": 1009,\n" +
                        "            \"humidity\": 81,\n" +
                        "            \"dew_point\": 294.6,\n" +
                        "            \"uvi\": 0,\n" +
                        "            \"clouds\": 4,\n" +
                        "            \"visibility\": 10000,\n" +
                        "            \"wind_speed\": 4.43,\n" +
                        "            \"wind_deg\": 205,\n" +
                        "            \"wind_gust\": 12.43,\n" +
                        "            \"weather\": [\n" +
                        "                {\n" +
                        "                    \"id\": 800,\n" +
                        "                    \"main\": \"Clear\",\n" +
                        "                    \"description\": \"clear sky\",\n" +
                        "                    \"icon\": \"01n\"\n" +
                        "                }\n" +
                        "            ],\n" +
                        "            \"pop\": 0\n" +
                        "        },\n" +
                        "        {\n" +
                        "            \"dt\": 1624258800,\n" +
                        "            \"temp\": 297.65,\n" +
                        "            \"feels_like\": 298.27,\n" +
                        "            \"pressure\": 1009,\n" +
                        "            \"humidity\": 81,\n" +
                        "            \"dew_point\": 294.27,\n" +
                        "            \"uvi\": 0,\n" +
                        "            \"clouds\": 0,\n" +
                        "            \"visibility\": 10000,\n" +
                        "            \"wind_speed\": 4.84,\n" +
                        "            \"wind_deg\": 200,\n" +
                        "            \"wind_gust\": 12.59,\n" +
                        "            \"weather\": [\n" +
                        "                {\n" +
                        "                    \"id\": 800,\n" +
                        "                    \"main\": \"Clear\",\n" +
                        "                    \"description\": \"clear sky\",\n" +
                        "                    \"icon\": \"01n\"\n" +
                        "                }\n" +
                        "            ],\n" +
                        "            \"pop\": 0\n" +
                        "        },\n" +
                        "        {\n" +
                        "            \"dt\": 1624262400,\n" +
                        "            \"temp\": 296.8,\n" +
                        "            \"feels_like\": 297.47,\n" +
                        "            \"pressure\": 1009,\n" +
                        "            \"humidity\": 86,\n" +
                        "            \"dew_point\": 294.52,\n" +
                        "            \"uvi\": 0,\n" +
                        "            \"clouds\": 0,\n" +
                        "            \"visibility\": 10000,\n" +
                        "            \"wind_speed\": 4.74,\n" +
                        "            \"wind_deg\": 194,\n" +
                        "            \"wind_gust\": 12.23,\n" +
                        "            \"weather\": [\n" +
                        "                {\n" +
                        "                    \"id\": 800,\n" +
                        "                    \"main\": \"Clear\",\n" +
                        "                    \"description\": \"clear sky\",\n" +
                        "                    \"icon\": \"01n\"\n" +
                        "                }\n" +
                        "            ],\n" +
                        "            \"pop\": 0\n" +
                        "        }\n" +
                        "    ]\n" +
                        "}"
        }

        static func getCurrentWeather(appId : String, lat : Double, lon : Double) -> String {
            return "{\n" +
                                   "    \"coord\": {\n" +
                                   "        \"lon\": -94.04,\n" +
                                   "        \"lat\": 33.44\n" +
                                   "    },\n" +
                                   "    \"weather\": [\n" +
                                   "        {\n" +
                                   "            \"id\": 801,\n" +
                                   "            \"main\": \"Clouds\",\n" +
                                   "            \"description\": \"few clouds\",\n" +
                                   "            \"icon\": \"02d\"\n" +
                                   "        }\n" +
                                   "    ],\n" +
                                   "    \"base\": \"stations\",\n" +
                                   "    \"main\": {\n" +
                                   "        \"temp\": 307.28,\n" +
                                   "        \"feels_like\": 310.83,\n" +
                                   "        \"temp_min\": 305.37,\n" +
                                   "        \"temp_max\": 309.19,\n" +
                                   "        \"pressure\": 1009,\n" +
                                   "        \"humidity\": 47\n" +
                                   "    },\n" +
                                   "    \"visibility\": 10000,\n" +
                                   "    \"wind\": {\n" +
                                   "        \"speed\": 2.24,\n" +
                                   "        \"deg\": 194,\n" +
                                   "        \"gust\": 4.47\n" +
                                   "    },\n" +
                                   "    \"clouds\": {\n" +
                                   "        \"all\": 20\n" +
                                   "    },\n" +
                                   "    \"dt\": 1624215769,\n" +
                                   "    \"sys\": {\n" +
                                   "        \"type\": 2,\n" +
                                   "        \"id\": 2003406,\n" +
                                   "        \"country\": \"US\",\n" +
                                   "        \"sunrise\": 1624187202,\n" +
                                   "        \"sunset\": 1624238932\n" +
                                   "    },\n" +
                                   "    \"timezone\": -18000,\n" +
                                   "    \"id\": 4133367,\n" +
                                   "    \"name\": \"Texarkana\",\n" +
                                   "    \"cod\": 200\n" +
                                   "}"

        }

}
