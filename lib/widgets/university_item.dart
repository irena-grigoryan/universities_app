import 'package:flutter/material.dart';
import 'package:universities_app/screens/university_screen/university_screen.dart';

class UniversityItem extends StatelessWidget {
  final String universityName;
  final String country;

  const UniversityItem({
    required this.universityName,
    required this.country,
  });

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
          title: Text(
            universityName,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(country),
        ),
      ),
    );
  }
}
