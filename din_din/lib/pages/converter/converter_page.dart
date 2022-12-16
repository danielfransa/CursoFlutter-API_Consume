import 'package:flutter/material.dart';
import 'package:din_din/model/currency.dart';
import 'package:din_din/pages/currencies/currencies_page.dart';
import 'package:din_din/pages/converter/widgets/text_field_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class QueryPage extends StatefulWidget {
  const QueryPage({required this.currencies});
  final List<Currency> currencies;

  @override
  _QueryPageState createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {
  TextEditingController realController = TextEditingController();
  TextEditingController dolarController = TextEditingController();
  TextEditingController euroController = TextEditingController();
  TextEditingController bitCoinController = TextEditingController();

  //TODO: Criar as funçoes para fazer a conversao das moedas

  /*
    Abaixo segue um exemplo de conversao do Real para as demais moedas;
    Note que no momento esta pagina nao esta recebendo uma massa de dados entao ocorrerao varios
    nulls; apos criar o carregamento de dados na pagina; crie as demais funcoes.
  */

  _converterReal(String quantiaEmReais) {
    if (quantiaEmReais.isEmpty) return;
    var reais = double.parse(quantiaEmReais);
    dolarController.text =
        (reais / widget.currencies[0].buy).toStringAsFixed(2);
    euroController.text = (reais / widget.currencies[1].buy).toStringAsFixed(2);
    bitCoinController.text =
        (reais / widget.currencies[8].buy).toStringAsFixed(6);
  }

  _converterDolar(String quantiaEmDolar) {
    if (quantiaEmDolar.isEmpty) return;
    var dolar = double.parse(quantiaEmDolar);
    realController.text = (dolar * widget.currencies[0].buy).toStringAsFixed(2);
    euroController.text =
        ((dolar * widget.currencies[0].buy) / widget.currencies[1].buy)
            .toStringAsFixed(2);
    bitCoinController.text =
        ((dolar * widget.currencies[0].buy) / widget.currencies[8].buy)
            .toStringAsFixed(6);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 16,
            width: double.infinity,
          ),
          Icon(FontAwesomeIcons.searchDollar, color: Colors.amber, size: 100),
          SizedBox(
            height: 16,
          ),
          TextFieldWidget(
            callBack: (value) {
              _converterReal(value);
            },
            icon: FontAwesomeIcons.commentDollar,
            hint: 'Valor em Reais',
            habilitado: true,
            controller: realController,
          ),
          TextFieldWidget(
            callBack: (value) {
              _converterDolar(value);
            },
            habilitado: true,
            icon: FontAwesomeIcons.dollarSign,
            hint: 'Valor em Dolar',
            controller: dolarController,
          ),
          TextFieldWidget(
            callBack: (text) {},
            habilitado: false,
            icon: FontAwesomeIcons.euroSign,
            hint: 'Valor em Euro',
            controller: euroController,
          ),
          TextFieldWidget(
            habilitado: false,
            callBack: (text) {},
            icon: FontAwesomeIcons.bitcoin,
            hint: 'Valor em BitCoin',
            controller: bitCoinController,
          ),
        ],
      ),
    );
  }
}
