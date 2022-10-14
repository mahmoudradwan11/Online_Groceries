class UserData
{
  String? name;
  String? email;
  String?uid;
  String? image;
  UserData({
    this.name,
    this.email,
    this.uid,
    this.image,
  });
  UserData.fromJson(Map<String,dynamic>json)
  {
    name = json['name'];
    email = json['email'];
    uid = json['uid'];
    image = json['image'];
  }
  Map<String,dynamic> toMap()
  {
    return {
      'name':name,
      'email':email,
      'uid':uid,
      'image':image,
    };
  }
}