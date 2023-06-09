import 'package:article_hub/features/home/data/model/author_model.dart';
import 'package:get/get.dart';

class Article {
  final String title;
  final String slug;
  final Author author;
  final DateTime createdAt;
  final String description;
  final String body;
  final List tags;
  final bool isFavorited;

  Article({
    required this.title,
    required this.slug,
    required this.author,
    required this.createdAt,
    required this.description,
    required this.body,
    required this.tags,
    required this.isFavorited,
  });
}
