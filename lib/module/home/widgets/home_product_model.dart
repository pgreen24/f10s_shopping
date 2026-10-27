class ProductModel {
  ProductModel({
    this.id = 0,
    this.title = '',
    this.description = '',
    this.category = '',
    this.price = 0.0,
    this.discountPercentage = 0.0,
    this.rating = 0.0,
    this.stock = 0,
    this.tags = const [],
    this.brand = '',
    this.sku = '',
    this.weight = 0,
    this.dimensions,
    this.warrantyInformation = '',
    this.shippingInformation = '',
    this.availabilityStatus = '',
    this.reviews = const [],
    this.returnPolicy = '',
    this.minimumOrderQuantity = 0,
    this.meta,
    this.images = const [],
    this.thumbnail = '',
  });

  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final int weight;
  final DimensionsModel? dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<ReviewModel> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final MetaModel? meta;
  final List<String> images;
  final String thumbnail;

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    return ProductModel(
      id: data['id'] ?? 0,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      category: data['category'] ?? '',
      price: (data['price'] is int) ? (data['price'] as int).toDouble() : (data['price'] ?? 0.0),
      discountPercentage: (data['discountPercentage'] is int) ? (data['discountPercentage'] as int).toDouble() : (data['discountPercentage'] ?? 0.0),
      rating: (data['rating'] is int) ? (data['rating'] as int).toDouble() : (data['rating'] ?? 0.0),
      stock: data['stock'] ?? 0,
      tags: List<String>.from(data['tags'] ?? []),
      brand: data['brand'] ?? '',
      sku: data['sku'] ?? '',
      weight: data['weight'] ?? 0,
      dimensions: data['dimensions'] != null ? DimensionsModel.fromJson(data['dimensions']) : null,
      warrantyInformation: data['warrantyInformation'] ?? '',
      shippingInformation: data['shippingInformation'] ?? '',
      availabilityStatus: data['availabilityStatus'] ?? '',
      reviews: data['reviews'] != null
          ? (data['reviews'] as List).map((i) => ReviewModel.fromJson(i)).toList()
          : const [],
      returnPolicy: data['returnPolicy'] ?? '',
      minimumOrderQuantity: data['minimumOrderQuantity'] ?? 0,
      meta: data['meta'] != null ? MetaModel.fromJson(data['meta']) : null,
      images: List<String>.from(data['images'] ?? []),
      thumbnail: data['thumbnail'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'sku': sku,
      'weight': weight,
      'dimensions': dimensions?.toJson(),
      'warrantyInformation': warrantyInformation,
      'shippingInformation': shippingInformation,
      'availabilityStatus': availabilityStatus,
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'returnPolicy': returnPolicy,
      'minimumOrderQuantity': minimumOrderQuantity,
      'meta': meta?.toJson(),
      'images': images,
      'thumbnail': thumbnail,
    };
  }

  static List<ProductModel> fromJsonList(List<dynamic> data) {
    return data.map((item) {
      return ProductModel.fromJson(Map<String, dynamic>.from(item));
    }).toList();
  }
}

class DimensionsModel {
  DimensionsModel({
    this.width = 0.0,
    this.height = 0.0,
    this.depth = 0.0,
  });

  final double width;
  final double height;
  final double depth;

  factory DimensionsModel.fromJson(Map<String, dynamic> json) => DimensionsModel(
    width: (json['width'] is int) ? (json['width'] as int).toDouble() : (json['width'] ?? 0.0),
    height: (json['height'] is int) ? (json['height'] as int).toDouble() : (json['height'] ?? 0.0),
    depth: (json['depth'] is int) ? (json['depth'] as int).toDouble() : (json['depth'] ?? 0.0),
  );

  Map<String, dynamic> toJson() => {
    'width': width,
    'height': height,
    'depth': depth,
  };
}

class ReviewModel {
  ReviewModel({
    this.rating = 0,
    this.comment = '',
    this.date = '',
    this.reviewerName = '',
    this.reviewerEmail = '',
  });

  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    rating: json['rating'] ?? 0,
    comment: json['comment'] ?? '',
    date: json['date'] ?? '',
    reviewerName: json['reviewerName'] ?? '',
    reviewerEmail: json['reviewerEmail'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'rating': rating,
    'comment': comment,
    'date': date,
    'reviewerName': reviewerName,
    'reviewerEmail': reviewerEmail,
  };
}

class MetaModel {
  MetaModel({
    this.createdAt = '',
    this.updatedAt = '',
    this.barcode = '',
    this.qrCode = '',
  });

  final String createdAt;
  final String updatedAt;
  final String barcode;
  final String qrCode;

  factory MetaModel.fromJson(Map<String, dynamic> json) => MetaModel(
    createdAt: json['createdAt'] ?? '',
    updatedAt: json['updatedAt'] ?? '',
    barcode: json['barcode'] ?? '',
    qrCode: json['qrCode'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'barcode': barcode,
    'qrCode': qrCode,
  };
}
