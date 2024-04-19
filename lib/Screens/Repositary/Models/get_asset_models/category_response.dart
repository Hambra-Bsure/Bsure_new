import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'category_response.freezed.dart';
part 'category_response.g.dart';

@freezed
class CategoryResponse with _$CategoryResponse {
  factory CategoryResponse({
    required List<Category> categories,
  }) = _CategoryResponse;

  factory CategoryResponse.fromJson(Map<String, Object?> json) =>
      _$CategoryResponseFromJson(json);
}

@freezed
class Category with _$Category {
  factory Category({
    required String name,
    required String image,
  }) = _Category;

  factory Category.fromJson(Map<String, Object?> json) =>
      _$CategoryFromJson(json);
}
