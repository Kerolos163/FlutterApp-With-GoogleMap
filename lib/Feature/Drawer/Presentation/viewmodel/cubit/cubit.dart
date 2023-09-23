import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/Feature/Drawer/Presentation/viewmodel/cubit/state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(IniteState());
  static DrawerCubit get(context) => BlocProvider.of(context);
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
