// class ProductListModel {
//   int? id;
//   String? name;
//   String? slug;
//   String? permalink;
//   String? dateCreated;
//   String? dateCreatedGmt;
//   String? dateModified;
//   String? dateModifiedGmt;
//   String? type;
//   String? status;
//   bool? featured;
//   String? catalogVisibility;
//   String? description;
//   String? shortDescription;
//   String? sku;
//   String? price;
//   String? regularPrice;
//   String? salePrice;
//   bool? onSale;
//   bool? purchasable;
//   int? totalSales;
//   bool? virtual;
//   bool? downloadable;
//   String? externalUrl;
//   String? buttonText;
//   String? taxStatus;
//   String? taxClass;
//   bool? manageStock;
//   String? backorders;
//   bool? backordersAllowed;
//   bool? backordered;
//   bool? soldIndividually;
//   String? weight;
//   Dimensions? dimensions;
//   bool? shippingRequired;
//   bool? shippingTaxable;
//   String? shippingClass;
//   int? shippingClassId;
//   bool? reviewsAllowed;
//   String? averageRating;
//   int? ratingCount;
//   int? parentId;
//   String? purchaseNote;
//   List<Categories>? categories;
//   List<Images>? images;
//   List<Attributes>? attributes;
//   List<int>? variations;
//   int? menuOrder;
//   String? priceHtml;
//   List<int>? relatedIds;
//   List<MetaData>? metaData;
//   String? stockStatus;
//   bool? hasOptions;
//   int? amsDefaultVariationId;
//   int? amsProductDiscountPercentage;
//   int? amsPriceToDisplay;
//   String? yoastHead;
//   YoastHeadJson? yoastHeadJson;
//   Links? lLinks;

//   ProductListModel(
//       {this.id,
//       this.name,
//       this.slug,
//       this.permalink,
//       this.dateCreated,
//       this.dateCreatedGmt,
//       this.dateModified,
//       this.dateModifiedGmt,
//       this.type,
//       this.status,
//       this.featured,
//       this.catalogVisibility,
//       this.description,
//       this.shortDescription,
//       this.sku,
//       this.price,
//       this.regularPrice,
//       this.salePrice,
//       this.onSale,
//       this.purchasable,
//       this.totalSales,
//       this.virtual,
//       this.downloadable,
//       this.externalUrl,
//       this.buttonText,
//       this.taxStatus,
//       this.taxClass,
//       this.manageStock,
//       this.backorders,
//       this.backordersAllowed,
//       this.backordered,
//       this.soldIndividually,
//       this.weight,
//       this.dimensions,
//       this.shippingRequired,
//       this.shippingTaxable,
//       this.shippingClass,
//       this.shippingClassId,
//       this.reviewsAllowed,
//       this.averageRating,
//       this.ratingCount,
//       this.parentId,
//       this.purchaseNote,
//       this.categories,
//       this.images,
//       this.attributes,
//       this.variations,
//       this.menuOrder,
//       this.priceHtml,
//       this.relatedIds,
//       this.metaData,
//       this.stockStatus,
//       this.hasOptions,
//       this.amsDefaultVariationId,
//       this.amsProductDiscountPercentage,
//       this.amsPriceToDisplay,
//       this.yoastHead,
//       this.yoastHeadJson,
//       this.lLinks});

//   ProductListModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     slug = json['slug'];
//     permalink = json['permalink'];
//     dateCreated = json['date_created'];
//     dateCreatedGmt = json['date_created_gmt'];
//     dateModified = json['date_modified'];
//     dateModifiedGmt = json['date_modified_gmt'];
//     type = json['type'];
//     status = json['status'];
//     featured = json['featured'];
//     catalogVisibility = json['catalog_visibility'];
//     description = json['description'];
//     shortDescription = json['short_description'];
//     sku = json['sku'];
//     price = json['price'];
//     regularPrice = json['regular_price'];
//     salePrice = json['sale_price'];
//     onSale = json['on_sale'];
//     purchasable = json['purchasable'];
//     totalSales = json['total_sales'];
//     virtual = json['virtual'];
//     downloadable = json['downloadable'];
//     externalUrl = json['external_url'];
//     buttonText = json['button_text'];
//     taxStatus = json['tax_status'];
//     taxClass = json['tax_class'];
//     manageStock = json['manage_stock'];
//     backorders = json['backorders'];
//     backordersAllowed = json['backorders_allowed'];
//     backordered = json['backordered'];
//     soldIndividually = json['sold_individually'];
//     weight = json['weight'];
//     dimensions = json['dimensions'] != null
//         ? new Dimensions.fromJson(json['dimensions'])
//         : null;
//     shippingRequired = json['shipping_required'];
//     shippingTaxable = json['shipping_taxable'];
//     shippingClass = json['shipping_class'];
//     shippingClassId = json['shipping_class_id'];
//     reviewsAllowed = json['reviews_allowed'];
//     averageRating = json['average_rating'];
//     ratingCount = json['rating_count'];
//     parentId = json['parent_id'];
//     purchaseNote = json['purchase_note'];
//     if (json['categories'] != null) {
//       categories = <Categories>[];
//       json['categories'].forEach((v) {
//         categories!.add(new Categories.fromJson(v));
//       });
//     }
//     if (json['images'] != null) {
//       images = <Images>[];
//       json['images'].forEach((v) {
//         images!.add(new Images.fromJson(v));
//       });
//     }
//     if (json['attributes'] != null) {
//       attributes = <Attributes>[];
//       json['attributes'].forEach((v) {
//         attributes!.add(new Attributes.fromJson(v));
//       });
//     }
//     variations = json['variations'].cast<int>();
//     menuOrder = json['menu_order'];
//     priceHtml = json['price_html'];
//     relatedIds = json['related_ids'].cast<int>();
//     if (json['meta_data'] != null) {
//       metaData = <MetaData>[];
//       json['meta_data'].forEach((v) {
//         metaData!.add(new MetaData.fromJson(v));
//       });
//     }
//     stockStatus = json['stock_status'];
//     hasOptions = json['has_options'];
//     amsDefaultVariationId = json['ams_default_variation_id'];
//     amsProductDiscountPercentage = json['ams_product_discount_percentage'];
//     amsPriceToDisplay = json['ams_price_to_display'];
//     yoastHead = json['yoast_head'];
//     yoastHeadJson = json['yoast_head_json'] != null
//         ? new YoastHeadJson.fromJson(json['yoast_head_json'])
//         : null;
//     lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['slug'] = this.slug;
//     data['permalink'] = this.permalink;
//     data['date_created'] = this.dateCreated;
//     data['date_created_gmt'] = this.dateCreatedGmt;
//     data['date_modified'] = this.dateModified;
//     data['date_modified_gmt'] = this.dateModifiedGmt;
//     data['type'] = this.type;
//     data['status'] = this.status;
//     data['featured'] = this.featured;
//     data['catalog_visibility'] = this.catalogVisibility;
//     data['description'] = this.description;
//     data['short_description'] = this.shortDescription;
//     data['sku'] = this.sku;
//     data['price'] = this.price;
//     data['regular_price'] = this.regularPrice;
//     data['sale_price'] = this.salePrice;
//     data['on_sale'] = this.onSale;
//     data['purchasable'] = this.purchasable;
//     data['total_sales'] = this.totalSales;
//     data['virtual'] = this.virtual;
//     data['downloadable'] = this.downloadable;
//     data['external_url'] = this.externalUrl;
//     data['button_text'] = this.buttonText;
//     data['tax_status'] = this.taxStatus;
//     data['tax_class'] = this.taxClass;
//     data['manage_stock'] = this.manageStock;
//     data['backorders'] = this.backorders;
//     data['backorders_allowed'] = this.backordersAllowed;
//     data['backordered'] = this.backordered;
//     data['sold_individually'] = this.soldIndividually;
//     data['weight'] = this.weight;
//     if (this.dimensions != null) {
//       data['dimensions'] = this.dimensions!.toJson();
//     }
//     data['shipping_required'] = this.shippingRequired;
//     data['shipping_taxable'] = this.shippingTaxable;
//     data['shipping_class'] = this.shippingClass;
//     data['shipping_class_id'] = this.shippingClassId;
//     data['reviews_allowed'] = this.reviewsAllowed;
//     data['average_rating'] = this.averageRating;
//     data['rating_count'] = this.ratingCount;
//     data['parent_id'] = this.parentId;
//     data['purchase_note'] = this.purchaseNote;
//     if (this.categories != null) {
//       data['categories'] = this.categories!.map((v) => v.toJson()).toList();
//     }
//     if (this.images != null) {
//       data['images'] = this.images!.map((v) => v.toJson()).toList();
//     }
//     if (this.attributes != null) {
//       data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
//     }
//     data['variations'] = this.variations;
//     data['menu_order'] = this.menuOrder;
//     data['price_html'] = this.priceHtml;
//     data['related_ids'] = this.relatedIds;
//     if (this.metaData != null) {
//       data['meta_data'] = this.metaData!.map((v) => v.toJson()).toList();
//     }
//     data['stock_status'] = this.stockStatus;
//     data['has_options'] = this.hasOptions;
//     data['ams_default_variation_id'] = this.amsDefaultVariationId;
//     data['ams_product_discount_percentage'] = this.amsProductDiscountPercentage;
//     data['ams_price_to_display'] = this.amsPriceToDisplay;
//     data['yoast_head'] = this.yoastHead;
//     if (this.yoastHeadJson != null) {
//       data['yoast_head_json'] = this.yoastHeadJson!.toJson();
//     }
//     if (this.lLinks != null) {
//       data['_links'] = this.lLinks!.toJson();
//     }
//     return data;
//   }
// }

// class Dimensions {
//   String? length;
//   String? width;
//   String? height;

//   Dimensions({this.length, this.width, this.height});

//   Dimensions.fromJson(Map<String, dynamic> json) {
//     length = json['length'];
//     width = json['width'];
//     height = json['height'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['length'] = this.length;
//     data['width'] = this.width;
//     data['height'] = this.height;
//     return data;
//   }
// }

// class Categories {
//   int? id;
//   String? name;
//   String? slug;

//   Categories({this.id, this.name, this.slug});

//   Categories.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     slug = json['slug'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['slug'] = this.slug;
//     return data;
//   }
// }

// class Images {
//   int? id;
//   String? dateCreated;
//   String? dateCreatedGmt;
//   String? dateModified;
//   String? dateModifiedGmt;
//   String? src;
//   String? name;
//   String? alt;
//   String? thumbnail;
//   String? medium;

//   Images(
//       {this.id,
//       this.dateCreated,
//       this.dateCreatedGmt,
//       this.dateModified,
//       this.dateModifiedGmt,
//       this.src,
//       this.name,
//       this.alt,
//       this.thumbnail,
//       this.medium});

//   Images.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     dateCreated = json['date_created'];
//     dateCreatedGmt = json['date_created_gmt'];
//     dateModified = json['date_modified'];
//     dateModifiedGmt = json['date_modified_gmt'];
//     src = json['src'];
//     name = json['name'];
//     alt = json['alt'];
//     thumbnail = json['thumbnail'];
//     medium = json['medium'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['date_created'] = this.dateCreated;
//     data['date_created_gmt'] = this.dateCreatedGmt;
//     data['date_modified'] = this.dateModified;
//     data['date_modified_gmt'] = this.dateModifiedGmt;
//     data['src'] = this.src;
//     data['name'] = this.name;
//     data['alt'] = this.alt;
//     data['thumbnail'] = this.thumbnail;
//     data['medium'] = this.medium;
//     return data;
//   }
// }

// class Attributes {
//   int? id;
//   String? name;
//   int? position;
//   bool? visible;
//   bool? variation;
//   List<String>? options;
//   String? slug;
//   List<String>? optionsSlugs;
//   List<Terms>? terms;

//   Attributes(
//       {this.id,
//       this.name,
//       this.position,
//       this.visible,
//       this.variation,
//       this.options,
//       this.slug,
//       this.optionsSlugs,
//       this.terms});

//   Attributes.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     position = json['position'];
//     visible = json['visible'];
//     variation = json['variation'];
//     options = json['options'].cast<String>();
//     slug = json['slug'];
//     optionsSlugs = json['options_slugs'].cast<String>();
//     if (json['terms'] != null) {
//       terms = <Terms>[];
//       json['terms'].forEach((v) {
//         terms!.add(new Terms.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['position'] = this.position;
//     data['visible'] = this.visible;
//     data['variation'] = this.variation;
//     data['options'] = this.options;
//     data['slug'] = this.slug;
//     data['options_slugs'] = this.optionsSlugs;
//     if (this.terms != null) {
//       data['terms'] = this.terms!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Terms {
//   int? termId;
//   String? name;
//   String? slug;
//   int? termGroup;
//   int? termTaxonomyId;
//   String? taxonomy;
//   String? description;
//   int? parent;
//   int? count;
//   String? filter;

//   Terms(
//       {this.termId,
//       this.name,
//       this.slug,
//       this.termGroup,
//       this.termTaxonomyId,
//       this.taxonomy,
//       this.description,
//       this.parent,
//       this.count,
//       this.filter});

//   Terms.fromJson(Map<String, dynamic> json) {
//     termId = json['term_id'];
//     name = json['name'];
//     slug = json['slug'];
//     termGroup = json['term_group'];
//     termTaxonomyId = json['term_taxonomy_id'];
//     taxonomy = json['taxonomy'];
//     description = json['description'];
//     parent = json['parent'];
//     count = json['count'];
//     filter = json['filter'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['term_id'] = this.termId;
//     data['name'] = this.name;
//     data['slug'] = this.slug;
//     data['term_group'] = this.termGroup;
//     data['term_taxonomy_id'] = this.termTaxonomyId;
//     data['taxonomy'] = this.taxonomy;
//     data['description'] = this.description;
//     data['parent'] = this.parent;
//     data['count'] = this.count;
//     data['filter'] = this.filter;
//     return data;
//   }
// }

// class MetaData {
//   int? id;
//   String? key;
//   String? value;

//   MetaData({this.id, this.key, this.value});

//   MetaData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     key = json['key'];
//     value = json['value'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['key'] = this.key;
//     data['value'] = this.value;
//     return data;
//   }
// }

// class YoastHeadJson {
//   String? title;
//   Robots? robots;
//   String? canonical;
//   String? ogLocale;
//   String? ogType;
//   String? ogTitle;
//   String? ogDescription;
//   String? ogUrl;
//   String? ogSiteName;
//   List<OgImage>? ogImage;
//   String? twitterCard;
//   TwitterMisc? twitterMisc;
//   Schema? schema;

//   YoastHeadJson(
//       {this.title,
//       this.robots,
//       this.canonical,
//       this.ogLocale,
//       this.ogType,
//       this.ogTitle,
//       this.ogDescription,
//       this.ogUrl,
//       this.ogSiteName,
//       this.ogImage,
//       this.twitterCard,
//       this.twitterMisc,
//       this.schema});

//   YoastHeadJson.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     robots =
//         json['robots'] != null ? new Robots.fromJson(json['robots']) : null;
//     canonical = json['canonical'];
//     ogLocale = json['og_locale'];
//     ogType = json['og_type'];
//     ogTitle = json['og_title'];
//     ogDescription = json['og_description'];
//     ogUrl = json['og_url'];
//     ogSiteName = json['og_site_name'];
//     if (json['og_image'] != null) {
//       ogImage = <OgImage>[];
//       json['og_image'].forEach((v) {
//         ogImage!.add(new OgImage.fromJson(v));
//       });
//     }
//     twitterCard = json['twitter_card'];
//     twitterMisc = json['twitter_misc'] != null
//         ? new TwitterMisc.fromJson(json['twitter_misc'])
//         : null;
//     schema =
//         json['schema'] != null ? new Schema.fromJson(json['schema']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     if (this.robots != null) {
//       data['robots'] = this.robots!.toJson();
//     }
//     data['canonical'] = this.canonical;
//     data['og_locale'] = this.ogLocale;
//     data['og_type'] = this.ogType;
//     data['og_title'] = this.ogTitle;
//     data['og_description'] = this.ogDescription;
//     data['og_url'] = this.ogUrl;
//     data['og_site_name'] = this.ogSiteName;
//     if (this.ogImage != null) {
//       data['og_image'] = this.ogImage!.map((v) => v.toJson()).toList();
//     }
//     data['twitter_card'] = this.twitterCard;
//     if (this.twitterMisc != null) {
//       data['twitter_misc'] = this.twitterMisc!.toJson();
//     }
//     if (this.schema != null) {
//       data['schema'] = this.schema!.toJson();
//     }
//     return data;
//   }
// }

// class Robots {
//   String? index;
//   String? follow;
//   String? maxSnippet;
//   String? maxImagePreview;
//   String? maxVideoPreview;

//   Robots(
//       {this.index,
//       this.follow,
//       this.maxSnippet,
//       this.maxImagePreview,
//       this.maxVideoPreview});

//   Robots.fromJson(Map<String, dynamic> json) {
//     index = json['index'];
//     follow = json['follow'];
//     maxSnippet = json['max-snippet'];
//     maxImagePreview = json['max-image-preview'];
//     maxVideoPreview = json['max-video-preview'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['index'] = this.index;
//     data['follow'] = this.follow;
//     data['max-snippet'] = this.maxSnippet;
//     data['max-image-preview'] = this.maxImagePreview;
//     data['max-video-preview'] = this.maxVideoPreview;
//     return data;
//   }
// }

// class OgImage {
//   int? width;
//   int? height;
//   String? url;
//   String? type;

//   OgImage({this.width, this.height, this.url, this.type});

//   OgImage.fromJson(Map<String, dynamic> json) {
//     width = json['width'];
//     height = json['height'];
//     url = json['url'];
//     type = json['type'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['width'] = this.width;
//     data['height'] = this.height;
//     data['url'] = this.url;
//     data['type'] = this.type;
//     return data;
//   }
// }

// class TwitterMisc {
//   String? estReadingTime;

//   TwitterMisc({this.estReadingTime});

//   TwitterMisc.fromJson(Map<String, dynamic> json) {
//     estReadingTime = json['Est. reading time'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Est. reading time'] = this.estReadingTime;
//     return data;
//   }
// }

// class Schema {
//   String? context;
//   List<Graph>? graph;

//   Schema({this.context, this.graph});

//   Schema.fromJson(Map<String, dynamic> json) {
//     context = json['@context'];
//     if (json['@graph'] != null) {
//       graph = <Graph>[];
//       json['@graph'].forEach((v) {
//         graph!.add(new Graph.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['@context'] = this.context;
//     if (this.graph != null) {
//       data['@graph'] = this.graph!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Graph {
//   String? type;
//   String? id;
//   String? url;
//   String? name;
//   IsPartOf? isPartOf;
//   String? datePublished;
//   String? dateModified;
//   IsPartOf? breadcrumb;
//   String? inLanguage;
//   List<PotentialAction>? potentialAction;
//   List<ItemListElement>? itemListElement;
//   String? description;

//   Graph(
//       {this.type,
//       this.id,
//       this.url,
//       this.name,
//       this.isPartOf,
//       this.datePublished,
//       this.dateModified,
//       this.breadcrumb,
//       this.inLanguage,
//       this.potentialAction,
//       this.itemListElement,
//       this.description});

//   Graph.fromJson(Map<String, dynamic> json) {
//     type = json['@type'];
//     id = json['@id'];
//     url = json['url'];
//     name = json['name'];
//     isPartOf = json['isPartOf'] != null
//         ? new IsPartOf.fromJson(json['isPartOf'])
//         : null;
//     datePublished = json['datePublished'];
//     dateModified = json['dateModified'];
//     breadcrumb = json['breadcrumb'] != null
//         ? new IsPartOf.fromJson(json['breadcrumb'])
//         : null;
//     inLanguage = json['inLanguage'];
//     if (json['potentialAction'] != null) {
//       potentialAction = <PotentialAction>[];
//       json['potentialAction'].forEach((v) {
//         potentialAction!.add(new PotentialAction.fromJson(v));
//       });
//     }
//     if (json['itemListElement'] != null) {
//       itemListElement = <ItemListElement>[];
//       json['itemListElement'].forEach((v) {
//         itemListElement!.add(new ItemListElement.fromJson(v));
//       });
//     }
//     description = json['description'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['@type'] = this.type;
//     data['@id'] = this.id;
//     data['url'] = this.url;
//     data['name'] = this.name;
//     if (this.isPartOf != null) {
//       data['isPartOf'] = this.isPartOf!.toJson();
//     }
//     data['datePublished'] = this.datePublished;
//     data['dateModified'] = this.dateModified;
//     if (this.breadcrumb != null) {
//       data['breadcrumb'] = this.breadcrumb!.toJson();
//     }
//     data['inLanguage'] = this.inLanguage;
//     if (this.potentialAction != null) {
//       data['potentialAction'] =
//           this.potentialAction!.map((v) => v.toJson()).toList();
//     }
//     if (this.itemListElement != null) {
//       data['itemListElement'] =
//           this.itemListElement!.map((v) => v.toJson()).toList();
//     }
//     data['description'] = this.description;
//     return data;
//   }
// }

// class IsPartOf {
//   String? id;

//   IsPartOf({this.id});

//   IsPartOf.fromJson(Map<String, dynamic> json) {
//     id = json['@id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['@id'] = this.id;
//     return data;
//   }
// }

// class PotentialAction {
//   String? type;
//   List<String>? target;
//   String? queryInput;

//   PotentialAction({this.type, this.target, this.queryInput});

//   PotentialAction.fromJson(Map<String, dynamic> json) {
//     type = json['@type'];
//     target = json['target'].cast<String>();
//     queryInput = json['query-input'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['@type'] = this.type;
//     data['target'] = this.target;
//     data['query-input'] = this.queryInput;
//     return data;
//   }
// }

// class ItemListElement {
//   String? type;
//   int? position;
//   String? name;
//   String? item;

//   ItemListElement({this.type, this.position, this.name, this.item});

//   ItemListElement.fromJson(Map<String, dynamic> json) {
//     type = json['@type'];
//     position = json['position'];
//     name = json['name'];
//     item = json['item'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['@type'] = this.type;
//     data['position'] = this.position;
//     data['name'] = this.name;
//     data['item'] = this.item;
//     return data;
//   }
// }

// class Links {
//   List<Self>? self;
//   List<Collection>? collection;

//   Links({this.self, this.collection});

//   Links.fromJson(Map<String, dynamic> json) {
//     if (json['self'] != null) {
//       self = <Self>[];
//       json['self'].forEach((v) {
//         self!.add(new Self.fromJson(v));
//       });
//     }
//     if (json['collection'] != null) {
//       collection = <Collection>[];
//       json['collection'].forEach((v) {
//         collection!.add(new Collection.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.self != null) {
//       data['self'] = this.self!.map((v) => v.toJson()).toList();
//     }
//     if (this.collection != null) {
//       data['collection'] = this.collection!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Self {
//   String? href;

//   Self({this.href});

//   Self.fromJson(Map<String, dynamic> json) {
//     href = json['href'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['href'] = this.href;
//     return data;
//   }
// }

// class Collection {
//   String? href;

//   Collection({this.href});

//   Collection.fromJson(Map<String, dynamic> json) {
//     href = json['href'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['href'] = this.href;
//     return data;
//   }
// }


import 'dart:convert';

List<ProductListModel> productListModelFromJson(String str) => List<ProductListModel>.from(json.decode(str).map((x) => ProductListModel.fromJson(x)));

String productListModelToJson(List<ProductListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductListModel {
    ProductListModel({
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
        this.dateOnSaleFrom,
        this.dateOnSaleFromGmt,
        this.dateOnSaleTo,
        this.dateOnSaleToGmt,
        required this.onSale,
        required this.purchasable,
        required this.totalSales,
        required this.virtual,
        required this.downloadable,
        required this.downloads,
        required this.downloadLimit,
        required this.downloadExpiry,
        required this.externalUrl,
        required this.buttonText,
        required this.taxStatus,
        required this.taxClass,
        required this.manageStock,
        this.stockQuantity,
        required this.backorders,
        required this.backordersAllowed,
        required this.backordered,
        this.lowStockAmount,
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
        required this.upsellIds,
        required this.crossSellIds,
        required this.parentId,
        required this.purchaseNote,
        required this.categories,
        required this.tags,
        required this.images,
        required this.attributes,
        required this.defaultAttributes,
        required this.variations,
        required this.groupedProducts,
        required this.menuOrder,
        required this.priceHtml,
        required this.relatedIds,
        required this.metaData,
        required this.stockStatus,
        required this.hasOptions,
        required this.amsDefaultVariationId,
        required this.amsProductPointsReward,
        required this.amsProductDiscountPercentage,
        required this.amsPriceToDisplay,
        required this.amsAcf,
        required this.yoastHead,
        required this.yoastHeadJson,
        required this.links,
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
    dynamic dateOnSaleFrom;
    dynamic dateOnSaleFromGmt;
    dynamic dateOnSaleTo;
    dynamic dateOnSaleToGmt;
    bool onSale;
    bool purchasable;
    int totalSales;
    bool virtual;
    bool downloadable;
    List<dynamic> downloads;
    int downloadLimit;
    int downloadExpiry;
    String externalUrl;
    String buttonText;
    String taxStatus;
    String taxClass;
    bool manageStock;
    dynamic stockQuantity;
    String backorders;
    bool backordersAllowed;
    bool backordered;
    dynamic lowStockAmount;
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
    List<dynamic> upsellIds;
    List<dynamic> crossSellIds;
    int parentId;
    String purchaseNote;
    List<Category> categories;
    List<dynamic> tags;
    List<Imageurl> images;
    List<Attribute> attributes;
    List<dynamic> defaultAttributes;
    List<int> variations;
    List<dynamic> groupedProducts;
    int menuOrder;
    String priceHtml;
    List<int> relatedIds;
    List<MetaDatum> metaData;
    String stockStatus;
    bool hasOptions;
    int amsDefaultVariationId;
    List<dynamic> amsProductPointsReward;
    int amsProductDiscountPercentage;
    int amsPriceToDisplay;
    List<dynamic> amsAcf;
    String yoastHead;
    YoastHeadJson yoastHeadJson;
    Links links;

    factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
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
        dateOnSaleFrom: json["date_on_sale_from"],
        dateOnSaleFromGmt: json["date_on_sale_from_gmt"],
        dateOnSaleTo: json["date_on_sale_to"],
        dateOnSaleToGmt: json["date_on_sale_to_gmt"],
        onSale: json["on_sale"],
        purchasable: json["purchasable"],
        totalSales: json["total_sales"],
        virtual: json["virtual"],
        downloadable: json["downloadable"],
        downloads: List<dynamic>.from(json["downloads"].map((x) => x)),
        downloadLimit: json["download_limit"],
        downloadExpiry: json["download_expiry"],
        externalUrl: json["external_url"],
        buttonText: json["button_text"],
        taxStatus: json["tax_status"],
        taxClass: json["tax_class"],
        manageStock: json["manage_stock"],
        stockQuantity: json["stock_quantity"],
        backorders: json["backorders"],
        backordersAllowed: json["backorders_allowed"],
        backordered: json["backordered"],
        lowStockAmount: json["low_stock_amount"],
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
        upsellIds: List<dynamic>.from(json["upsell_ids"].map((x) => x)),
        crossSellIds: List<dynamic>.from(json["cross_sell_ids"].map((x) => x)),
        parentId: json["parent_id"],
        purchaseNote: json["purchase_note"],
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        images: List<Imageurl>.from(json["images"].map((x) => Imageurl.fromJson(x))),
        attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
        defaultAttributes: List<dynamic>.from(json["default_attributes"].map((x) => x)),
        variations: List<int>.from(json["variations"].map((x) => x)),
        groupedProducts: List<dynamic>.from(json["grouped_products"].map((x) => x)),
        menuOrder: json["menu_order"],
        priceHtml: json["price_html"],
        relatedIds: List<int>.from(json["related_ids"].map((x) => x)),
        metaData: List<MetaDatum>.from(json["meta_data"].map((x) => MetaDatum.fromJson(x))),
        stockStatus: json["stock_status"],
        hasOptions: json["has_options"],
        amsDefaultVariationId: json["ams_default_variation_id"],
        amsProductPointsReward: List<dynamic>.from(json["ams_product_points_reward"].map((x) => x)),
        amsProductDiscountPercentage: json["ams_product_discount_percentage"],
        amsPriceToDisplay: json["ams_price_to_display"],
        amsAcf: List<dynamic>.from(json["ams_acf"].map((x) => x)),
        yoastHead: json["yoast_head"],
        yoastHeadJson: YoastHeadJson.fromJson(json["yoast_head_json"]),
        links: Links.fromJson(json["_links"]),
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
        "date_on_sale_from": dateOnSaleFrom,
        "date_on_sale_from_gmt": dateOnSaleFromGmt,
        "date_on_sale_to": dateOnSaleTo,
        "date_on_sale_to_gmt": dateOnSaleToGmt,
        "on_sale": onSale,
        "purchasable": purchasable,
        "total_sales": totalSales,
        "virtual": virtual,
        "downloadable": downloadable,
        "downloads": List<dynamic>.from(downloads.map((x) => x)),
        "download_limit": downloadLimit,
        "download_expiry": downloadExpiry,
        "external_url": externalUrl,
        "button_text": buttonText,
        "tax_status": taxStatus,
        "tax_class": taxClass,
        "manage_stock": manageStock,
        "stock_quantity": stockQuantity,
        "backorders": backorders,
        "backorders_allowed": backordersAllowed,
        "backordered": backordered,
        "low_stock_amount": lowStockAmount,
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
        "upsell_ids": List<dynamic>.from(upsellIds.map((x) => x)),
        "cross_sell_ids": List<dynamic>.from(crossSellIds.map((x) => x)),
        "parent_id": parentId,
        "purchase_note": purchaseNote,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
        "default_attributes": List<dynamic>.from(defaultAttributes.map((x) => x)),
        "variations": List<dynamic>.from(variations.map((x) => x)),
        "grouped_products": List<dynamic>.from(groupedProducts.map((x) => x)),
        "menu_order": menuOrder,
        "price_html": priceHtml,
        "related_ids": List<dynamic>.from(relatedIds.map((x) => x)),
        "meta_data": List<dynamic>.from(metaData.map((x) => x.toJson())),
        "stock_status": stockStatus,
        "has_options": hasOptions,
        "ams_default_variation_id": amsDefaultVariationId,
        "ams_product_points_reward": List<dynamic>.from(amsProductPointsReward.map((x) => x)),
        "ams_product_discount_percentage": amsProductDiscountPercentage,
        "ams_price_to_display": amsPriceToDisplay,
        "ams_acf": List<dynamic>.from(amsAcf.map((x) => x)),
        "yoast_head": yoastHead,
        "yoast_head_json": yoastHeadJson.toJson(),
        "_links": links.toJson(),
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

class Imageurl {
    Imageurl({
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

    factory Imageurl.fromJson(Map<String, dynamic> json) => Imageurl(
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

class Links {
    Links({
        required this.self,
        required this.collection,
    });

    List<Collection> self;
    List<Collection> collection;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
        collection: List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
    };
}

class Collection {
    Collection({
        required this.href,
    });

    String href;

    factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class MetaDatum {
    MetaDatum({
        required this.id,
        required this.key,
        required this.value,
    });

    int id;
    String key;
    String value;

    factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
        id: json["id"],
        key: json["key"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "value": value,
    };
}

class YoastHeadJson {
    YoastHeadJson({
        required this.title,
        required this.robots,
        required this.canonical,
        required this.ogLocale,
        required this.ogType,
        required this.ogTitle,
        required this.ogDescription,
        required this.ogUrl,
        required this.ogSiteName,
        required this.ogImage,
        required this.twitterCard,
        required this.twitterMisc,
        required this.schema,
    });

    String title;
    Robots robots;
    String canonical;
    String ogLocale;
    String ogType;
    String ogTitle;
    String ogDescription;
    String ogUrl;
    String ogSiteName;
    List<OgImage> ogImage;
    String twitterCard;
    TwitterMisc twitterMisc;
    Schema schema;

    factory YoastHeadJson.fromJson(Map<String, dynamic> json) => YoastHeadJson(
        title: json["title"],
        robots: Robots.fromJson(json["robots"]),
        canonical: json["canonical"],
        ogLocale: json["og_locale"],
        ogType: json["og_type"],
        ogTitle: json["og_title"],
        ogDescription: json["og_description"],
        ogUrl: json["og_url"],
        ogSiteName: json["og_site_name"],
        ogImage: List<OgImage>.from(json["og_image"].map((x) => OgImage.fromJson(x))),
        twitterCard: json["twitter_card"],
        twitterMisc: TwitterMisc.fromJson(json["twitter_misc"]),
        schema: Schema.fromJson(json["schema"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "robots": robots.toJson(),
        "canonical": canonical,
        "og_locale": ogLocale,
        "og_type": ogType,
        "og_title": ogTitle,
        "og_description": ogDescription,
        "og_url": ogUrl,
        "og_site_name": ogSiteName,
        "og_image": List<dynamic>.from(ogImage.map((x) => x.toJson())),
        "twitter_card": twitterCard,
        "twitter_misc": twitterMisc.toJson(),
        "schema": schema.toJson(),
    };
}

class OgImage {
    OgImage({
        required this.width,
        required this.height,
        required this.url,
        required this.type,
    });

    int width;
    int height;
    String url;
    String type;

    factory OgImage.fromJson(Map<String, dynamic> json) => OgImage(
        width: json["width"],
        height: json["height"],
        url: json["url"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "url": url,
        "type": type,
    };
}

class Robots {
    Robots({
        required this.index,
        required this.follow,
        required this.maxSnippet,
        required this.maxImagePreview,
        required this.maxVideoPreview,
    });

    String index;
    String follow;
    String maxSnippet;
    String maxImagePreview;
    String maxVideoPreview;

    factory Robots.fromJson(Map<String, dynamic> json) => Robots(
        index: json["index"],
        follow: json["follow"],
        maxSnippet: json["max-snippet"],
        maxImagePreview: json["max-image-preview"],
        maxVideoPreview: json["max-video-preview"],
    );

    Map<String, dynamic> toJson() => {
        "index": index,
        "follow": follow,
        "max-snippet": maxSnippet,
        "max-image-preview": maxImagePreview,
        "max-video-preview": maxVideoPreview,
    };
}

class Schema {
    Schema({
        required this.context,
        required this.graph,
    });

    String context;
    List<Graph> graph;

    factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        context: json["@context"],
        graph: List<Graph>.from(json["@graph"].map((x) => Graph.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "@context": context,
        "@graph": List<dynamic>.from(graph.map((x) => x.toJson())),
    };
}

class Graph {
    Graph({
        required this.type,
        required this.id,
        this.url,
        this.name,
        this.isPartOf,
        this.datePublished,
        this.dateModified,
        this.breadcrumb,
        this.inLanguage,
        this.potentialAction,
        this.itemListElement,
        this.description,
    });

    String type;
    String id;
    String? url;
    String? name;
    Breadcrumb? isPartOf;
    DateTime? datePublished;
    DateTime? dateModified;
    Breadcrumb? breadcrumb;
    String? inLanguage;
    List<PotentialAction>? potentialAction;
    List<ItemListElement>? itemListElement;
    String? description;

    factory Graph.fromJson(Map<String, dynamic> json) => Graph(
        type: json["@type"],
        id: json["@id"],
        url: json["url"],
        name: json["name"],
        isPartOf: json["isPartOf"] == null ? null : Breadcrumb.fromJson(json["isPartOf"]),
        datePublished: json["datePublished"] == null ? null : DateTime.parse(json["datePublished"]),
        dateModified: json["dateModified"] == null ? null : DateTime.parse(json["dateModified"]),
        breadcrumb: json["breadcrumb"] == null ? null : Breadcrumb.fromJson(json["breadcrumb"]),
        inLanguage: json["inLanguage"],
        potentialAction: json["potentialAction"] == null ? [] : List<PotentialAction>.from(json["potentialAction"]!.map((x) => PotentialAction.fromJson(x))),
        itemListElement: json["itemListElement"] == null ? [] : List<ItemListElement>.from(json["itemListElement"]!.map((x) => ItemListElement.fromJson(x))),
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "@type": type,
        "@id": id,
        "url": url,
        "name": name,
        "isPartOf": isPartOf?.toJson(),
        "datePublished": datePublished?.toIso8601String(),
        "dateModified": dateModified?.toIso8601String(),
        "breadcrumb": breadcrumb?.toJson(),
        "inLanguage": inLanguage,
        "potentialAction": potentialAction == null ? [] : List<dynamic>.from(potentialAction!.map((x) => x.toJson())),
        "itemListElement": itemListElement == null ? [] : List<dynamic>.from(itemListElement!.map((x) => x.toJson())),
        "description": description,
    };
}

class Breadcrumb {
    Breadcrumb({
        required this.id,
    });

    String id;

    factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
        id: json["@id"],
    );

    Map<String, dynamic> toJson() => {
        "@id": id,
    };
}

class ItemListElement {
    ItemListElement({
        required this.type,
        required this.position,
        required this.name,
        this.item,
    });

    String type;
    int position;
    String name;
    String? item;

    factory ItemListElement.fromJson(Map<String, dynamic> json) => ItemListElement(
        type: json["@type"],
        position: json["position"],
        name: json["name"],
        item: json["item"],
    );

    Map<String, dynamic> toJson() => {
        "@type": type,
        "position": position,
        "name": name,
        "item": item,
    };
}

class PotentialAction {
    PotentialAction({
        required this.type,
        required this.target,
        this.queryInput,
    });

    String type;
    dynamic target;
    String? queryInput;

    factory PotentialAction.fromJson(Map<String, dynamic> json) => PotentialAction(
        type: json["@type"],
        target: json["target"],
        queryInput: json["query-input"],
    );

    Map<String, dynamic> toJson() => {
        "@type": type,
        "target": target,
        "query-input": queryInput,
    };
}

class TargetClass {
    TargetClass({
        required this.type,
        required this.urlTemplate,
    });

    String type;
    String urlTemplate;

    factory TargetClass.fromJson(Map<String, dynamic> json) => TargetClass(
        type: json["@type"],
        urlTemplate: json["urlTemplate"],
    );

    Map<String, dynamic> toJson() => {
        "@type": type,
        "urlTemplate": urlTemplate,
    };
}

class TwitterMisc {
    TwitterMisc({
        required this.estReadingTime,
    });

    String estReadingTime;

    factory TwitterMisc.fromJson(Map<String, dynamic> json) => TwitterMisc(
        estReadingTime: json["Est. reading time"],
    );

    Map<String, dynamic> toJson() => {
        "Est. reading time": estReadingTime,
    };
}
