# SpaceX App

A project that lists all the launches from SpaceX rest api: https://github.com/r-spacex/SpaceX-API and also allows to view the details of specific launch.

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/reemaprajapati/code-challenge-spacex.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get
```

## Features

* List Screen with list of all launches
* Detail Screen with rocket details and launch site


# Libraries and Tools Used

* [Dio](https://github.com/flutterchina/dio)
* [Bloc](https://github.com/felangel/bloc/tree/master/packages/flutter_bloc)
* [GetIt](https://github.com/fluttercommunity/get_it)
* [Fluro](https://github.com/lukepighetti/fluro)


## Run tests

To run test, go to project root and execute the following command in console to test the date converter:

```
flutter test test/utc_to_local_date_convert.dart
```

For widget testing, go to project root and execute the following command in console to test the status widget of launch item:

```
flutter test test/launch_status_widget_test.dart
```
