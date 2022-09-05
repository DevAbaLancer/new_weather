// To parse this JSON data, do
//
//     final geocodingModel = geocodingModelFromJson(jsonString);

import 'dart:convert';

class GeocodingModel {
  GeocodingModel({
    this.name,
    this.localNames,
    this.lat,
    this.lon,
    this.country,
    this.state,
  });

  String? name;
  LocalNames? localNames;
  double? lat;
  double? lon;
  String? country;
  String? state;

  factory GeocodingModel.fromRawJson(String str) =>
      GeocodingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GeocodingModel.fromJson(Map<String, dynamic> json) => GeocodingModel(
        name: json["name"] == null ? null : json["name"],
        localNames: json["local_names"] == null
            ? null
            : LocalNames.fromJson(json["local_names"]),
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lon: json["lon"] == null ? null : json["lon"].toDouble(),
        country: json["country"] == null ? null : json["country"],
        state: json["state"] == null ? null : json["state"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "local_names": localNames == null ? null : localNames!.toJson(),
        "lat": lat == null ? null : lat,
        "lon": lon == null ? null : lon,
        "country": country == null ? null : country,
        "state": state == null ? null : state,
      };
}

class LocalNames {
  LocalNames({
    this.fr,
    this.hi,
    this.it,
    this.oc,
    this.el,
    this.kn,
    this.zh,
    this.gu,
    this.uk,
    this.or,
    this.pa,
    this.ar,
    this.th,
    this.ru,
    this.ml,
    this.he,
    this.te,
    this.de,
    this.localNamesAs,
    this.bn,
    this.my,
    this.cs,
    this.ja,
    this.ur,
    this.ms,
    this.be,
    this.en,
    this.ko,
  });

  String? fr;
  String? hi;
  String? it;
  String? oc;
  String? el;
  String? kn;
  String? zh;
  String? gu;
  String? uk;
  String? or;
  String? pa;
  String? ar;
  String? th;
  String? ru;
  String? ml;
  String? he;
  String? te;
  String? de;
  String? localNamesAs;
  String? bn;
  String? my;
  String? cs;
  String? ja;
  String? ur;
  String? ms;
  String? be;
  String? en;
  String? ko;

  factory LocalNames.fromRawJson(String str) =>
      LocalNames.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocalNames.fromJson(Map<String, dynamic> json) => LocalNames(
        fr: json["fr"] == null ? null : json["fr"],
        hi: json["hi"] == null ? null : json["hi"],
        it: json["it"] == null ? null : json["it"],
        oc: json["oc"] == null ? null : json["oc"],
        el: json["el"] == null ? null : json["el"],
        kn: json["kn"] == null ? null : json["kn"],
        zh: json["zh"] == null ? null : json["zh"],
        gu: json["gu"] == null ? null : json["gu"],
        uk: json["uk"] == null ? null : json["uk"],
        or: json["or"] == null ? null : json["or"],
        pa: json["pa"] == null ? null : json["pa"],
        ar: json["ar"] == null ? null : json["ar"],
        th: json["th"] == null ? null : json["th"],
        ru: json["ru"] == null ? null : json["ru"],
        ml: json["ml"] == null ? null : json["ml"],
        he: json["he"] == null ? null : json["he"],
        te: json["te"] == null ? null : json["te"],
        de: json["de"] == null ? null : json["de"],
        localNamesAs: json["as"] == null ? null : json["as"],
        bn: json["bn"] == null ? null : json["bn"],
        my: json["my"] == null ? null : json["my"],
        cs: json["cs"] == null ? null : json["cs"],
        ja: json["ja"] == null ? null : json["ja"],
        ur: json["ur"] == null ? null : json["ur"],
        ms: json["ms"] == null ? null : json["ms"],
        be: json["be"] == null ? null : json["be"],
        en: json["en"] == null ? null : json["en"],
        ko: json["ko"] == null ? null : json["ko"],
      );

  Map<String, dynamic> toJson() => {
        "fr": fr == null ? null : fr,
        "hi": hi == null ? null : hi,
        "it": it == null ? null : it,
        "oc": oc == null ? null : oc,
        "el": el == null ? null : el,
        "kn": kn == null ? null : kn,
        "zh": zh == null ? null : zh,
        "gu": gu == null ? null : gu,
        "uk": uk == null ? null : uk,
        "or": or == null ? null : or,
        "pa": pa == null ? null : pa,
        "ar": ar == null ? null : ar,
        "th": th == null ? null : th,
        "ru": ru == null ? null : ru,
        "ml": ml == null ? null : ml,
        "he": he == null ? null : he,
        "te": te == null ? null : te,
        "de": de == null ? null : de,
        "as": localNamesAs == null ? null : localNamesAs,
        "bn": bn == null ? null : bn,
        "my": my == null ? null : my,
        "cs": cs == null ? null : cs,
        "ja": ja == null ? null : ja,
        "ur": ur == null ? null : ur,
        "ms": ms == null ? null : ms,
        "be": be == null ? null : be,
        "en": en == null ? null : en,
        "ko": ko == null ? null : ko,
      };
}
