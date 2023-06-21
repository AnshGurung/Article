abstract class Routes {
  Routes._();
  static const initial = Path.splashScreen;
  static const login = Path.login;
  static const home = Path.home;
  static const articleView = Path.articleView;
  static const addArticle = Path.addArticleScreen;
  static const offline = Path.offlineScreen;
  static const navigationScreen = Path.navigationScreen;
  static const addArticleScreen = Path.addArticleScreen;
  static const profileScreen = Path.profileScreen;
  static const notifications = Path.notifications;
  static const showNotification = Path.showNotification;
  static const myArticleDetail = Path.myArticleDetail;
  static const myArticleScreen = Path.myArticleScreen;
  static const favArticlesScreen = Path.favArticlesScreen;
  static const tagListScreen = Path.tagListScreen;
  static const articlesByTagScreen = Path.articlesByTagScreen;
  static const editArticleScreen = Path.editArticleScreen;
  static const editProfileScreen = Path.editProfileScreen;
  static const viewCommentScreen = Path.viewCommentScreen;
}

abstract class Path {
  Path._();
  static const splashScreen = "/splashScreen";
  static const register = "/register";
  static const login = "/login";
  static const home = "/home";
  static const articleView = "/articleView";
  static const offlineScreen = "/offlineScreen";
  static const navigationScreen = "/navigation";
  static const addArticleScreen = "/addNewArticle";
  static const profileScreen = "/profile";
  static const notifications = "/notifications";
  static const showNotification = "/showNotification";
  static const myArticleDetail = "/myArticleDetail";
  static const myArticleScreen = "/myArticles";
  static const favArticlesScreen = "/favArticleScreen";
  static const tagListScreen = "/tagListScreen";
  static const articlesByTagScreen = "/articleByTagScreen";
  static const editArticleScreen = "/editArticleScreen";
  static const editProfileScreen = "/editProfileScreen";
  static const viewCommentScreen = "/viewComments";
}
