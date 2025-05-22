import 'package:examen_final_garcias/models/plats.dart';
import 'package:flutter/material.dart';

class PlatDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Plats plat = ModalRoute.of(context)!.settings.arguments as Plats;

    return Scaffold(
      appBar: AppBar(title: Text(plat.nom)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: plat.foto != null
                  ? Image.network(plat.foto!, height: 200)
                  : Image.asset('assets/images/default.png', height: 200),
            ),
            SizedBox(height: 16),
            Text("Nom: ${plat.nom}", style: TextStyle(fontSize: 16)),
            Text("Descripció: ${plat.descripcio}", style: TextStyle(fontSize: 16)),
            Text("Preu: ${plat.preu}", style: TextStyle(fontSize: 16)),

            SizedBox(height: 8),
            Row(
              children: [
                Text("Disponible: ", style: TextStyle(fontSize: 16)),
                Icon(
                  plat.disponible ? Icons.check_circle : Icons.cancel,
                  color: plat.disponible ? Colors.green : Colors.red,
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}