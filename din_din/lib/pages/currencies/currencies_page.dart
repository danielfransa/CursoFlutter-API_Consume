import 'package:din_din/model/currency.dart';
import 'package:flutter/material.dart';

class CurrenciesPage extends StatelessWidget {
  const CurrenciesPage({super.key, required this.currencies});

  final List<Currency> currencies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: currencies.length,
        itemBuilder: ((context, index) {
          Currency currency = currencies[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.amberAccent,
                  child: Text(
                    currency.name.substring(0, 3),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  )),
              title: Text(currency.name),
              subtitle: Text.rich(TextSpan(children: [
                TextSpan(text: 'Buy: ', children: [
                  TextSpan(
                      text: currency.buy.toStringAsFixed(2),
                      style: const TextStyle(fontWeight: FontWeight.w600))
                ]),
                TextSpan(text: ' - Sell: ', children: [
                  TextSpan(
                      text: currency.sell.toStringAsFixed(2),
                      style: const TextStyle(fontWeight: FontWeight.w600))
                ]),
                TextSpan(text: ' - Variation: ', children: [
                  TextSpan(
                      text: currency.variation.toStringAsFixed(2),
                      style: const TextStyle(fontWeight: FontWeight.w600))
                ]),
              ])),
            ),
          );
        }));
  }
}
