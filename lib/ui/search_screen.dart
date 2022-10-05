import 'package:app_client/ui/appbar/search_app_bar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(onSearchPress: () => {}, onInfoPress: () => {}),
      body: Container(),
    );
  }
}
