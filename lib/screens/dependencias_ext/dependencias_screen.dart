import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:line_icons/line_icons.dart';
import 'package:prueba_ricardo/colors/colors.dart';

import 'package:prueba_ricardo/widgets/exports_widgets.dart';

class DependenciasScreen extends StatefulWidget {
    final Size size;
  const DependenciasScreen({super.key, required this.size});

  @override
  State<DependenciasScreen> createState() => _DependenciasScreenState();
}

class _DependenciasScreenState extends State<DependenciasScreen> {

  bool activo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: customAppBarText(text: 'Dependencias')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            children: [
              
              CustomCard(
                childPadding: 0,
                elevation: activo ? 10 : 1,
                borderRadius: activo ? 50 : 10,
                borderWidth: activo ? 3 : 1,
                borderColor: activo ? Colors.yellow.shade800 : kconstPrimaryColor,
                hoverColor: kconstPrimaryColor,
                width: activo ? widget.size.shortestSide * .4 : widget.size.shortestSide * .8,
                height: activo ? widget.size.shortestSide * .4 : widget.size.shortestSide * .2,
                onTap: () {
                  setState(() {
                    activo = !activo;
                  });
                },
                child: Center(child: customText(text: activo ? 'Abrir' : 'Cerrar', size: 20))
              ),
          
              SizedBox(height: widget.size.shortestSide * .2),
          
              Visibility(
                visible: activo,
                child: Custom3DCard(
                  elevation: 4,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: Icon(LineIcons.damagedHouse, size: widget.size.shortestSide * .2)
                    ),
                  ),
                ),
              ),
          
            ],
          ),
        ),
      )
    );
  }
}