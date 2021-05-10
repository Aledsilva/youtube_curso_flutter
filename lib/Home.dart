import 'package:flutter/material.dart';
import 'package:youtube_curso_flutter/CustomSearchDelegate.dart';
import 'package:youtube_curso_flutter/screens/Biblioteca.dart';
import 'package:youtube_curso_flutter/screens/EmAlta.dart';
import 'package:youtube_curso_flutter/screens/Inicio.dart';
import 'package:youtube_curso_flutter/screens/Inscricao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indexAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [

      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/dbz.png",
        width: 98,
        height: 80,),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async{
             String res = await showSearch(context: context, delegate: CustomSearchDelegate());
            setState(() {
              _resultado = res;
            });
             print("resultado: digitado " + res);
             },),

          /*IconButton(
            icon: Icon(Icons.videocam),
          onPressed: (){},),

          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){},),*/
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indexAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _indexAtual,
        onTap: (index){
          setState(() {
            _indexAtual = index;
          });
        },


        type: BottomNavigationBarType.shifting,
        fixedColor: Colors.white,

        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            title: Text("Início"),
              icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.yellow,
            title: Text("Em alta"),
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            title: Text("Inscrições"),
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.green,
            title: Text("Biblioteca"),
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
