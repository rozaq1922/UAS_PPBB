class Stadium {
  int? id;
  String? name;
  String? kode;
  int? jumlah;
  int? categoryId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Stadium({
    required this.id,
    required this.name,
    required this.kode,
    required this.jumlah,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Stadium.fromJson(Map<String, dynamic> json) {
    return Stadium(
      id: json['id'] as int?,
      name: json['name'] as String?,
      kode: json['kode'] as String?,
      jumlah: json['jumlah'] as int?,
      categoryId: json['category_id'] as int?,
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
