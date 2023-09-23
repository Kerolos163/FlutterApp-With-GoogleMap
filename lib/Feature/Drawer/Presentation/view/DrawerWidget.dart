import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/Feature/Drawer/Presentation/viewmodel/cubit/cubit.dart';

import 'widget/DrawerBody.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerCubit(),
      child: Container(
        color: Colors.blue[100],
        child: const SafeArea(
          child: DrawerBody(),
        ),
      ),
    );
  }
}
