# FlutterForecast

Sample project that queries remote API using Flutter -> native platform communication (channels)

## Architecture Overview

Project is structured in the following layers/modules:

- Presentation

- Domain

- Data

- Network

Presentation layer is Flutter dependent. Defines its own custom hierarchy: screens (
widgets usually used as containers, similar to Android activities) and widgets (pieces of UI with behavior, similar to
Android fragments).

Domain defines use cases, functionalities that the app can perform. Ex: retrieving forecast

Data is introduced in order to manage and orchestrate different data sources.

Network performs net connections either directly or indirectly.

Data models are share across all modules, there is no custom data model per layer.

DTO (Data Transport Object) are used to define use case inputs and provide type safety.

## About requirements

* Android and iOS modules for API data fetching are not exported on a separate federated plugin.
For now, they are contained in the corresponding folder inside this project. When having both prod-
ready implementations, it would be convenient to move the code to a plugin itself so it would be reusable
across apps

* Async network calls are implemented using kotlin coroutines and okhttp lib. Deserialization is done back on 
Flutter world using isolates

* Live weather data implementation is contained on Android app. 

* iOS app uses dummy weather data.

## Code generation commands

flutter packages pub run build_runner build --delete-conflicting-ouputs 