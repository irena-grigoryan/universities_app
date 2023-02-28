import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../models/university_model.dart';
import '../../widgets/dialogs.dart';
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
        create: (context) => di.sl()..loadData(country, universities),
        child: BlocBuilder<UniversityCubit, UniversityState>(
            builder: (context, state) {
          if (state is UniversityStateProgress) {
            if (state.isLoading) {
              return progressIndicator();
            }
          } else if (state is UniversityStateError) {
            if (state.showDialog) {
              Future.delayed(Duration.zero, () {
                Dialogs.errorDialogBox(
                  context,
                  'No internet connection',
                  'Please check your internet connection and try again',
                );
              });
            }
          }
          return Scaffold(
              body: ListView.builder(
            itemBuilder: (context, index) {
              return UniversityItem(
                universityName: universities[index].name,
                country: universities[index].country,
              );
            },
            itemCount: universities.length,
          ));
        }));
  }

  Widget progressIndicator() {
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(
        color: Colors.yellow,
      ),
    ));
  }
}
