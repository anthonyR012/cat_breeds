

import 'dart:convert';

ImageCat imageCatFromJson(String str) => ImageCat.fromJson(json.decode(str));

String imageCatToJson(ImageCat data) => json.encode(data.toJson());

class ImageCat {
    String id;
    String url;
    int width;
    int height;

    ImageCat({
        required this.id,
        required this.url,
        required this.width,
        required this.height,
    });

    factory ImageCat.fromJson(Map<String, dynamic> json) => ImageCat(
        id: toStringMap(json["id"]),
        url: toStringMap(json["url"]),
        width: toIntMap(json["width"]),
        height: toIntMap(json["height"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "width": width,
        "height": height,
    };
    static String toStringMap(value) => value.toString();
      static int toIntMap(value) => int.tryParse(value.toString()) ?? 0;
}
