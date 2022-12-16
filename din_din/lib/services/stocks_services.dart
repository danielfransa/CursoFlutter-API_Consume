import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:din_din/model/stocks.dart';
import 'package:http/http.dart';

class StocksServices {
  final stocksId = [
    'IBOVESPA',
    'IFIX',
    'NASDAQ',
    'DOWJONES',
    'CAC',
    'NIKKEI',
  ];

  getData() async {
    Response response =
        await get(Uri.parse('https://api.hgbrasil.com/finance'));

    if (response.statusCode == HttpStatus.ok) {
      return response.body;
    } else {
      log('Fail: Code: ${response.statusCode}: ${response.body}');
    }
  }

  Future<List<Stocks>> getStocks() async {
    var data = await getData();
    var json = jsonDecode(data);
    var stocksMap = json['results']['stocks'];

    return stocksId.map((id) => Stocks.fromMap(stocksMap[id])).toList();
  }
}
