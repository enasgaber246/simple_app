import 'package:simple_base_project/networking/models/home_response.dart';

class CategoriesResponse {
  CategoriesResponse({
    this.data,
  });

  CategoriesResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Categories.fromJson(v));
      });
    }
  }

  List<Categories>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
