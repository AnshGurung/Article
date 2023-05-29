class ApiEndPoints {
  static const String baseUrl = 'https://api.realworld.io/api';
  static AuthEndPoints authEndPoints = AuthEndPoints();
  static ArticleEndPoints articleEndPoints = ArticleEndPoints();
}

class AuthEndPoints {
  final String signUpEmail = '/users';
  final String loginEmail = '/users/login';
}

class ArticleEndPoints {
  final String articles = '/articles';
}
