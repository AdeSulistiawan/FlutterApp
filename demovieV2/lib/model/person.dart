class Person {
  final int id;
  final double popularity;
  final String name;
  final String profileImg;
  final String known;
  final String biography;
  final int gender;
  final String birthday;
  final String homepage;

  Person(
    this.id,
    this.popularity,
    this.name,
    this.profileImg,
    this.known,
    this.biography,
    this.gender,
    this.birthday,
    this.homepage,
  );

  Person.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"],
        name = json["name"],
        profileImg = json["profile_path"],
        known = json["known_for_department"],
        biography = json["biography"],
        gender = json["gender"],
        birthday = json["birthday"],
        homepage = json["homepage"];
}
