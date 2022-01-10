class UserModel{
  String? uid;
  String? name;
  String? phone;
  String? email;

  UserModel({this.uid, this.name,
      this.phone, this.email});
  //get
  factory UserModel.fromMap(map){
    return UserModel(
      uid:  map['uid'],
      name:  map['name'],
      phone:  map['phone'],
      email:  map['email']
    );
  }
  // post
  Map<String, dynamic> toMap(){
    return {
      'uid':uid,
      'name':name,
      'phone':phone,
      'email':email,
    };
  }
}