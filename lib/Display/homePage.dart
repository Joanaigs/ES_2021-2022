import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key ? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.white,
          centerTitle: true,
        title:  Image.asset('assets/images/icon.png', fit: BoxFit.cover),
        leading: GestureDetector(
          onTap: () { /* Write listener code here */ },
          child: const Icon(
            Icons.menu,  // add custom icons also
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17.0),
                child: Image.asset('assets/images/mapa.jpg',
                  width: 600.0,
                  height: 100.0,
                  fit: BoxFit.cover,),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17.0),
                child: Image.asset('assets/images/ae.jpg',
                  width: 600.0,
                  height: 300.0,
                  fit: BoxFit.cover,),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17.0),
                child: Image.asset('assets/images/cantina.jpg',
                  width: 600.0,
                  height: 300.0,
                  fit: BoxFit.cover,),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17.0),
                child: Image.asset('assets/images/Grill.jpg',
                  width: 600.0,
                  height: 300.0,
                  fit: BoxFit.cover,),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17.0),
                child: Image.asset('assets/images/minas.jpg',
                  width: 600.0,
                  height: 300.0,
                  fit: BoxFit.cover,),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17.0),
                child: Image.asset('assets/images/biblioteca.jpg',
                  width: 600.0,
                  height: 300.0,
                  fit: BoxFit.cover,)
              ),
            ),
          ],

        ),
      ),
    );
  }
}