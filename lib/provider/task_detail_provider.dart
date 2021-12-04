import 'package:flutter/cupertino.dart';

class PerhitunganTask with ChangeNotifier {
  double penjumlahan({double dataPertama, double dataKedua}) {
    double hasilJumlah = 0;
    hasilJumlah = dataPertama + dataKedua;

    return hasilJumlah;
  }

  double perkalian({double dataKedua, double dataKetiga}) {
    double hasilJumlah = 0;
    hasilJumlah = dataKetiga * dataKedua;

    return hasilJumlah;
  }
}
