class BarangModel {
  int id;
  String kodeBarang;
  String namaBarang;
  int nomorBarang;
  String hargaBarang;
  String jumlahBarang;
  String totalHargaBarang;

  BarangModel({
    required this.id,
    required this.kodeBarang,
    required this.namaBarang,
    required this.nomorBarang,
    required this.hargaBarang,
    required this.jumlahBarang,
    required this.totalHargaBarang,
  });

  factory BarangModel.fromJson(Map<String, dynamic> json) {
    return BarangModel(
      id: json['id'],
      kodeBarang: json['kode_barang'],
      namaBarang: json['nama_barang'],
      nomorBarang: json['nomor_barang'],
      hargaBarang: json['harga_barang'],
      jumlahBarang: json['jumlah_barang'],
      totalHargaBarang: json['total_harga_barang'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nama_barang': namaBarang,
      'kode_barang': kodeBarang,
      'nomor_barang': nomorBarang,
      'harga_barang': hargaBarang,
      'jumlah_barang': jumlahBarang,
      'total_harga_barang': totalHargaBarang,
    };
  }
}