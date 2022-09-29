class ProfilePageUserResponseModel {
  String userId;
  String username;
  String city;
  String email;
  String fullName;

  ProfilePageUserResponseModel(
      {required this.userId,
      required this.username,
      required this.city,
      required this.email,
      required this.fullName});

  ProfilePageUserResponseModel.fromDomain(
      ProfilePageUserResponseModel domainModel)
      : userId = domainModel.userId,
        username = domainModel.username,
        fullName = domainModel.fullName,
        city = domainModel.city,
        email = domainModel.email;

  ProfilePageUserResponseModel toDomain() => ProfilePageUserResponseModel(
      userId: userId,
      city: city,
      username: username,
      fullName: fullName,
      email: email);

  factory ProfilePageUserResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfilePageUserResponseModel(
          userId: json['userId'],
          username: json['username'],
          city: json['city'],
          fullName: json['fullname'],
          email: json['email']);
}
