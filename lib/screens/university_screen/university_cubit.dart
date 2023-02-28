import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

import 'package:equatable/equatable.dart';

import '../../models/university_model.dart';
part 'university_state.dart';

class UniversityCubit extends Cubit<UniversityState> {
  UniversityCubit() : super(UniversityInitial());

  getUniversityData(String country, List<UniversityModel> universities) async {
    var url = 'http://universities.hipolabs.com/search?country=$country';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      jsonResponse.forEach((data) {
        universities.add(UniversityModel(
          name: data['name'],
          country: data['country'],
        ));
      });
    }
  }

  loadData(country, universities) async {
    try {
      emit(const UniversityStateProgress(true));
      await getUniversityData(country, universities);
      emit(const UniversityStateProgress(false));
    } on SocketException {
      emit(const UniversityStateError(true));
    }
  }
}
