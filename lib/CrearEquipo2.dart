import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CrearEquipo2 extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
formItemsDesign(icon, item) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 7),
    child: Card(child: ListTile(leading: Icon(icon), title: item)),
  );
}
// Define una clase de estado correspondiente. Esta clase contendrá los datos
// relacionados con el formulario.
class MyCustomFormState extends State<CrearEquipo2> {
  // Crea una clave global que identificará de manera única el widget Form
  // y nos permita validar el formulario
  //
  // Nota: Esto es un `GlobalKey<FormState>`, no un GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Cree un widget Form usando el _formKey que creamos anteriormente
    return Scaffold(
      // No appbar provided to the Scaffold, only a body with a
      // CustomScrollView.
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(100, (index) {
          return Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headline,
            ),
          );
        }),
      ),
    );
  }
}
