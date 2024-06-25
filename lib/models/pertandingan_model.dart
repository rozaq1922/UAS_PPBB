class Pertandingan {
  BigInt? id;
  String? tujuan;
  String? start;
  String? end;
  int? harga;
  DateTime? jam;
  BigInt? transportasiId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Pertandingan({
    required this.id,
    required this.tujuan,
    required this.start,
    required this.end,
    required this.harga,
    required this.jam,
    required this.transportasiId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Pertandingan.fromJson(Map<String, dynamic> json) {
    return Pertandingan(
      id: BigInt.tryParse(json['id'].toString()),
      tujuan: json['tujuan'] as String?,
      start: json['start'] as String?,
      end: json['end'] as String?,
      harga: json['harga'] != null ? int.parse(json['harga'].toString()) : null,
      jam: json['jam'] != null
          ? DateTime.parse("1970-01-01 ${json['jam']}")
          : null,
      transportasiId: BigInt.tryParse(json['transportasi_id'].toString()),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  get deskripsi =>
      null; // Kamu bisa menambahkan logika untuk mengembalikan deskripsi jika diperlukan
}
