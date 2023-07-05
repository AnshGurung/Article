
class GetProfileResponse {
  Profile? profile;

  GetProfileResponse({this.profile});

  GetProfileResponse.fromJson(Map<String, dynamic> json) {
    profile = json["profile"] == null ? null : Profile.fromJson(json["profile"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(profile != null) {
      data["profile"] = profile?.toJson();
    }
    return data;
  }
}

class Profile {
  String? username;
  dynamic bio;
  String? image;
  bool? following;

  Profile({this.username, this.bio, this.image, this.following});

  Profile.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    bio = json["bio"];
    image = json["image"];
    following = json["following"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["username"] = username;
    data["bio"] = bio;
    data["image"] = image;
    data["following"] = following;
    return data;
  }
}