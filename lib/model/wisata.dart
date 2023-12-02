import 'dart:convert';

Wisata wisataFromJson(String str) => Wisata.fromJson(json.decode(str));

String wisataToJson(Wisata data) => json.encode(data.toJson());

class Wisata {
    final String destinasi;
    final String gambar;
    final String lokasi;

    Wisata({
        required this.destinasi,
        required this.gambar,
        required this.lokasi,
    });

    factory Wisata.fromJson(Map<String, dynamic> json) => Wisata(
        destinasi: json["destinasi"],
        gambar: json["gambar"],
        lokasi: json["lokasi"],
    );

    Map<String, dynamic> toJson() => {
        "destinasi": destinasi,
        "gambar": gambar,
        "lokasi": lokasi,
    };
}
