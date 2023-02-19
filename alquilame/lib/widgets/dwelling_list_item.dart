import 'package:alquilame/models/models.dart';
import 'package:flutter/material.dart';

class DwellingListItem extends StatelessWidget {
  const DwellingListItem({super.key, required this.dwelling});

  final Dwelling dwelling;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: InkWell(
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [Text("${dwelling.name}")],
          ),
        ),
        /*onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => dwellingDetailPage(id: dwelling.id),
              ));
        },*/
      ),
    );
  }
}
