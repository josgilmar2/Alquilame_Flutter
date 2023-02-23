# Alquilame_Flutter

## Aplicación Móvil con Flutter

<p align="center">
  <a href="https://dart.dev/"><img src="https://img.shields.io/badge/dart-v3.0.0-blue" alt="Versión dart" /></a>
  <a href="https://flutter.dev/"><img src="https://img.shields.io/badge/flutter-3.8.0--13.0.pre.95-blue" alt="Versión flutter" /></a>
  <img src="https://img.shields.io/badge/release%20date-february-yellowgreen" alt="Lanzamiento del proyecto" />
  <img src="https://img.shields.io/badge/license-MIT-brightgreen" alt="Licencia" />
</p>

## Descripción
Esto es un proyecto sobre una app de alquiler de viviendas que se encuentran distribuidas por provincias. En ella, se podrán registrar distintos usuarios con un rol en concreto (PROPIETARIO O INQUILINO) que podrán hacer distintas cosas dentro de la aplicación. La principal diferencia será que el propietario podrá poner en venta las viviendas mientras que los inquilinos podrán visualizarlas y marcalas como favorita. 
Aquí se encuentra la parte del frontend donde se ha desarrollado una aplicación móvil a partir de la [API REST Alquilame](https://github.com/josgilmar2/Alquilame_App/).
Recordar que este es solamente el principio del proyecto por lo que se podrán realizar pocas funcionalidades, de las que destacamos el dar like a viviendas posteadas por otros usuarios.

## Tecnologías utilizadas
Para realizar esta aplicación móvil hemos utilizado:
1. [Flutter v3.8.0-13.0.pre.95](https://flutter.dev/)
2. [Dart v3.0.0](https://dart.dev/)
3. [Visual Studio Code](https://code.visualstudio.com/)

## Arranque
Realiza un *git clone* del siguiente repositorio: *https://github.com/josgilmar2/Alquilame_Flutter*

```console
git clone https://github.com/josgilmar2/Alquilame_Flutter.git
```

Dirígete hasta la carpeta:

> cd ./alquilame/

Y escribe para entrar en el Visual Studio Code:

```console
code .
```

Dependiendo del sistema operativo de tu ordenador habrá dos formas de poner en marcha la app:
1. **Windows**: en este caso escriba en consola:
```console
flutter run -d windows
```
Y se te abrirá la aplicación en windows
2. **MacOS**: en este caso necesitarás descargarte el [Xcode](https://apps.apple.com/es/app/xcode/id497799835?mt=12). Una vez descargado y puesto en marcha dentro del Visual Studio Code escribe en consola lo siguiente para abrir el simulador de móvil:
```console
open -a Simulator
````
Y luego para empezar a correr el proyecto se escribirá en consola:
```console
flutter run
````

## Autor
Esta aplicación móvil ha sido realizada por:
* [José Luis Gil Martín](https://github.com/josgilmar2)
