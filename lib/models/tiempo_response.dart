// To parse this JSON data, do
//
//     final temperaturaResponse = temperaturaResponseFromJson(jsonString);

import 'dart:convert';

TemperaturaResponse temperaturaResponseFromJson(String str) =>
    TemperaturaResponse.fromJson(json.decode(str));

String temperaturaResponseToJson(TemperaturaResponse data) =>
    json.encode(data.toJson());

class TemperaturaResponse {
  final double? latitude;
  final double? longitude;
  final double? generationtimeMs;
  final int? utcOffsetSeconds;
  final String? timezone;
  final String? timezoneAbbreviation;
  final double? elevation;
  final CurrentUnits? currentUnits;
  final Current? current;

  TemperaturaResponse({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.currentUnits,
    this.current,
  });

  factory TemperaturaResponse.fromJson(Map<String, dynamic> json) =>
      TemperaturaResponse(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"],
        currentUnits: json["current_units"] == null
            ? null
            : CurrentUnits.fromJson(json["current_units"]),
        current: json["current"] == null
            ? null
            : Current.fromJson(json["current"]),
      );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
    "generationtime_ms": generationtimeMs,
    "utc_offset_seconds": utcOffsetSeconds,
    "timezone": timezone,
    "timezone_abbreviation": timezoneAbbreviation,
    "elevation": elevation,
    "current_units": currentUnits?.toJson(),
    "current": current?.toJson(),
  };
}

class Current {
  final String? time;
  final int? interval;
  final double? temperature2M;

  Current({this.time, this.interval, this.temperature2M});

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    time: json["time"],
    interval: json["interval"],
    temperature2M: json["temperature_2m"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
    "temperature_2m": temperature2M,
  };
}

class CurrentUnits {
  final String? time;
  final String? interval;
  final String? temperature2M;

  CurrentUnits({this.time, this.interval, this.temperature2M});

  factory CurrentUnits.fromJson(Map<String, dynamic> json) => CurrentUnits(
    time: json["time"],
    interval: json["interval"],
    temperature2M: json["temperature_2m"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
    "temperature_2m": temperature2M,
  };
}
