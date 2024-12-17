import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:animated_icon_button/animated_icon_button.dart';

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
                childPadding: 1,
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

              if(activo) ...{

                Custom3DCard(
                  elevation: 4,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: Icon(LineIcons.damagedHouse, size: widget.size.shortestSide * .2)
                    ),
                  ),
                ),

                AnimatedIconButton(
                  size: 100,
                  onPressed: () {},
                  duration: const Duration(milliseconds: 500),
                  splashColor: Colors.transparent,
                  icons: const <AnimatedIconItem>[
                    AnimatedIconItem(
                      icon: Icon(LineIcons.car, color: Colors.purple),
                    ),
                    AnimatedIconItem(
                      icon: Icon(LineIcons.hourglass, color: Colors.black),
                    ),
                     AnimatedIconItem(
                      icon: Icon(LineIcons.phone, color: Colors.blue),
                    ),
                     AnimatedIconItem(
                      icon: Icon(LineIcons.hamburger, color: Colors.yellow),
                    ),
                  ],
                ),

              },

          
            ],
          ),
        ),
      )
    );
  }
}