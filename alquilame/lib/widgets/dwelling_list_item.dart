import 'package:alquilame/models/models.dart';
import 'package:alquilame/pages/dwelling_detail_page.dart';
import 'package:flutter/material.dart';

class DwellingListItem extends StatelessWidget {
  const DwellingListItem({Key? key, required this.dwelling}) : super(key: key);

  final Dwelling dwelling;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: InkWell(
        /*onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DwellingDetailPage(id: dwelling.id),
            ),
          );
        },*/
        child: Card(
          elevation: 4.0,
          child: Column(
            children: [
              ListTile(
                title: Text(dwelling.name),
                subtitle: Text("${dwelling.price} €"),
              ),
              SizedBox(
                  height: 200,
                  child: Image.network(
                    dwelling.image == null
                        ? "https://areajugones.sport.es/wp-content/uploads/2020/12/zoneri-021-headquarters-garrison.jpg"
                        : "http://localhost:8080/download/${dwelling.image}",
                    fit: BoxFit.cover,
                  )),
              ButtonBar(
                children: [
                  TextButton(
                    child: const Text('VER PROPIETARIO'),
                    onPressed: () {/* ... */},
                  ),
                  TextButton(
                    child: const Text('VER DETALLES'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DwellingDetailPage(id: dwelling.id)));
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
