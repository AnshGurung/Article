class Author {
  String? username;
  String? profileImgUrl;

  Author({
    required this.username,
    this.profileImgUrl,
  });
  Author.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    profileImgUrl = json['image'];
  }
}
