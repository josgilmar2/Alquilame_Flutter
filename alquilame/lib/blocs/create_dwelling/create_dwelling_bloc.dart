import 'package:alquilame/config/locator.dart';
import 'package:alquilame/services/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

/*class CreateDwellingBloc extends FormBloc<String, String> {
  late final DwellingService _dwellingService;

  final name = TextFieldBloc(validators: [FieldBlocValidators.required]);

  final address = TextFieldBloc(validators: [FieldBlocValidators.required]);

  final description = TextFieldBloc();

  final type = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['CASA', 'PISO', 'CHALET'],
  );

  final price = TextFieldBloc(validators: [FieldBlocValidators.required]);

  final m2 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  final numBedrooms = TextFieldBloc(validators: [FieldBlocValidators.required]);

  final numBathrooms =
      TextFieldBloc(validators: [FieldBlocValidators.required]);

  final hasElevator = BooleanFieldBloc();

  final hasPool = BooleanFieldBloc();

  final hasTerrace = BooleanFieldBloc();

  final hasGarage = BooleanFieldBloc();

  final provinceName = SelectFieldBloc(validators: [
    FieldBlocValidators.required
  ], items: [
    'A Coruna',
    'Alava',
    'Albacete',
    'Alicante',
    'Almeria',
    'Asturias',
    'Avila',
    'Badajoz',
    'Baleares',
    'Barcelona',
    'Bizkaia',
    'Burgos',
    'Caceres',
    'Cadiz',
    'Cantabria',
    'Castellon',
    'Ceuta',
    'Ciudad Real',
    'Cordoba',
    'Cuenca',
    'Guipuzkoa',
    'Girona',
    'Granada',
    'Guadalajara',
    'Huelva',
    'Huesca',
    'Jaen',
    'La Rioja',
    'Las Palmas',
    'Leon',
    'Lugo',
    'Lleida',
    'Madrid',
    'Malaga',
    'Melilla',
    'Murcia',
    'Navarra',
    'Ourense',
    'Palencia',
    'Pontevedra',
    'Salamanca',
    'Segovia',
    'Sevilla',
    'Soria',
    'Tarragona',
    'Tenerife',
    'Teruel',
    'Toledo',
    'Valencia',
    'Valladolid',
    'Zamora',
    'Zaragoza'
  ]);

  CreateDwellingBloc() {
    _dwellingService = getIt<DwellingService>();
  }
}*/
