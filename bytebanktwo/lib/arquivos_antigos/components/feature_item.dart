import 'package:flutter/material.dart';
//TODO ERA UTILIZADO COM COMO ITENS DE MENU PELA DASHBORD ANTIGA
class FeatureItem extends StatelessWidget {
  final String titulo;
  final IconData icon;
  final Function onClick;

   const FeatureItem(this.titulo, this.icon, {Key? key, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).colorScheme.primary,
        child: InkWell(
          // Adiciona evento e efeito em um componente
          onTap: () {
            onClick();
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 24.0,
                ),
                Text(titulo,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
