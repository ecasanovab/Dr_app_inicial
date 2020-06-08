import 'package:flutter/material.dart';

import 'Jugador.dart';

class ListaJugadoresForm extends StatefulWidget {
  @override
  ListaJugadoresFormState createState() => ListaJugadoresFormState();
}

class ListaJugadoresFormState extends State<ListaJugadoresForm> {
  final _playerlist = <Jugador>[];
  Jugador jugador = Jugador();
  int count = 1;
  bool showForm = false;

  void submit2(String _name, int _number) {
    setState(() {
      bool showForm = false;
      _playerlist.add(
        Jugador(name: _name, number: _number),
      );
    });
  }

  void resetList() {
    setState(() {});
  }

  void incrementCounter() {
    setState(() {
      bool showForm = true;
    });
  }

  Widget _buildlistplayers() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _playerlist.length,
      itemBuilder: (context, item) {
        //if (item.isOdd) return Divider();
        final index = item;
        return _buildRow(_playerlist[index]);
      },
    );
  }

  Widget _buildRow(Jugador Jugador) {
    int j = Jugador.number;

    return ListTile(
      title: Text(Jugador.name + ' number: ' + '$j'),
      trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.green,
          ),
          onPressed: () {
            _playerlist.removeWhere((item) => item.number == Jugador.number);
            resetList();
          }),
    );
  }

  Widget build(BuildContext context) {
    print(showForm);
    final formKey2 = GlobalKey<FormState>();
    String _name;
    String _number;
    String numberValidator(String value) {
      if (value == null) {
        return null;
      }
      final n = num.tryParse(value);
      if (n >= 100) {
        return '"$value" is not a valid nuumber';
      }
      return null;
    }

    if (showForm == false) {
      return Scaffold(
          appBar: AppBar(
            title: Text('jugadoores list'),
          ),
          body: _buildlistplayers(),
          floatingActionButton:
              Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                FloatingActionButton(
                  child: Container(
                    width: 200,
                    child:Text('Save Team'),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.purple,

                    ),
                      ),
                       onPressed: () => resetList(),
                      ),

                FloatingActionButton(
                    child: Icon(
                      Icons.add,
                    ),
                    onPressed: () {
                      showForm = true;
                      incrementCounter();
                    }),
              ]));
    } else {
      return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Form(
                key: formKey2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Name of the player:'),
                        validator: (input) =>
                            !input.contains('@') ? 'Not a valid Email' : null,
                        onSaved: (String input) {
                          _name = input;
                        }),
                    new TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Number of the player:'),
                      keyboardType: TextInputType.number,
                      validator: numberValidator,
                      textAlign: TextAlign.left,
                      onSaved: (input) => _number = input,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FloatingActionButton(
                            onPressed: () {
                              formKey2.currentState.save();
                              showForm = false;
                              submit2(_name, int.parse(_number));
                            },
                            child: Text('Submit'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ));
    }
  }
}

class Player {
  String _name;
  String _number;

  Player(this._name, this._number);
}
