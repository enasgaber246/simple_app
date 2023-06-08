class HomeResponse {
  HomeResponse({
    this.categories,
    this.banners,
    this.settings,
    this.bestSellers,
    this.newArrivals,
  });

  HomeResponse.fromJson(dynamic json) {
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    if (json['banners'] != null) {
      banners = [];
      json['banners'].forEach((v) {
        banners?.add(Banners.fromJson(v));
      });
    }
    settings =
        json['settings'] != null ? Settings.fromJson(json['settings']) : null;
    if (json['best_sellers'] != null) {
      bestSellers = [];
      json['best_sellers'].forEach((v) {
        bestSellers?.add(ProductModel.fromJson(v));
      });
    }
    if (json['new_arrivals'] != null) {
      newArrivals = [];
      json['new_arrivals'].forEach((v) {
        newArrivals?.add(ProductModel.fromJson(v));
      });
    }
  }

  List<Categories>? categories;
  List<Banners>? banners;
  Settings? settings;
  List<ProductModel>? bestSellers;
  List<ProductModel>? newArrivals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (banners != null) {
      map['banners'] = banners?.map((v) => v.toJson()).toList();
    }
    if (settings != null) {
      map['settings'] = settings?.toJson();
    }
    if (bestSellers != null) {
      map['best_sellers'] = bestSellers?.map((v) => v.toJson()).toList();
    }
    if (newArrivals != null) {
      map['new_arrivals'] = newArrivals?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Categories {
  Categories({
    this.id,
    this.name,
    this.orderShow,
    this.image,
    this.slug,
    this.parent,
    this.allChildren,
  });

  Categories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    orderShow = json['order_show'];
    image = json['image'];
    slug = json['slug'];
    try {
      parent = json['parent'] != null
          ? CategoriesChildren.fromJson(json['parent'])
          : null;
    } catch (e) {}
    if (json['all_children'] != null) {
      allChildren = [];
      json['all_children'].forEach((v) {
        allChildren?.add(CategoriesChildren.fromJson(v));
      });
    }
  }

  num? id;
  String? name;
  num? orderShow;
  String? image;
  String? slug;
  CategoriesChildren? parent;
  List<CategoriesChildren>? allChildren;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['order_show'] = orderShow;
    map['image'] = image;
    map['slug'] = slug;
    map['parent'] = parent;
    if (allChildren != null) {
      map['all_children'] = allChildren?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CategoriesChildren {
  CategoriesChildren({
    this.id,
    this.image,
    this.parentId,
    this.show,
    this.orderShow,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
    this.name,
    this.slug,
    this.children,
    this.translations,
  });

  CategoriesChildren.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    parentId = json['parent_id'];
    show = json['show'];
    orderShow = json['order_show'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagePath = json['image_path'];
    name = json['name'];
    slug = json['slug'];
    if (json['children'] != null) {
      children = [];
      json['children'].forEach((v) {
        children?.add(CategoriesChildren.fromJson(v));
      });
    }
    if (json['translations'] != null) {
      translations = [];
      json['translations'].forEach((v) {
        translations?.add(Translations.fromJson(v));
      });
    }
  }

  num? id;
  String? image;
  num? parentId;
  String? show;
  num? orderShow;
  String? createdAt;
  String? updatedAt;
  String? imagePath;
  String? name;
  String? slug;
  List<CategoriesChildren>? children;
  List<Translations>? translations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['parent_id'] = parentId;
    map['show'] = show;
    map['order_show'] = orderShow;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['image_path'] = imagePath;
    map['name'] = name;
    map['slug'] = slug;
    if (children != null) {
      map['children'] = children?.map((v) => v.toJson()).toList();
    }
    if (translations != null) {
      map['translations'] = translations?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Banners {
  Banners({
    this.text,
    this.image,
  });

  Banners.fromJson(dynamic json) {
    text = json['text'];
    image = json['image'];
  }

  String? text;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['image'] = image;
    return map;
  }
}

class Settings {
  Settings({
    this.systemName,
    this.aboutUs,
    this.terms,
    this.logo,
    this.safeProcesses,
    this.address,
    this.email,
    this.shippingFeesInKuwait,
    this.shippingFeesOutKuwait,
    this.shippingTimeInKuwait,
    this.shippingTimeOutKuwait,
    this.company,
    this.applicationVersion,
    this.facebookLink,
    this.twitterLink,
    this.instagramLink,
    this.whatsappLink,
    this.androidLink,
    this.iosLink,
  });

  Settings.fromJson(dynamic json) {
    systemName = json['system_name'];
    aboutUs = json['about_us'];
    terms = json['terms'];
    logo = json['logo'];
    safeProcesses = json['safe_processes'];
    address = json['address'];
    email = json['email'];
    shippingFeesInKuwait = json['shipping_fees_in_kuwait'];
    shippingFeesOutKuwait = json['shipping_fees_out_kuwait'];
    shippingTimeInKuwait = json['shipping_time_in_kuwait'];
    shippingTimeOutKuwait = json['shipping_time_out_kuwait'];
    company = json['company'];
    applicationVersion = json['application_version'];
    facebookLink = json['facebook_link'];
    twitterLink = json['twitter_link'];
    instagramLink = json['instagram_link'];
    whatsappLink = json['whatsapp_link'];
    androidLink = json['android_link'];
    iosLink = json['ios_link'];
  }

  String? systemName;
  String? aboutUs;
  String? terms;
  String? logo;
  String? safeProcesses;
  String? address;
  String? email;
  num? shippingFeesInKuwait;
  num? shippingFeesOutKuwait;
  String? shippingTimeInKuwait;
  String? shippingTimeOutKuwait;
  String? company;
  String? applicationVersion;
  String? facebookLink;
  String? twitterLink;
  String? instagramLink;
  String? whatsappLink;
  String? androidLink;
  String? iosLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['system_name'] = systemName;
    map['about_us'] = aboutUs;
    map['terms'] = terms;
    map['logo'] = logo;
    map['safe_processes'] = safeProcesses;
    map['address'] = address;
    map['email'] = email;
    map['shipping_fees_in_kuwait'] = shippingFeesInKuwait;
    map['shipping_fees_out_kuwait'] = shippingFeesOutKuwait;
    map['shipping_time_in_kuwait'] = shippingTimeInKuwait;
    map['shipping_time_out_kuwait'] = shippingTimeOutKuwait;
    map['company'] = company;
    map['application_version'] = applicationVersion;
    map['facebook_link'] = facebookLink;
    map['twitter_link'] = twitterLink;
    map['instagram_link'] = instagramLink;
    map['whatsapp_link'] = whatsappLink;
    map['android_link'] = androidLink;
    map['ios_link'] = iosLink;
    return map;
  }
}

class ProductModel {
  ProductModel({
    this.name,
    this.description,
    this.category,
    this.subCategory,
    this.show,
    this.orderShow,
    this.bestSeller,
    this.newArrival,
    this.offer,
    this.stock,
    this.mainImage,
    this.otherImages,
    this.backgroundImages,
    this.sizes,
    this.attributes,
  });

  ProductModel.fromJson(dynamic json) {
    name = json['name'];
    description = json['description'];
    category = json['category'] != null
        ? CategoriesChildren.fromJson(json['category'])
        : null;
    subCategory = json['subCategory'] != null
        ? CategoriesChildren.fromJson(json['subCategory'])
        : null;
    show = json['show'];
    orderShow = json['order_show'];
    bestSeller = json['best_seller'];
    newArrival = json['new_arrival'];
    offer = json['offer'];
    stock = json['stock'];
    mainImage = json['main_image'];
    if (json['other_images'] != null) {
      otherImages = [];
      json['other_images'].forEach((v) {
        otherImages?.add(OtherImages.fromJson(v));
      });
    }
    if (json['background_images'] != null) {
      backgroundImages = [];
      json['background_images'].forEach((v) {
        backgroundImages?.add(BackgroundImages.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      sizes = [];
      json['sizes'].forEach((v) {
        sizes?.add(Sizes.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      attributes = [];
      json['attributes'].forEach((v) {
        attributes?.add(Attributes.fromJson(v));
      });
    }
  }

  String? name;
  String? description;
  CategoriesChildren? category;
  CategoriesChildren? subCategory;
  num? show;
  num? orderShow;
  num? bestSeller;
  num? newArrival;
  num? offer;
  num? stock;
  String? mainImage;
  List<OtherImages>? otherImages;
  List<BackgroundImages>? backgroundImages;
  List<Sizes>? sizes;
  List<Attributes>? attributes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['description'] = description;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (subCategory != null) {
      map['subCategory'] = subCategory?.toJson();
    }
    map['show'] = show;
    map['order_show'] = orderShow;
    map['best_seller'] = bestSeller;
    map['new_arrival'] = newArrival;
    map['offer'] = offer;
    map['stock'] = stock;
    map['main_image'] = mainImage;
    if (otherImages != null) {
      map['other_images'] = otherImages?.map((v) => v.toJson()).toList();
    }
    if (backgroundImages != null) {
      map['background_images'] =
          backgroundImages?.map((v) => v.toJson()).toList();
    }
    if (sizes != null) {
      map['sizes'] = sizes?.map((v) => v.toJson()).toList();
    }
    if (attributes != null) {
      map['attributes'] = attributes?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class OtherImages {
  OtherImages({
    this.id,
    this.productId,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
  });

  OtherImages.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagePath = json['image_path'];
  }

  num? id;
  num? productId;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? imagePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['image'] = image;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['image_path'] = imagePath;
    return map;
  }
}

class BackgroundImages {
  BackgroundImages({
    this.id,
    this.productId,
    this.image,
    this.place,
    this.createdAt,
    this.updatedAt,
    this.backgroundSample,
    this.imagePath,
  });

  BackgroundImages.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
    place = json['place'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    backgroundSample = json['background_sample'];
    imagePath = json['image_path'];
  }

  num? id;
  num? productId;
  String? image;
  dynamic place;
  String? createdAt;
  String? updatedAt;
  String? backgroundSample;
  String? imagePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['image'] = image;
    map['place'] = place;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['background_sample'] = backgroundSample;
    map['image_path'] = imagePath;
    return map;
  }
}

class Sizes {
  Sizes({
    this.id,
    this.productId,
    this.size,
    this.color,
    this.price,
    this.priceAfterDiscount,
    this.createdAt,
    this.updatedAt,
  });

  Sizes.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    size = json['size'];
    color = json['color'];
    price = json['price'];
    priceAfterDiscount = json['price_after_discount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  num? productId;
  String? size;
  String? color;
  num? price;
  num? priceAfterDiscount;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['size'] = size;
    map['color'] = color;
    map['price'] = price;
    map['price_after_discount'] = priceAfterDiscount;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class Attributes {
  Attributes({
    this.id,
    this.productId,
    this.createdAt,
    this.updatedAt,
    this.key,
    this.value,
    this.translations,
  });

  Attributes.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    key = json['key'];
    value = json['value'];
    if (json['translations'] != null) {
      translations = [];
      json['translations'].forEach((v) {
        translations?.add(Translations.fromJson(v));
      });
    }
  }

  num? id;
  num? productId;
  String? createdAt;
  String? updatedAt;
  String? key;
  String? value;
  List<Translations>? translations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['key'] = key;
    map['value'] = value;
    if (translations != null) {
      map['translations'] = translations?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Translations {
  Translations({
    this.id,
    this.categoryId,
    this.name,
    this.slug,
    this.locale,
  });

  Translations.fromJson(dynamic json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    slug = json['slug'];
    locale = json['locale'];
  }

  num? id;
  num? categoryId;
  String? name;
  String? slug;
  String? locale;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category_id'] = categoryId;
    map['name'] = name;
    map['slug'] = slug;
    map['locale'] = locale;
    return map;
  }
}
