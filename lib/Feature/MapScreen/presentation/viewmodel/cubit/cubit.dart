import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(InitState());

  static MapCubit get(context) => BlocProvider.of(context);

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
