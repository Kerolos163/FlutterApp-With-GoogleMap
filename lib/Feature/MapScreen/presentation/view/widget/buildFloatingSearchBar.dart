import 'package:flutter/material.dart';
import 'package:flutter_maps/Core/Utils/mycolor.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class FloatingSearchBarWidget extends StatelessWidget {
  const FloatingSearchBarWidget({super.key, this.controller});
  final FloatingSearchBarController? controller;
  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: FloatingSearchBar(
          controller: controller,
          elevation: 5,
          hint: 'Search...',
          hintStyle: const TextStyle(fontSize: 18),
          queryStyle: const TextStyle(fontSize: 18),
          border: BorderSide.none,
          iconColor: MyColors.blue,
          scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
          transitionDuration: const Duration(milliseconds: 800),
          transitionCurve: Curves.easeInOut,
          physics: const BouncingScrollPhysics(),
          axisAlignment: isPortrait ? 0.0 : -1.0,
          openAxisAlignment: 0.0,
          width: isPortrait ? 600 : 500,
          debounceDelay: const Duration(milliseconds: 500),
          onQueryChanged: (query) {
            // Call your model, bloc, controller here.
          },
          transition: CircularFloatingSearchBarTransition(),
          actions: [
            FloatingSearchBarAction(
              showIfOpened: false,
              child: CircularButton(
                icon: Icon(Icons.place, color: Colors.black.withOpacity(0.6)),
                onPressed: () {},
              ),
            ),
            FloatingSearchBarAction.searchToClear(
              showIfClosed: false,
            ),
          ],
          builder: (context, transition) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: const Material(
                color: Colors.white,
                elevation: 4.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [],
                ),
              ),
            );
          }),
    );
  }
}
