import 'package:din_din/model/currency.dart';
import 'package:din_din/pages/shared/widgets/exibicao_moeda_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DolarPage extends StatefulWidget {
  const DolarPage({super.key, required this.currency});

  final Currency currency;

  @override
  _DolarPageState createState() => _DolarPageState();
}

class _DolarPageState extends State<DolarPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 32,
        ),
        Icon(
          FontAwesomeIcons.dollarSign,
          size: 200,
          color: Colors.amberAccent.shade200,
        ),
        const SizedBox(
          height: 32,
        ),
        ExibicaoMoedaWigted(widget.currency),
        const SizedBox(
          width: double.infinity,
        ),
      ],
    );
  }
}
