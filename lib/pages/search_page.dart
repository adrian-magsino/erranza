import 'package:erranza/data/areas.dart';
import 'package:erranza/widgets/custom_listTile.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: areas.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return CustomListTile(areaIndex: index,);
      }
    );
  }
}


