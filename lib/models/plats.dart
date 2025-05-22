import 'dart:convert';

List<Plats> platsFromMap(String str) => List<Plats>.from(json.decode(str).map((x) => Plats.fromMap(x)));

String platsToMap(List<Plats> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Plats {
    int id;
    String nom;
    String descripcio;
    String foto;
    double preu;
    bool disponible;

    Plats({
        required this.id,
        required this.nom,
        required this.descripcio,
        required this.foto,
        required this.preu,
        required this.disponible,
    });

    factory Plats.fromMap(Map<String, dynamic> json) => Plats(
        id: json["id"],
        nom: json["nom"],
        descripcio: json["descripcio"],
        foto: json["foto"],
        preu: json["preu"]?.toDouble(),
        disponible: json["disponible"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nom": nom,
        "descripcio": descripcio,
        "foto": foto,
        "preu": preu,
        "disponible": disponible,
    };
}