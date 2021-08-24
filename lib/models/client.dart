class Client {
  Client(
      {this.id,
      this.nom,
      this.postnom,
      this.prenom,
      this.sexe,
      this.adresse,
      this.contact,
      this.mail,
      this.username,
      this.password});

  int id;
  String nom;
  String postnom;
  String prenom;
  String sexe;
  String adresse;
  String contact;
  String mail;
  String username;
  String password;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}

Client _$ClientFromJson(Map<String, dynamic> json) {
  return Client(
      id: json['id'] as int,
      nom: json['nom'] as String,
      postnom: json['postnom'] as String,
      prenom: json['prenom'] as String,
      sexe: json['sexe'] as String,
      adresse: json['adresse'] as String,
      contact: json['contact'] as String,
      mail: json['mail'] as String,
      username: json['username'] as String,
      password: json['password'] as String);
}

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'postnom': instance.postnom,
      'prenom': instance.prenom,
      'sexe': instance.sexe,
      'adresse': instance.adresse,
      'contact': instance.contact,
      'mail': instance.mail,
      'username': instance.username,
      'password': instance.password,
    };
