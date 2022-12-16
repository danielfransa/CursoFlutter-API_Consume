import 'package:din_din/pages/currencies/currencies_page.dart';
import 'package:din_din/pages/stocks/stocks_pages.dart';
import 'package:din_din/services/currency_services.dart';
import 'package:din_din/pages/converter/converter_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_indicator/loading_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;
  var pages = [];
  final service = CurrencyService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DinDin'),
      ),
      body: FutureBuilder(
        future: service.getCurrencies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: SizedBox(
              height: 200,
              width: 200,
              child: LoadingIndicator(
                colors: [
                  Colors.amberAccent,
                ],
                indicatorType: Indicator.lineSpinFadeLoader,
              ),
            ));
          }

          var currencies = snapshot.data;

          return IndexedStack(index: _selectedIndex, children: [
            CurrenciesPage(currencies: currencies!),
            StocksPage(),
            QueryPage(currencies: currencies),
          ]);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amberAccent,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.dollarSign), label: 'Moedas'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.moneyBillTrendUp), label: 'Açoes'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.magnifyingGlassDollar),
              label: 'Conversor'),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
