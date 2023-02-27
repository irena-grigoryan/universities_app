import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../models/university_model.dart';
import '../../widgets/university_item.dart';
import 'university_cubit.dart';
import 'package:universities_app/di/dependency_injection.dart' as di;

class UniversityScreen extends StatefulWidget {
  static const routeName = '/university-screen';

  const UniversityScreen({super.key});

  @override
  State<UniversityScreen> createState() => _UniversityScreenState();
}

class _UniversityScreenState extends State<UniversityScreen> {
  List<UniversityModel> universities = [];
  String? country;

  // @override
  // void initState() {
  //   getUniversityData();
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    country = args['country'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UniversityCubit>(
      create: (context) => di.sl()..loadData(),
      child: BlocConsumer<UniversityCubit, UniversityState>(
        listener: (context, state) {
          if (state is UniversityStateProgress) {
            const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
          if (state is UniversityStateLoaded) {
            getUniversityData(context);
          } else if (state is UniversityStateError) {
            //error
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: ListView.builder(
              itemBuilder: (context, index) {
                return UniversityItem(
                  universityName: universities[index].name,
                  country: universities[index].country,
                );
              },
              itemCount: universities.length,
            ),
          );
        },
      ),
    );
  }

  getUniversityData(BuildContext context) async {
    await country;
    var url = 'http://universities.hipolabs.com/search?country=$country';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        jsonResponse.forEach((data) {
          universities.add(UniversityModel(
            name: data['name'],
            country: data['country'],
          ));
        });
        setState(() {});
      }
    } on SocketException {
      setState(() {
        universities = [];
      });
    }
  }
}
