class ProfilePageUserRequestModel {
  String username;
  String city;
  String email;
  String name;
  String surname;

  ProfilePageUserRequestModel({
    required this.username,
    required this.surname,
    required this.city,
    required this.email,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
        "username": this.username,
        "city": this.city,
        "email": this.email,
        "name": this.name,
        "surname": this.surname,
      };

  ProfilePageUserRequestModel.fromDomain(ProfilePageUserRequestModel domainModel)
      : username = domainModel.username,
        name = domainModel.name,
        surname = domainModel.surname,
        city = domainModel.city,
        email = domainModel.email;
}
