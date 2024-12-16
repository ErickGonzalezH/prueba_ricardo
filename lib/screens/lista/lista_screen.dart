import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:prueba_ricardo/colors/colors.dart';
import 'package:prueba_ricardo/widgets/disenos/botones/botones_widgets.dart';

import 'package:prueba_ricardo/widgets/exports_widgets.dart';

class ListaScreen extends StatefulWidget {
    final Size size;
  const ListaScreen({super.key, required this.size});

  @override
  State<ListaScreen> createState() => _ListaScreenState();
}

class _ListaScreenState extends State<ListaScreen> {

  //Lista
  List<String> nombres = ['Erick', 'Leonardo', 'Gonzalez'];

  //Mapa
  Map<String, dynamic> prueba = {
    'Nombre': 'Flutter',
    'Version': 3.0,
    'Plataforma': 'Mobile',
    'Framework': 'Dart',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: customAppBarText(text: 'Lista'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context, 
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: customText(text: 'Información'),
                    content: customText(
                      text: 'Esto es una prueba de una alerta', 
                      textAlign: TextAlign.justify
                    ),
                    actions: [
                      materialChidoButton(
                        onPressed: () => Navigator.pop(context), 
                        text: 'Cerrar alerta', 
                        minWidth: widget.size.shortestSide * .5, 
                        color: kconstPrimaryColor, 
                        textSize: 16,
                        textColor: Colors.white,
                      )
                    ],
                  );
                }
              );
            }, 
            icon: const Icon(Icons.info_outline)
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [

            customNiggaText(text: 'Lista dinámica de elementos(Mapa)', size: 20),
            SizedBox(height: widget.size.shortestSide * .03),

            //LISTA DINAMICA CON MAPA SENCILLO
            SizedBox(
              height: widget.size.shortestSide * 1,
              child: Scrollbar(
                child: CustomScrollView(
                  slivers: [
                    SliverList.builder(
                      itemCount: prueba.entries.length,
                      itemBuilder: (context, index) {
                        final entry = prueba.entries.elementAt(index);
                        return Card(
                          child: ListTile(
                            leading: customNiggaText(text: '${index + 1}'),
                            title: Text('Clave: ${entry.key}'),
                            subtitle: Text('Valor: ${entry.value}'),
                            trailing: IconButton(
                              onPressed: () {
                                
                              }, 
                              icon: const Icon(Icons.more_vert_sharp)
                            ),
                          ),
                        );
                      }
                    )
                  ],
                )
              ),
            ),

            customNiggaText(text: 'Lista dinámica de elementos(Lista)', size: 20),
            SizedBox(height: widget.size.shortestSide * .03),

            //LISTA DINAMICA
            SizedBox(
              height: widget.size.shortestSide * 1,
              child: Scrollbar(
                child: CustomScrollView(
                  slivers: [
                    SliverList.builder(
                      itemCount: nombres.length,
                      itemBuilder: (context, index) {
                        final datos = nombres[index];
                        return Card(
                          child: ListTile(
                            leading: customNiggaText(text: '${index + 1}'),
                            title: Text('Contenido: $datos'),
                            trailing: IconButton(
                              onPressed: () {}, 
                              icon: const Icon(Icons.more_vert_sharp)
                            ),
                          ),
                        );
                      }
                    )
                  ],
                )
              ),
            ),

            IconButton(
              onPressed: (){
                setState(() {
                  log('Hola');
                });
              }, 
              icon: Icon(Icons.abc)
            )



          ],
        ),
      )
    );
  }
}