import 'package:flutter/material.dart';

import '../../models/country_model.dart';
import '../../widgets/country_item.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CountryItem(
            country: countryData[index].country,
            imageUrl: countryData[index].imageUrl,
          );
        },
        itemCount: countryData.length,
      ),
    );
  }
}
