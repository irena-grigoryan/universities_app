import 'package:get_it/get_it.dart';

import '../screens/university_screen/university_cubit.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<UniversityCubit>(() => UniversityCubit());
}
