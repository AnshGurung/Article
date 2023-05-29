import 'package:article_hub/features/home/data/model/author_model.dart';

class Article {
  final String title;
  final String slug;
  final Author author;
  final DateTime createdAt;

  Article({
    required this.title,
    required this.slug,
    required this.author,
    required this.createdAt,
  });
}
