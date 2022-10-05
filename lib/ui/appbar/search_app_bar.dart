import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget with PreferredSizeWidget {
  SearchAppBar(
      {super.key, required this.onSearchPress, required this.onInfoPress});

  final Function onSearchPress;
  final Function onInfoPress;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: TextField(
          keyboardAppearance: Brightness.dark,
          autofocus: true,
          textInputAction: TextInputAction.search,
          controller: _controller,
          textAlignVertical: TextAlignVertical.bottom,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            suffixIcon: IconButton(
              splashRadius: 100,
              padding: const EdgeInsets.only(right: 20),
              onPressed: _controller.clear,
              icon: const Icon(Icons.close_rounded, color: Colors.white),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none),
            hintText: 'Search by the keyword...',
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(82.0);
}
