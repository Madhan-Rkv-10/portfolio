// To parse this JSON data, do
//
//     final resumeDataResponse = resumeDataResponseFromJson(jsonString);

// import 'dart:convert';

// ResumeDataResponse resumeDataResponseFromJson(String str) => ResumeDataResponse.fromJson(json.decode(str));

// String resumeDataResponseToJson(ResumeDataResponse data) => json.encode(data.toJson());

class ResumeDataResponse {
  final Data? data;

  ResumeDataResponse({
    this.data,
  });

  factory ResumeDataResponse.fromJson(Map<String, dynamic> json) =>
      ResumeDataResponse(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  final String? name;
  final String? email;
  final String? description;
  final String? about;
  final String? github;
  final String? linkedIn;
  final List<Language>? languages;
  final List<Project>? projects;

  Data({
    this.name,
    this.email,
    this.description,
    this.about,
    this.github,
    this.linkedIn,
    this.languages,
    this.projects,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        description: json["description"],
        about: json["about"],
        github: json["github"],
        linkedIn: json["linked_in"],
        languages: json["languages"] == null
            ? []
            : List<Language>.from(
                json["languages"]!.map((x) => Language.fromJson(x))),
        projects: json["projects"] == null
            ? []
            : List<Project>.from(
                json["projects"]!.map((x) => Project.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "description": description,
        "about": about,
        "github": github,
        "linked_in": linkedIn,
        "languages": languages == null
            ? []
            : List<dynamic>.from(languages!.map((x) => x.toJson())),
        "projects": projects == null
            ? []
            : List<dynamic>.from(projects!.map((x) => x.toJson())),
      };
}

class Language {
  final String? name;
  final String? imageUrl;

  Language({
    this.name,
    this.imageUrl,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: json["name"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image_url": imageUrl,
      };
}

class Project {
  final String? id;
  final String? title;
  final List<String>? description;
  final List<String>? languages;
  final List<String>? features;
  final List<String>? authetication;
  final List<String>? images;
  final String? sourceCode;
  bool isHover;

  Project({
    this.id,
    this.title,
    this.description,
    this.languages,
    this.features,
    this.authetication,
    this.isHover = false,
    this.images,
    this.sourceCode,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json["id"],
        title: json["title"],
        description: json["description"] == null
            ? []
            : List<String>.from(json["description"]!.map((x) => x)),
        languages: json["languages"] == null
            ? []
            : List<String>.from(json["languages"]!.map((x) => x)),
        features: json["features"] == null
            ? []
            : List<String>.from(json["features"]!.map((x) => x)),
        authetication: json["authetication"] == null
            ? []
            : List<String>.from(json["authetication"]!.map((x) => x)),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        sourceCode: json["source_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description == null
            ? []
            : List<dynamic>.from(description!.map((x) => x)),
        "languages": languages == null
            ? []
            : List<dynamic>.from(languages!.map((x) => x)),
        "features":
            features == null ? [] : List<dynamic>.from(features!.map((x) => x)),
        "authetication": authetication == null
            ? []
            : List<dynamic>.from(authetication!.map((x) => x)),
        "images":
            images == null ? [] : List<String>.from(images!.map((x) => x)),
        "source_code": sourceCode,
      };
}
