import 'package:flutter/material.dart';

import '../screens/university_screen/university_screen.dart';

class CountryItem extends StatelessWidget {
  final String country;
  final String imageUrl;

  CountryItem({
    required this.country,
    required this.imageUrl,
  });

  void selectCountry(BuildContext context) {
    Navigator.of(context).pushNamed(
      UniversityScreen.routeName,
      arguments: {
        'country': country,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      margin: const EdgeInsets.all(6),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: ListTile(
          leading: SizedBox(
            width: 60,
            height: 60,
            child: Image.network(imageUrl),
          ),
          title: Text(
            country,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () => selectCountry(context),
        ),
      ),
    );
  }
}
