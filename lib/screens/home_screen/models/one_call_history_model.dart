// To parse this JSON data, do
//
//     final oneCallHistoryModel = oneCallHistoryModelFromJson(jsonString);

import 'dart:convert';

class OneCallHistoryModel {
  OneCallHistoryModel({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.hourly,
  });

  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;
  Current? current;
  List<Current>? hourly;

  factory OneCallHistoryModel.fromRawJson(String str) =>
      OneCallHistoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OneCallHistoryModel.fromJson(Map<String, dynamic> json) =>
      OneCallHistoryModel(
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lon: json["lon"] == null ? null : json["lon"].toDouble(),
        timezone: json["timezone"] == null ? null : json["timezone"],
        timezoneOffset:
            json["timezone_offset"] == null ? null : json["timezone_offset"],
        current:
            json["current"] == null ? null : Current.fromJson(json["current"]),
        hourly: json["hourly"] == null
            ? null
            : List<Current>.from(
                json["hourly"].map((x) => Current.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat == null ? null : lat,
        "lon": lon == null ? null : lon,
        "timezone": timezone == null ? null : timezone,
        "timezone_offset": timezoneOffset == null ? null : timezoneOffset,
        "current": current == null ? null : current!.toJson(),
        "hourly": hourly == null
            ? null
            : List<dynamic>.from(hourly!.map((x) => x.toJson())),
      };
}

class Current {
  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.snow,
  });

  int? dt;
  int? sunrise;
  int? sunset;
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? uvi;
  int? clouds;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather>? weather;
  Snow? snow;

  factory Current.fromRawJson(String str) => Current.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: json["dt"] == null ? null : json["dt"],
        sunrise: json["sunrise"] == null ? null : json["sunrise"],
        sunset: json["sunset"] == null ? null : json["sunset"],
        temp: json["temp"] == null ? null : json["temp"].toDouble(),
        feelsLike:
            json["feels_like"] == null ? null : json["feels_like"].toDouble(),
        pressure: json["pressure"] == null ? null : json["pressure"],
        humidity: json["humidity"] == null ? null : json["humidity"],
        dewPoint:
            json["dew_point"] == null ? null : json["dew_point"].toDouble(),
        uvi: json["uvi"] == null ? null : json["uvi"].toDouble(),
        clouds: json["clouds"] == null ? null : json["clouds"],
        visibility: json["visibility"] == null ? null : json["visibility"],
        windSpeed:
            json["wind_speed"] == null ? null : json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"] == null ? null : json["wind_deg"],
        windGust:
            json["wind_gust"] == null ? null : json["wind_gust"].toDouble(),
        weather: json["weather"] == null
            ? null
            : List<Weather>.from(
                json["weather"].map((x) => Weather.fromJson(x))),
        snow: json["snow"] == null ? null : Snow.fromJson(json["snow"]),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt == null ? null : dt,
        "sunrise": sunrise == null ? null : sunrise,
        "sunset": sunset == null ? null : sunset,
        "temp": temp == null ? null : temp,
        "feels_like": feelsLike == null ? null : feelsLike,
        "pressure": pressure == null ? null : pressure,
        "humidity": humidity == null ? null : humidity,
        "dew_point": dewPoint == null ? null : dewPoint,
        "uvi": uvi == null ? null : uvi,
        "clouds": clouds == null ? null : clouds,
        "visibility": visibility == null ? null : visibility,
        "wind_speed": windSpeed == null ? null : windSpeed,
        "wind_deg": windDeg == null ? null : windDeg,
        "wind_gust": windGust == null ? null : windGust,
        "weather": weather == null
            ? null
            : List<dynamic>.from(weather!.map((x) => x.toJson())),
        "snow": snow == null ? null : snow!.toJson(),
      };
}

class Snow {
  Snow({
    this.the1H,
  });

  double? the1H;

  factory Snow.fromRawJson(String str) => Snow.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Snow.fromJson(Map<String, dynamic> json) => Snow(
        the1H: json["1h"] == null ? null : json["1h"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "1h": the1H == null ? null : the1H,
      };
}

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  int? id;
  Main? main;
  String? description;
  String? icon;

  factory Weather.fromRawJson(String str) => Weather.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"] == null ? null : json["id"],
        main: json["main"] == null ? null : mainValues.map![json["main"]],
        description: json["description"] == null ? null : json["description"],
        icon: json["icon"] == null ? null : json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "main": main == null ? null : mainValues.reverse![main],
        "description": description == null ? null : description,
        "icon": icon == null ? null : icon,
      };
}

enum Main { SNOW, CLOUDS }

final mainValues = EnumValues({"Clouds": Main.CLOUDS, "Snow": Main.SNOW});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
