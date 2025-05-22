import 'package:examen_final_garcias/services/plats_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final platsService = Provider.of<PlatsService>(context);

    if (platsService.isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Llistat de Plats'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: platsService.plats.length,
        itemBuilder: (context, index) {
          final plat = platsService.plats[index];

          return ListTile(
            leading: SizedBox(
              width: 60,
              height: 60,
              child: plat.foto != null
                  ? Image.network(plat.foto!, fit: BoxFit.cover)
                  : Image.asset('assets/images/default.png', fit: BoxFit.cover),
            ),
            title: Text(plat.nom),
            onTap: () {
              // Aquí aniràs a la pantalla de detall
              Navigator.pushNamed(context, 'product', arguments: plat);
            },
          );
        },
      ),
    );
  }
}