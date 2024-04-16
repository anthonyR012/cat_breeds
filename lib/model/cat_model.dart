import 'dart:convert';

import 'package:catbreeds/model/weigth_model.dart';

List<CatModel> catsModelFromJson(String str) =>
    List<CatModel>.from(json.decode(str).map((x) => CatModel.fromJson(x)));

String catModelToJson(List<CatModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatModel {
  final WeightModel weight;
  final String id;
  final String name;
  final String? cfaUrl;
  final String vetstreetUrl;
  final String? vcahospitalsUrl;
  final String temperament;
  final String origin;
  final String countryCodes;
  final String countryCode;
  final String description;
  final String lifeSpan;
  final int indoor;
  final int? lap;
  final String altNames;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final int experimental;
  final int hairless;
  final int natural;
  final int rare;
  final int rex;
  final int suppressedTail;
  final int shortLegs;
  final String wikipediaUrl;
  final int hypoallergenic;
  final String referenceImageId;

  CatModel({
    required this.weight,
    required this.id,
    required this.name,
    this.cfaUrl,
    required this.vetstreetUrl,
    this.vcahospitalsUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    this.lap,
    required this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.wikipediaUrl,
    required this.hypoallergenic,
    required this.referenceImageId,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) => CatModel(
        weight: WeightModel.fromJson(json["weight"]),
        id: toStringMap(json["id"]),
        name: toStringMap(json["name"]),
        cfaUrl: toStringMap(json["cfa_url"]),
        vetstreetUrl: toStringMap(json["vetstreet_url"]),
        vcahospitalsUrl: toStringMap(json["vcahospitals_url"]),
        temperament: toStringMap(json["temperament"]),
        origin: toStringMap(json["origin"]),
        countryCodes: toStringMap(json["country_codes"]),
        countryCode: toStringMap(json["country_code"]),
        description: toStringMap(json["description"]),
        lifeSpan: toStringMap(json["life_span"]),
        indoor: toIntMap(json["indoor"]),
        lap: toIntMap(json["lap"]),
        altNames: toStringMap(json["alt_names"]),
        adaptability: toIntMap(json["adaptability"]),
        affectionLevel: toIntMap(json["affection_level"]),
        childFriendly: toIntMap(json["child_friendly"]),
        dogFriendly: toIntMap(json["dog_friendly"]),
        energyLevel: toIntMap(json["energy_level"]),
        grooming: toIntMap(json["grooming"]),
        healthIssues: toIntMap(json["health_issues"]),
        intelligence: toIntMap(json["intelligence"]),
        sheddingLevel: toIntMap(json["shedding_level"]),
        socialNeeds: toIntMap(json["social_needs"]),
        strangerFriendly: toIntMap(json["stranger_friendly"]),
        vocalisation: toIntMap(json["vocalisation"]),
        experimental: toIntMap(json["experimental"]),
        hairless: toIntMap(json["hairless"]),
        natural: toIntMap(json["natural"]),
        rare: toIntMap(json["rare"]),
        rex: toIntMap(json["rex"]),
        suppressedTail: toIntMap(json["suppressed_tail"]),
        shortLegs: toIntMap(json["short_legs"]),
        wikipediaUrl: toStringMap(json["wikipedia_url"]),
        hypoallergenic: toIntMap(json["hypoallergenic"]),
        referenceImageId: toStringMap(json["reference_image_id"]),
      );

  Map<String, dynamic> toJson() => {
        "weight": weight.toJson(),
        "id": id,
        "name": name,
        "cfa_url": cfaUrl,
        "vetstreet_url": vetstreetUrl,
        "vcahospitals_url": vcahospitalsUrl,
        "temperament": temperament,
        "origin": origin,
        "country_codes": countryCodes,
        "country_code": countryCode,
        "description": description,
        "life_span": lifeSpan,
        "indoor": indoor,
        "lap": lap,
        "alt_names": altNames,
        "adaptability": adaptability,
        "affection_level": affectionLevel,
        "child_friendly": childFriendly,
        "dog_friendly": dogFriendly,
        "energy_level": energyLevel,
        "grooming": grooming,
        "health_issues": healthIssues,
        "intelligence": intelligence,
        "shedding_level": sheddingLevel,
        "social_needs": socialNeeds,
        "stranger_friendly": strangerFriendly,
        "vocalisation": vocalisation,
        "experimental": experimental,
        "hairless": hairless,
        "natural": natural,
        "rare": rare,
        "rex": rex,
        "suppressed_tail": suppressedTail,
        "short_legs": shortLegs,
        "wikipedia_url": wikipediaUrl,
        "hypoallergenic": hypoallergenic,
        "reference_image_id": referenceImageId,
      };

  static String toStringMap(value) => value.toString();
  static int toIntMap(value) => int.tryParse(value.toString()) ?? 0;
}
