// import 'dart:convert';

// List<CategoryProductListModel> categoryProductListModelFromJson(String str) => List<CategoryProductListModel>.from(json.decode(str).map((x) => CategoryProductListModel.fromJson(x)));

// String categoryProductListModelToJson(List<CategoryProductListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class CategoryProductListModel {
//     CategoryProductListModel({
//         required this.id,
//         required this.name,
//         required this.slug,
//         required this.permalink,
//         required this.dateCreated,
//         required this.dateCreatedGmt,
//         required this.dateModified,
//         required this.dateModifiedGmt,
//         required this.type,
//         required this.status,
//         required this.featured,
//         required this.catalogVisibility,
//         required this.description,
//         required this.shortDescription,
//         required this.sku,
//         required this.price,
//         required this.regularPrice,
//         required this.salePrice,
//         required this.onSale,
//         required this.purchasable,
//         required this.totalSales,
//         required this.virtual,
//         required this.downloadable,
//         required this.downloadLimit,
//         required this.downloadExpiry,
//         required this.externalUrl,
//         required this.buttonText,
//         required this.taxStatus,
//         required this.taxClass,
//         required this.manageStock,
//         required this.backorders,
//         required this.backordersAllowed,
//         required this.backordered,
//         required this.soldIndividually,
//         required this.weight,
//         required this.dimensions,
//         required this.shippingRequired,
//         required this.shippingTaxable,
//         required this.shippingClass,
//         required this.shippingClassId,
//         required this.reviewsAllowed,
//         required this.averageRating,
//         required this.ratingCount,
//         required this.parentId,
//         required this.purchaseNote,
//         required this.categories,
//         required this.images,
//         required this.attributes,
//         required this.variations,
//         required this.menuOrder,
//         required this.priceHtml,
//         required this.relatedIds,
//         required this.stockStatus,
//         required this.hasOptions,
//         required this.amsDefaultVariationId,
//         required this.amsProductPointsReward,
//         required this.amsProductDiscountPercentage,
//         required this.amsPriceToDisplay,
//         required this.yoastHead,
//         required this.yoastHeadJson,
//     });

//     int id;
//     String name;
//     String slug;
//     String permalink;
//     DateTime dateCreated;
//     DateTime dateCreatedGmt;
//     DateTime dateModified;
//     DateTime dateModifiedGmt;
//     String type;
//     String status;
//     bool featured;
//     String catalogVisibility;
//     String description;
//     String shortDescription;
//     String sku;
//     String price;
//     String regularPrice;
//     String salePrice;
//     bool onSale;
//     bool purchasable;
//     int totalSales;
//     bool virtual;
//     bool downloadable;
//     int downloadLimit;
//     int downloadExpiry;
//     String externalUrl;
//     String buttonText;
//     String taxStatus;
//     String taxClass;
//     bool manageStock;
//     String backorders;
//     bool backordersAllowed;
//     bool backordered;
//     bool soldIndividually;
//     String weight;
//     Dimensions dimensions;
//     bool shippingRequired;
//     bool shippingTaxable;
//     String shippingClass;
//     int shippingClassId;
//     bool reviewsAllowed;
//     String averageRating;
//     int ratingCount;
//     int parentId;
//     String purchaseNote;
//     List<Category> categories;
//     List<Imageu> images;
//     List<Attribute> attributes;
//     List<int> variations;
//     int menuOrder;
//     String priceHtml;
//     List<int> relatedIds;
//     String stockStatus;
//     bool hasOptions;
//     int amsDefaultVariationId;
//     List<dynamic> amsProductPointsReward;
//     int amsProductDiscountPercentage;
//     int amsPriceToDisplay;
//     String yoastHead;
//     YoastHeadJson yoastHeadJson;

//     factory CategoryProductListModel.fromJson(Map<String, dynamic> json) => CategoryProductListModel(
//         id: json["id"],
//         name: json["name"],
//         slug: json["slug"],
//         permalink: json["permalink"],
//         dateCreated: DateTime.parse(json["date_created"]),
//         dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
//         dateModified: DateTime.parse(json["date_modified"]),
//         dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
//         type: json["type"],
//         status: json["status"],
//         featured: json["featured"],
//         catalogVisibility: json["catalog_visibility"],
//         description: json["description"],
//         shortDescription: json["short_description"],
//         sku: json["sku"],
//         price: json["price"],
//         regularPrice: json["regular_price"],
//         salePrice: json["sale_price"],
//         onSale: json["on_sale"],
//         purchasable: json["purchasable"],
//         totalSales: json["total_sales"],
//         virtual: json["virtual"],
//         downloadable: json["downloadable"],
//         downloadLimit: json["download_limit"],
//         downloadExpiry: json["download_expiry"],
//         externalUrl: json["external_url"],
//         buttonText: json["button_text"],
//         taxStatus: json["tax_status"],
//         taxClass: json["tax_class"],
//         manageStock: json["manage_stock"],
//         backorders: json["backorders"],
//         backordersAllowed: json["backorders_allowed"],
//         backordered: json["backordered"],
//         soldIndividually: json["sold_individually"],
//         weight: json["weight"],
//         dimensions: Dimensions.fromJson(json["dimensions"]),
//         shippingRequired: json["shipping_required"],
//         shippingTaxable: json["shipping_taxable"],
//         shippingClass: json["shipping_class"],
//         shippingClassId: json["shipping_class_id"],
//         reviewsAllowed: json["reviews_allowed"],
//         averageRating: json["average_rating"],
//         ratingCount: json["rating_count"],
//         parentId: json["parent_id"],
//         purchaseNote: json["purchase_note"],
//         categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
//         images: List<Imageu>.from(json["images"].map((x) => Imageu.fromJson(x))),
//         attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
//         variations: List<int>.from(json["variations"].map((x) => x)),
//         menuOrder: json["menu_order"],
//         priceHtml: json["price_html"],
//         relatedIds: List<int>.from(json["related_ids"].map((x) => x)),
//         stockStatus: json["stock_status"],
//         hasOptions: json["has_options"],
//         amsDefaultVariationId: json["ams_default_variation_id"],
//         amsProductPointsReward: List<dynamic>.from(json["ams_product_points_reward"].map((x) => x)),
//         amsProductDiscountPercentage: json["ams_product_discount_percentage"],
//         amsPriceToDisplay: json["ams_price_to_display"],
//         yoastHead: json["yoast_head"],
//         yoastHeadJson: YoastHeadJson.fromJson(json["yoast_head_json"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "slug": slug,
//         "permalink": permalink,
//         "date_created": dateCreated.toIso8601String(),
//         "date_created_gmt": dateCreatedGmt.toIso8601String(),
//         "date_modified": dateModified.toIso8601String(),
//         "date_modified_gmt": dateModifiedGmt.toIso8601String(),
//         "type": type,
//         "status": status,
//         "featured": featured,
//         "catalog_visibility": catalogVisibility,
//         "description": description,
//         "short_description": shortDescription,
//         "sku": sku,
//         "price": price,
//         "regular_price": regularPrice,
//         "sale_price": salePrice,
//         "on_sale": onSale,
//         "purchasable": purchasable,
//         "total_sales": totalSales,
//         "virtual": virtual,
//         "downloadable": downloadable,
//         "download_limit": downloadLimit,
//         "download_expiry": downloadExpiry,
//         "external_url": externalUrl,
//         "button_text": buttonText,
//         "tax_status": taxStatus,
//         "tax_class": taxClass,
//         "manage_stock": manageStock,
//         "backorders": backorders,
//         "backorders_allowed": backordersAllowed,
//         "backordered": backordered,
//         "sold_individually": soldIndividually,
//         "weight": weight,
//         "dimensions": dimensions.toJson(),
//         "shipping_required": shippingRequired,
//         "shipping_taxable": shippingTaxable,
//         "shipping_class": shippingClass,
//         "shipping_class_id": shippingClassId,
//         "reviews_allowed": reviewsAllowed,
//         "average_rating": averageRating,
//         "rating_count": ratingCount,
//         "parent_id": parentId,
//         "purchase_note": purchaseNote,
//         "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
//         "images": List<dynamic>.from(images.map((x) => x.toJson())),
//         "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
//         "variations": List<dynamic>.from(variations.map((x) => x)),
//         "menu_order": menuOrder,
//         "price_html": priceHtml,
//         "related_ids": List<dynamic>.from(relatedIds.map((x) => x)),
//         "stock_status": stockStatus,
//         "has_options": hasOptions,
//         "ams_default_variation_id": amsDefaultVariationId,
//         "ams_product_points_reward": List<dynamic>.from(amsProductPointsReward.map((x) => x)),
//         "ams_product_discount_percentage": amsProductDiscountPercentage,
//         "ams_price_to_display": amsPriceToDisplay,
//         "yoast_head": yoastHead,
//         "yoast_head_json": yoastHeadJson.toJson(),
//     };
// }

// class Attribute {
//     Attribute({
//         required this.id,
//         required this.name,
//         required this.position,
//         required this.visible,
//         required this.variation,
//         required this.options,
//         required this.slug,
//         required this.optionsSlugs,
//         required this.terms,
//     });

//     int id;
//     String name;
//     int position;
//     bool visible;
//     bool variation;
//     List<String> options;
//     String slug;
//     List<String> optionsSlugs;
//     List<Term> terms;

//     factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
//         id: json["id"],
//         name: json["name"],
//         position: json["position"],
//         visible: json["visible"],
//         variation: json["variation"],
//         options: List<String>.from(json["options"].map((x) => x)),
//         slug: json["slug"],
//         optionsSlugs: List<String>.from(json["options_slugs"].map((x) => x)),
//         terms: List<Term>.from(json["terms"].map((x) => Term.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "position": position,
//         "visible": visible,
//         "variation": variation,
//         "options": List<dynamic>.from(options.map((x) => x)),
//         "slug": slug,
//         "options_slugs": List<dynamic>.from(optionsSlugs.map((x) => x)),
//         "terms": List<dynamic>.from(terms.map((x) => x.toJson())),
//     };
// }

// class Term {
//     Term({
//         required this.termId,
//         required this.name,
//         required this.slug,
//         required this.termGroup,
//         required this.termTaxonomyId,
//         required this.taxonomy,
//         required this.description,
//         required this.parent,
//         required this.count,
//         required this.filter,
//     });

//     int termId;
//     String name;
//     String slug;
//     int termGroup;
//     int termTaxonomyId;
//     String taxonomy;
//     String description;
//     int parent;
//     int count;
//     String filter;

//     factory Term.fromJson(Map<String, dynamic> json) => Term(
//         termId: json["term_id"],
//         name: json["name"],
//         slug: json["slug"],
//         termGroup: json["term_group"],
//         termTaxonomyId: json["term_taxonomy_id"],
//         taxonomy: json["taxonomy"],
//         description: json["description"],
//         parent: json["parent"],
//         count: json["count"],
//         filter: json["filter"],
//     );

//     Map<String, dynamic> toJson() => {
//         "term_id": termId,
//         "name": name,
//         "slug": slug,
//         "term_group": termGroup,
//         "term_taxonomy_id": termTaxonomyId,
//         "taxonomy": taxonomy,
//         "description": description,
//         "parent": parent,
//         "count": count,
//         "filter": filter,
//     };
// }

// class Category {
//     Category({
//         required this.id,
//         required this.name,
//         required this.slug,
//     });

//     int id;
//     String name;
//     String slug;

//     factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["id"],
//         name: json["name"],
//         slug: json["slug"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "slug": slug,
//     };
// }

// class Dimensions {
//     Dimensions({
//         required this.length,
//         required this.width,
//         required this.height,
//     });

//     String length;
//     String width;
//     String height;

//     factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
//         length: json["length"],
//         width: json["width"],
//         height: json["height"],
//     );

//     Map<String, dynamic> toJson() => {
//         "length": length,
//         "width": width,
//         "height": height,
//     };
// }

// class Imageu {
//     Imageu({
//         required this.id,
//         required this.dateCreated,
//         required this.dateCreatedGmt,
//         required this.dateModified,
//         required this.dateModifiedGmt,
//         required this.src,
//         required this.name,
//         required this.alt,
//         required this.thumbnail,
//         required this.medium,
//     });

//     int id;
//     DateTime dateCreated;
//     DateTime dateCreatedGmt;
//     DateTime dateModified;
//     DateTime dateModifiedGmt;
//     String src;
//     String name;
//     String alt;
//     String thumbnail;
//     String medium;

//     factory Imageu.fromJson(Map<String, dynamic> json) => Imageu(
//         id: json["id"],
//         dateCreated: DateTime.parse(json["date_created"]),
//         dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
//         dateModified: DateTime.parse(json["date_modified"]),
//         dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
//         src: json["src"],
//         name: json["name"],
//         alt: json["alt"],
//         thumbnail: json["thumbnail"],
//         medium: json["medium"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "date_created": dateCreated.toIso8601String(),
//         "date_created_gmt": dateCreatedGmt.toIso8601String(),
//         "date_modified": dateModified.toIso8601String(),
//         "date_modified_gmt": dateModifiedGmt.toIso8601String(),
//         "src": src,
//         "name": name,
//         "alt": alt,
//         "thumbnail": thumbnail,
//         "medium": medium,
//     };
// }

// class YoastHeadJson {
//     YoastHeadJson({
//         required this.title,
//         required this.robots,
//         required this.canonical,
//         required this.ogLocale,
//         required this.ogType,
//         required this.ogTitle,
//         required this.ogDescription,
//         required this.ogUrl,
//         required this.ogSiteName,
//         required this.ogImage,
//         required this.twitterCard,
//         required this.twitterMisc,
//         required this.schema,
//     });

//     String title;
//     Robots robots;
//     String canonical;
//     String ogLocale;
//     String ogType;
//     String ogTitle;
//     String ogDescription;
//     String ogUrl;
//     String ogSiteName;
//     List<OgImage> ogImage;
//     String twitterCard;
//     TwitterMisc twitterMisc;
//     Schema schema;

//     factory YoastHeadJson.fromJson(Map<String, dynamic> json) => YoastHeadJson(
//         title: json["title"],
//         robots: Robots.fromJson(json["robots"]),
//         canonical: json["canonical"],
//         ogLocale: json["og_locale"],
//         ogType: json["og_type"],
//         ogTitle: json["og_title"],
//         ogDescription: json["og_description"],
//         ogUrl: json["og_url"],
//         ogSiteName: json["og_site_name"],
//         ogImage: List<OgImage>.from(json["og_image"].map((x) => OgImage.fromJson(x))),
//         twitterCard: json["twitter_card"],
//         twitterMisc: TwitterMisc.fromJson(json["twitter_misc"]),
//         schema: Schema.fromJson(json["schema"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "title": title,
//         "robots": robots.toJson(),
//         "canonical": canonical,
//         "og_locale": ogLocale,
//         "og_type": ogType,
//         "og_title": ogTitle,
//         "og_description": ogDescription,
//         "og_url": ogUrl,
//         "og_site_name": ogSiteName,
//         "og_image": List<dynamic>.from(ogImage.map((x) => x.toJson())),
//         "twitter_card": twitterCard,
//         "twitter_misc": twitterMisc.toJson(),
//         "schema": schema.toJson(),
//     };
// }

// class OgImage {
//     OgImage({
//         required this.width,
//         required this.height,
//         required this.url,
//         required this.type,
//     });

//     int width;
//     int height;
//     String url;
//     String type;

//     factory OgImage.fromJson(Map<String, dynamic> json) => OgImage(
//         width: json["width"],
//         height: json["height"],
//         url: json["url"],
//         type: json["type"],
//     );

//     Map<String, dynamic> toJson() => {
//         "width": width,
//         "height": height,
//         "url": url,
//         "type": type,
//     };
// }

// class Robots {
//     Robots({
//         required this.index,
//         required this.follow,
//         required this.maxSnippet,
//         required this.maxImagePreview,
//         required this.maxVideoPreview,
//     });

//     String index;
//     String follow;
//     String maxSnippet;
//     String maxImagePreview;
//     String maxVideoPreview;

//     factory Robots.fromJson(Map<String, dynamic> json) => Robots(
//         index: json["index"],
//         follow: json["follow"],
//         maxSnippet: json["max-snippet"],
//         maxImagePreview: json["max-image-preview"],
//         maxVideoPreview: json["max-video-preview"],
//     );

//     Map<String, dynamic> toJson() => {
//         "index": index,
//         "follow": follow,
//         "max-snippet": maxSnippet,
//         "max-image-preview": maxImagePreview,
//         "max-video-preview": maxVideoPreview,
//     };
// }

// class Schema {
//     Schema({
//         required this.context,
//         required this.graph,
//     });

//     String context;
//     List<Graph> graph;

//     factory Schema.fromJson(Map<String, dynamic> json) => Schema(
//         context: json["@context"],
//         graph: List<Graph>.from(json["@graph"].map((x) => Graph.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "@context": context,
//         "@graph": List<dynamic>.from(graph.map((x) => x.toJson())),
//     };
// }

// class Graph {
//     Graph({
//         required this.type,
//         required this.id,
//         this.url,
//         this.name,
//         this.isPartOf,
//         this.datePublished,
//         this.dateModified,
//         this.breadcrumb,
//         this.inLanguage,
//         this.potentialAction,
//         this.itemListElement,
//         this.description,
//     });

//     String type;
//     String id;
//     String? url;
//     String? name;
//     Breadcrumb? isPartOf;
//     DateTime? datePublished;
//     DateTime? dateModified;
//     Breadcrumb? breadcrumb;
//     String? inLanguage;
//     List<PotentialAction>? potentialAction;
//     List<ItemListElement>? itemListElement;
//     String? description;

//     factory Graph.fromJson(Map<String, dynamic> json) => Graph(
//         type: json["@type"],
//         id: json["@id"],
//         url: json["url"],
//         name: json["name"],
//         isPartOf: json["isPartOf"] == null ? null : Breadcrumb.fromJson(json["isPartOf"]),
//         datePublished: json["datePublished"] == null ? null : DateTime.parse(json["datePublished"]),
//         dateModified: json["dateModified"] == null ? null : DateTime.parse(json["dateModified"]),
//         breadcrumb: json["breadcrumb"] == null ? null : Breadcrumb.fromJson(json["breadcrumb"]),
//         inLanguage: json["inLanguage"],
//         potentialAction: json["potentialAction"] == null ? [] : List<PotentialAction>.from(json["potentialAction"]!.map((x) => PotentialAction.fromJson(x))),
//         itemListElement: json["itemListElement"] == null ? [] : List<ItemListElement>.from(json["itemListElement"]!.map((x) => ItemListElement.fromJson(x))),
//         description: json["description"],
//     );

//     Map<String, dynamic> toJson() => {
//         "@type": type,
//         "@id": id,
//         "url": url,
//         "name": name,
//         "isPartOf": isPartOf?.toJson(),
//         "datePublished": datePublished?.toIso8601String(),
//         "dateModified": dateModified?.toIso8601String(),
//         "breadcrumb": breadcrumb?.toJson(),
//         "inLanguage": inLanguage,
//         "potentialAction": potentialAction == null ? [] : List<dynamic>.from(potentialAction!.map((x) => x.toJson())),
//         "itemListElement": itemListElement == null ? [] : List<dynamic>.from(itemListElement!.map((x) => x.toJson())),
//         "description": description,
//     };
// }

// class Breadcrumb {
//     Breadcrumb({
//         required this.id,
//     });

//     String id;

//     factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
//         id: json["@id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "@id": id,
//     };
// }

// class ItemListElement {
//     ItemListElement({
//         required this.type,
//         required this.position,
//         required this.name,
//         this.item,
//     });

//     String type;
//     int position;
//     String name;
//     String? item;

//     factory ItemListElement.fromJson(Map<String, dynamic> json) => ItemListElement(
//         type: json["@type"],
//         position: json["position"],
//         name: json["name"],
//         item: json["item"],
//     );

//     Map<String, dynamic> toJson() => {
//         "@type": type,
//         "position": position,
//         "name": name,
//         "item": item,
//     };
// }

// class PotentialAction {
//     PotentialAction({
//         required this.type,
//         required this.target,
//         this.queryInput,
//     });

//     String type;
//     dynamic target;
//     String? queryInput;

//     factory PotentialAction.fromJson(Map<String, dynamic> json) => PotentialAction(
//         type: json["@type"],
//         target: json["target"],
//         queryInput: json["query-input"],
//     );

//     Map<String, dynamic> toJson() => {
//         "@type": type,
//         "target": target,
//         "query-input": queryInput,
//     };
// }

// class TargetClass {
//     TargetClass({
//         required this.type,
//         required this.urlTemplate,
//     });

//     String type;
//     String urlTemplate;

//     factory TargetClass.fromJson(Map<String, dynamic> json) => TargetClass(
//         type: json["@type"],
//         urlTemplate: json["urlTemplate"],
//     );

//     Map<String, dynamic> toJson() => {
//         "@type": type,
//         "urlTemplate": urlTemplate,
//     };
// }

// class TwitterMisc {
//     TwitterMisc({
//         required this.estReadingTime,
//     });

//     String estReadingTime;

//     factory TwitterMisc.fromJson(Map<String, dynamic> json) => TwitterMisc(
//         estReadingTime: json["Est. reading time"],
//     );

//     Map<String, dynamic> toJson() => {
//         "Est. reading time": estReadingTime,
//     };
// }


import 'dart:convert';

List<CategoryProductListModel> categoryProductListModelFromJson(String str) => List<CategoryProductListModel>.from(json.decode(str).map((x) => CategoryProductListModel.fromJson(x)));

String categoryProductListModelToJson(List<CategoryProductListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryProductListModel {
    CategoryProductListModel({
        required this.id,
        required this.name,
        required this.slug,
        required this.permalink,
        required this.dateCreated,
        required this.dateCreatedGmt,
        required this.dateModified,
        required this.dateModifiedGmt,
        required this.type,
        required this.status,
        required this.featured,
        required this.catalogVisibility,
        required this.description,
        required this.shortDescription,
        required this.sku,
        required this.price,
        required this.regularPrice,
        required this.salePrice,
        required this.onSale,
        required this.purchasable,
        required this.totalSales,
        required this.virtual,
        required this.downloadable,
        required this.downloadLimit,
        required this.downloadExpiry,
        required this.externalUrl,
        required this.buttonText,
        required this.taxStatus,
        required this.taxClass,
        required this.manageStock,
        required this.backorders,
        required this.backordersAllowed,
        required this.soldIndividually,
        required this.weight,
        required this.dimensions,
        required this.shippingRequired,
        required this.shippingTaxable,
        required this.shippingClass,
        required this.shippingClassId,
        required this.reviewsAllowed,
        required this.averageRating,
        required this.ratingCount,
        required this.parentId,
        required this.purchaseNote,
        required this.categories,
        required this.images,
        required this.attributes,
        required this.variations,
        required this.relatedIds,
        required this.stockStatus,
        required this.hasOptions,
        required this.amsDefaultVariationId,
        required this.amsProductDiscountPercentage,
        required this.amsPriceToDisplay,
    });

    int id;
    String name;
    String slug;
    String permalink;
    DateTime dateCreated;
    DateTime dateCreatedGmt;
    DateTime dateModified;
    DateTime dateModifiedGmt;
    String type;
    String status;
    bool featured;
    String catalogVisibility;
    String description;
    String shortDescription;
    String sku;
    String price;
    String regularPrice;
    String salePrice;
    bool onSale;
    bool purchasable;
    int totalSales;
    bool virtual;
    bool downloadable;
    int downloadLimit;
    int downloadExpiry;
    String externalUrl;
    String buttonText;
    String taxStatus;
    String taxClass;
    bool manageStock;
    String backorders;
    bool backordersAllowed;
    bool soldIndividually;
    String weight;
    Dimensions dimensions;
    bool shippingRequired;
    bool shippingTaxable;
    String shippingClass;
    int shippingClassId;
    bool reviewsAllowed;
    String averageRating;
    int ratingCount;
    int parentId;
    String purchaseNote;
    List<Category> categories;
    List<ImageU> images;
    List<Attribute> attributes;
    List<int> variations;
    List<int> relatedIds;
    String stockStatus;
    bool hasOptions;
    int amsDefaultVariationId;
    int amsProductDiscountPercentage;
    int amsPriceToDisplay;

    factory CategoryProductListModel.fromJson(Map<String, dynamic> json) => CategoryProductListModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        permalink: json["permalink"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        dateModified: DateTime.parse(json["date_modified"]),
        dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
        type: json["type"],
        status: json["status"],
        featured: json["featured"],
        catalogVisibility: json["catalog_visibility"],
        description: json["description"],
        shortDescription: json["short_description"],
        sku: json["sku"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        onSale: json["on_sale"],
        purchasable: json["purchasable"],
        totalSales: json["total_sales"],
        virtual: json["virtual"],
        downloadable: json["downloadable"],
        downloadLimit: json["download_limit"],
        downloadExpiry: json["download_expiry"],
        externalUrl: json["external_url"],
        buttonText: json["button_text"],
        taxStatus: json["tax_status"],
        taxClass: json["tax_class"],
        manageStock: json["manage_stock"],
        backorders: json["backorders"],
        backordersAllowed: json["backorders_allowed"],
        soldIndividually: json["sold_individually"],
        weight: json["weight"],
        dimensions: Dimensions.fromJson(json["dimensions"]),
        shippingRequired: json["shipping_required"],
        shippingTaxable: json["shipping_taxable"],
        shippingClass: json["shipping_class"],
        shippingClassId: json["shipping_class_id"],
        reviewsAllowed: json["reviews_allowed"],
        averageRating: json["average_rating"],
        ratingCount: json["rating_count"],
        parentId: json["parent_id"],
        purchaseNote: json["purchase_note"],
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        images: List<ImageU>.from(json["images"].map((x) => ImageU.fromJson(x))),
        attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
        variations: List<int>.from(json["variations"].map((x) => x)),
        relatedIds: List<int>.from(json["related_ids"].map((x) => x)),
        stockStatus: json["stock_status"],
        hasOptions: json["has_options"],
        amsDefaultVariationId: json["ams_default_variation_id"],
        amsProductDiscountPercentage: json["ams_product_discount_percentage"],
        amsPriceToDisplay: json["ams_price_to_display"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "permalink": permalink,
        "date_created": dateCreated.toIso8601String(),
        "date_created_gmt": dateCreatedGmt.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt.toIso8601String(),
        "type": type,
        "status": status,
        "featured": featured,
        "catalog_visibility": catalogVisibility,
        "description": description,
        "short_description": shortDescription,
        "sku": sku,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "on_sale": onSale,
        "purchasable": purchasable,
        "total_sales": totalSales,
        "virtual": virtual,
        "downloadable": downloadable,
        "download_limit": downloadLimit,
        "download_expiry": downloadExpiry,
        "external_url": externalUrl,
        "button_text": buttonText,
        "tax_status": taxStatus,
        "tax_class": taxClass,
        "manage_stock": manageStock,
        "backorders": backorders,
        "backorders_allowed": backordersAllowed,
        "sold_individually": soldIndividually,
        "weight": weight,
        "dimensions": dimensions.toJson(),
        "shipping_required": shippingRequired,
        "shipping_taxable": shippingTaxable,
        "shipping_class": shippingClass,
        "shipping_class_id": shippingClassId,
        "reviews_allowed": reviewsAllowed,
        "average_rating": averageRating,
        "rating_count": ratingCount,
        "parent_id": parentId,
        "purchase_note": purchaseNote,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
        "variations": List<dynamic>.from(variations.map((x) => x)),
        "related_ids": List<dynamic>.from(relatedIds.map((x) => x)),
        "stock_status": stockStatus,
        "has_options": hasOptions,
        "ams_default_variation_id": amsDefaultVariationId,
        "ams_product_discount_percentage": amsProductDiscountPercentage,
        "ams_price_to_display": amsPriceToDisplay,
    };
}

class Attribute {
    Attribute({
        required this.id,
        required this.name,
        required this.position,
        required this.visible,
        required this.variation,
        required this.options,
        required this.slug,
        required this.optionsSlugs,
        required this.terms,
    });

    int id;
    String name;
    int position;
    bool visible;
    bool variation;
    List<String> options;
    String slug;
    List<String> optionsSlugs;
    List<Term> terms;

    factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json["id"],
        name: json["name"],
        position: json["position"],
        visible: json["visible"],
        variation: json["variation"],
        options: List<String>.from(json["options"].map((x) => x)),
        slug: json["slug"],
        optionsSlugs: List<String>.from(json["options_slugs"].map((x) => x)),
        terms: List<Term>.from(json["terms"].map((x) => Term.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "position": position,
        "visible": visible,
        "variation": variation,
        "options": List<dynamic>.from(options.map((x) => x)),
        "slug": slug,
        "options_slugs": List<dynamic>.from(optionsSlugs.map((x) => x)),
        "terms": List<dynamic>.from(terms.map((x) => x.toJson())),
    };
}

class Term {
    Term({
        required this.termId,
        required this.name,
        required this.slug,
        required this.termGroup,
        required this.termTaxonomyId,
        required this.taxonomy,
        required this.description,
        required this.parent,
        required this.count,
        required this.filter,
    });

    int termId;
    String name;
    String slug;
    int termGroup;
    int termTaxonomyId;
    String taxonomy;
    String description;
    int parent;
    int count;
    String filter;

    factory Term.fromJson(Map<String, dynamic> json) => Term(
        termId: json["term_id"],
        name: json["name"],
        slug: json["slug"],
        termGroup: json["term_group"],
        termTaxonomyId: json["term_taxonomy_id"],
        taxonomy: json["taxonomy"],
        description: json["description"],
        parent: json["parent"],
        count: json["count"],
        filter: json["filter"],
    );

    Map<String, dynamic> toJson() => {
        "term_id": termId,
        "name": name,
        "slug": slug,
        "term_group": termGroup,
        "term_taxonomy_id": termTaxonomyId,
        "taxonomy": taxonomy,
        "description": description,
        "parent": parent,
        "count": count,
        "filter": filter,
    };
}

class Category {
    Category({
        required this.id,
        required this.name,
        required this.slug,
    });

    int id;
    String name;
    String slug;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
    };
}

class Dimensions {
    Dimensions({
        required this.length,
        required this.width,
        required this.height,
    });

    String length;
    String width;
    String height;

    factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        length: json["length"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "length": length,
        "width": width,
        "height": height,
    };
}

class ImageU {
    ImageU({
        required this.id,
        required this.dateCreated,
        required this.dateCreatedGmt,
        required this.dateModified,
        required this.dateModifiedGmt,
        required this.src,
        required this.name,
        required this.alt,
        required this.thumbnail,
        required this.medium,
    });

    int id;
    DateTime dateCreated;
    DateTime dateCreatedGmt;
    DateTime dateModified;
    DateTime dateModifiedGmt;
    String src;
    String name;
    String alt;
    String thumbnail;
    String medium;

    factory ImageU.fromJson(Map<String, dynamic> json) => ImageU(
        id: json["id"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        dateModified: DateTime.parse(json["date_modified"]),
        dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
        src: json["src"],
        name: json["name"],
        alt: json["alt"],
        thumbnail: json["thumbnail"],
        medium: json["medium"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated.toIso8601String(),
        "date_created_gmt": dateCreatedGmt.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt.toIso8601String(),
        "src": src,
        "name": name,
        "alt": alt,
        "thumbnail": thumbnail,
        "medium": medium,
    };
}