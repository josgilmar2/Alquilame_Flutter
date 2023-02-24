import 'package:alquilame/blocs/blocs.dart';
import 'package:alquilame/models/models.dart';
import 'package:alquilame/pages/dwelling_detail_page.dart';
import 'package:alquilame/pages/dwelling_user_details_page.dart';
import 'package:alquilame/pages/dwelling_user_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class DwellingUserListItem extends StatefulWidget {
  final Dwelling dwelling;
  final DwellingBloc dwellingBloc;

  DwellingUserListItem({required this.dwelling, required this.dwellingBloc});

  @override
  _DwellingUserListItemState createState() => _DwellingUserListItemState();
}

class _DwellingUserListItemState extends State<DwellingUserListItem> {
  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      child: InkWell(
        child: Card(
          elevation: 4.0,
          child: Column(
            children: [
              ListTile(
                title: Text(widget.dwelling.name),
                subtitle: Text("${widget.dwelling.price} €"),
              ),
              SizedBox(
                height: 200,
                child: Image.network(
                  widget.dwelling.image == null
                      ? "https://areajugones.sport.es/wp-content/uploads/2020/12/zoneri-021-headquarters-garrison.jpg"
                      : "http://localhost:8080/download/${widget.dwelling.image}",
                  fit: BoxFit.cover,
                ),
              ),
              ButtonBar(
                children: [
                  TextButton(
                    child: const Text('VER PROPIETARIO'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DwellingUserDetailsPage(id: widget.dwelling.id),
                        ),
                      );
                    },
                  ),
                  TextButton(
                    child: const Text('VER DETALLES'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DwellingDetailPage(id: widget.dwelling.id),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    tooltip: 'ELIMINAR',
                    onPressed: () => _showDeleteConfirmationDialog(
                        context, widget.dwellingBloc),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, DwellingBloc dwellingBloc) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¿Quiéres eliminar esta vivienda de tu lista?'),
          content: const Text('Recuerda que esta acción no se puede deshacer.'),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCELAR'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('ELIMINAR'),
              onPressed: () async {
                setState(() {
                  _isDeleting = true;
                });

                dwellingBloc.add(DwellingDelete(id: widget.dwelling.id));

                /*setState(() {
                  _isDeleting = false;
                });*/

                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        "Se ha eliminado correctamente la vivienda de tu lista. Para comprobarlo sal de la lista y vuelve a entrar")));
              },
            ),
          ],
        );
      },
    );
  }
}

/*class DwellingUserListItem extends StatelessWidget {
  final Dwelling dwelling;
  final DwellingBloc dwellingBloc;

  DwellingUserListItem({required this.dwelling, required this.dwellingBloc});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) async {
        dwellingBloc.add(DwellingDelete(id: dwelling.id));
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => DwellingUserListPage()),
        );
      },
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: Material(
        child: InkWell(
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DwellingUserDetailsPage(id: dwelling.id),
                            ));
                      },
                    ),
                    TextButton(
                      child: const Text('VER DETALLES'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DwellingDetailPage(id: dwelling.id),
                            ));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
