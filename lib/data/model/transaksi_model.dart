class TransactionModel {
  int id;
  int transactionNumber;
  String date;
  String kodeCustomer;  // Adjusted property name
  String namaCustomer;
  String noTelpCustomer;

  TransactionModel({
    required this.id,
    required this.transactionNumber,
    required this.date,
    required this.kodeCustomer,
    required this.namaCustomer,
    required this.noTelpCustomer,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      transactionNumber: json['nomor_transaksi'],
      date: json['tanggal_transaksi'],
      kodeCustomer: json['kode_customer'],
      namaCustomer: json['nama_customer'],
      noTelpCustomer: json['nohp_customer'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nomor_transaksi': transactionNumber,
      'tanggal_transaksi': date,
      'kode_customer': kodeCustomer,
      'nama_customer': namaCustomer,
      'nohp_customer': noTelpCustomer,
    };
  }

}
