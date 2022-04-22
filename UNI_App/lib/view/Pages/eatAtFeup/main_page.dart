import 'package:flutter/material.dart';
import 'package:uni/view/Pages/general_page_view.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// @override
// Widget getBody(BuildContext context) {
//   final MediaQueryData queryData = MediaQuery.of(context);
//   return ListView(
//     children: <Widget>[
//       Container(
//           child: SvgPicture.asset(
//             'assets/images/ni_logo.svg',
//             color: Theme.of(context).accentColor,
//             width: queryData.size.height / 7,
//             height: queryData.size.height / 7,
//           )),
//       Center(
//           child: Padding(
//             padding: EdgeInsets.only(
//                 left: queryData.size.width / 12,
//                 right: queryData.size.width / 12,
//                 top: queryData.size.width / 12,
//                 bottom: queryData.size.width / 12),
//             child: Column(children: <Widget>[
//               TermsAndConditions(),
//             ]),
//           ))
//     ],
//   );
// }
class _MyHomePageState extends GeneralPageViewState {
  @override
  Widget getBody(BuildContext context) {
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
                child: Image.asset('assets/images/grill.png',
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