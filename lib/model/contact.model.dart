class Contact {
  static String table = "contact";
// Les attributs de la classe Contact
  int? id;
  String nom;
  int tel;
//Constructeur
  Contact ({this.id, required this.nom, required this.tel});
// convertit un objet Map en un contact
  static Contact fromJson (Map<String, dynamic> json) {
    return Contact (
        id: json["id"], nom: json['nom'].toString(), tel: json['tel']);
  }
// convertit un contact en un objet Map
  Map<String, dynamic> toJson () {
    return {
      'id': id,
      'nom': nom,
      'tel': tel,
    };
  }
}