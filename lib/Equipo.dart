import 'package:flutter/material.dart';
import 'main.dart';
import 'Team.dart';

class Equipo extends StatefulWidget {
  List<Team> teamList ;
  Equipo(this.teamList);
  @override
  EquipoState createState() => EquipoState();
}
class EquipoState extends State<Equipo> {

  Team team = Team();


  Widget _buildlistteams() {

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: widget.teamList.length,
      itemBuilder: (context, item) {
        //if (item.isOdd) return Divider();
        final index = item;
        return _buildRow(widget.teamList[index]);
      },
    );
  }

  Widget _buildRow(Team Team) {

    return ListTile(
      title: Text(Team.name ),
      trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.green,
          ),
          onPressed: () {

          }),
    );
  }
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Team List'),
        ),
        body: _buildlistteams(),
        backgroundColor: Colors.blueGrey.shade200,
        floatingActionButton:
        Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [

              FloatingActionButton(
                  child: Icon(
                    Icons.add,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/crearequipo");
                  }),
            ]));



  }
}