import 'package:din_din/model/currency.dart';
import 'package:flutter/material.dart';

class ExibicaoMoedaWigted extends StatelessWidget {
  const ExibicaoMoedaWigted(this.currency, {super.key});

  final Currency currency;

  static var styleFont18Ambar =
      const TextStyle(color: Colors.amberAccent, fontSize: 18);
  static var styleFont24AmbarWeight900 =
      const TextStyle(color: Colors.amber, fontWeight: FontWeight.w900);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: '\$',
            style: styleFont24AmbarWeight900,
            children: [
              TextSpan(
                text: ' - ${currency.name}',
                style: styleFont18Ambar,
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'Venda ',
            style: const TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),
            children: [
              TextSpan(
                text: ' - R\$ ${currency.sell}',
                style: styleFont18Ambar,
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'Compra ',
            style: styleFont24AmbarWeight900,
            children: [
              TextSpan(
                text: ' - R\$ ${currency.buy}',
                style: styleFont18Ambar,
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'Variação ',
            style: styleFont24AmbarWeight900,
            children: [
              TextSpan(
                text: ' - R\$ ${currency.variation}',
                style: styleFont18Ambar,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
