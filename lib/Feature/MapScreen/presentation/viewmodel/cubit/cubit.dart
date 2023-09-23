import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(InitState());

  static MapCubit get(context) => BlocProvider.of(context);

}
