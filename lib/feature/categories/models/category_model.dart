import 'package:evencir_test/core/api/models/deserializable.dart';

class CategoryModel implements Deserializable {
  String slug;
  String name;
  String url;
  String? thumbnail;

  CategoryModel({
    required this.slug,
    required this.name,
    required this.url,
    this.thumbnail,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    slug: json["slug"],
    name: json["name"],
    url: json["url"],
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "slug": slug,
    "name": name,
    "url": url,
    "thumbnail": thumbnail,
  };

  CategoryModel copyWith({String? thumbnail}) {
    return CategoryModel(
      slug: slug,
      name: name,
      url: url,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }
}
