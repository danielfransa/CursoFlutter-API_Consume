import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:din_din/services/stocks_services.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../model/stocks.dart';

class StocksPage extends StatefulWidget {
  const StocksPage({super.key});

  @override
  State<StocksPage> createState() => _StocksPageState();
}

class _StocksPageState extends State<StocksPage> {
  final service = StocksServices();

  @override
  Widget build(BuildContext context) {
    //TODO: Apresentar os valores das açoes utilizando ListView ou GridView, voce pode utilizar a CurrencyPage como base ou o Grid do MovieDB.
    return Scaffold(
        body: FutureBuilder(
            initialData: [],
            future: service.getStocks(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.none ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: SizedBox(
                  height: 100,
                  width: 100,
                  child: LoadingIndicator(
                    colors: [Colors.amberAccent],
                    indicatorType: Indicator.lineSpinFadeLoader,
                  ),
                ));
              }
              if (snapshot.hasError) {
                return Container(
                  color: Colors.red,
                  child: Center(
                      child: Text(
                    snapshot.error.toString(),
                    style: const TextStyle(
                      color: Colors.white12,
                      fontSize: 36,
                    ),
                  )),
                );
              }

              var stocks = snapshot.data;

              return Padding(
                padding: const EdgeInsets.all(1.0),
                child: GridView.builder(
                  itemCount: stocks?.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                      childAspectRatio: 2 / 1.9,
                      crossAxisCount: 1),
                  itemBuilder: ((context, index) {
                    Stocks stock = stocks![index];
                    return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: const CircleAvatar(
                                    backgroundColor: Colors.amberAccent,
                                    child: Icon(FontAwesomeIcons.sackDollar)),
                                title: const Text('Nome:'),
                                subtitle: Text(stock.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: const CircleAvatar(
                                    backgroundColor: Colors.amberAccent,
                                    child: Icon(FontAwesomeIcons.locationDot)),
                                title: const Text('Localização:'),
                                subtitle: Text(stock.location,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: const CircleAvatar(
                                    backgroundColor: Colors.amberAccent,
                                    child:
                                        Icon(FontAwesomeIcons.arrowsToCircle)),
                                title: const Text('Pontos:'),
                                subtitle: Text(stock.points.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                    backgroundColor: Colors.amberAccent,
                                    child: Icon(stock.variation >= 0.0
                                        ? FontAwesomeIcons.arrowTrendUp
                                        : FontAwesomeIcons.arrowTrendDown)),
                                title: const Text('Variação:'),
                                subtitle: Text(stock.variation.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ],
                        ));
                  }),
                ),
              );
            })));
  }
}
