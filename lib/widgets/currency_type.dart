import 'package:flutter/material.dart';

class CurrencyTypeSelected extends StatefulWidget {
  const CurrencyTypeSelected({super.key, required this.controller});
  
  final TextEditingController controller;
  @override
  State<CurrencyTypeSelected> createState() => _CurrencyTypeSelectedState();
}

enum Currency { lak, thb, usd, vnd }

class _CurrencyTypeSelectedState extends State<CurrencyTypeSelected> {
  List<Currency> _selectedCurrencies = [];

  void _onCurrencyChanged(bool? selected, Currency currency) {
    setState(() {
      if (selected == true) {
        _selectedCurrencies.add(currency);
      } else {
        _selectedCurrencies.remove(currency);
      }
    });
    widget.controller.value = TextEditingValue(text: _selectedCurrencies.join(','), selection: TextSelection.collapsed(offset: widget.controller.value.text.length));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          CheckboxListTile(
            title: const Text('LAK'),
            value: _selectedCurrencies.contains(Currency.lak),
            onChanged: (bool? selected) {
              _onCurrencyChanged(selected, Currency.lak);
            },
          ),
          CheckboxListTile(
            title: const Text('THB'),
            value: _selectedCurrencies.contains(Currency.thb),
            onChanged: (bool? selected) {
              _onCurrencyChanged(selected, Currency.thb);
            },
          ),
          CheckboxListTile(
            title: const Text('USD'),
            value: _selectedCurrencies.contains(Currency.usd),
            onChanged: (bool? selected) {
              _onCurrencyChanged(selected, Currency.usd);
            },
          ),
          CheckboxListTile(
            title: const Text('VND'),
            value: _selectedCurrencies.contains(Currency.vnd),
            onChanged: (bool? selected) {
              _onCurrencyChanged(selected, Currency.vnd);
            },
          ),
        ],
      ),
    );
  }
}
