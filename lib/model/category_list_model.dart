import 'dart:convert';

List<CategoryListModel> categoryListModelFromJson(String str) => List<CategoryListModel>.from(json.decode(str).map((x) => CategoryListModel.fromJson(x)));

String categoryListModelToJson(List<CategoryListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryListModel {
    CategoryListModel({
        required this.id,
        required this.name,
        required this.slug,
        required this.parent,
        required this.description,
        required this.display,
        required this.image,
        required this.menuOrder,
        required this.count,
    });

    int id;
    String name;
    String slug;
    int parent;
    String description;
    String display;
    Imagec image;
    int menuOrder;
    int count;

    factory CategoryListModel.fromJson(Map<String, dynamic> json) => CategoryListModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        parent: json["parent"],
        description: json["description"],
        display: json["display"],
        image: Imagec.fromJson(json["image"]),
        menuOrder: json["menu_order"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "parent": parent,
        "description": description,
        "display": display,
        "image": image.toJson(),
        "menu_order": menuOrder,
        "count": count,
    };
}

class Imagec {
    Imagec({
        required this.id,
        required this.src,
        required this.name,
    });

    int id;
    dynamic src;
    String name;

    factory Imagec.fromJson(Map<String, dynamic> json) => Imagec(
        id: json["id"],
        src: json["src"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "src": src,
        "name": name,
    };
}



