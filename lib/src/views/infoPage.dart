import 'package:flutter/material.dart';

class infoPage extends StatelessWidget {
  const infoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 40,
          width: 120,
          margin: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                colors: [Colors.lightGreenAccent, Colors.greenAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
          ),
          child: Center(
            child: Text(
              "INFORMACION",
              style:
              TextStyle(color: Colors.black54, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage("images/LOGO.png"),
                radius: 70,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  padding: EdgeInsets.all(5.0),
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: <Widget>[
                      Center(
                          child: Text(
                            "Acerca de MECDEVS",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )),
                      Text("Mecdevs es una empresa desarolladora de "
                          "software aplicado a la Industria 5.0, nos dedicamos"
                          " al desarrollo de aplicaciones moviles y web enfocadas al Internet"
                          " de las cosas")
                    ],
                  ),
                ),
              )
            ],
          ),
          width: double.infinity,
          height: 200,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                  bottomRight: const Radius.circular(40.0)),
              gradient: LinearGradient(
                colors: [Colors.deepOrangeAccent, Colors.pinkAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
          ),
        ),
        Container(
          width: double.infinity,
          height: 80,
          margin: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(40)),
              gradient: LinearGradient(
                colors: [Colors.deepOrangeAccent, Colors.pinkAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.link,
                    color: Colors.white,
                    size: 36,
                  ),
                  tooltip: 'pagina web',
                  onPressed: () {},
                ),
                Center(
                    child: Text(
                      "Website",
                      style: TextStyle(color: Colors.white),
                    ))
              ]),
              Column(children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.white,
                    size: 36,
                  ),
                  tooltip: 'pagina web',
                  onPressed: () {},
                ),
                Center(
                    child: Text(
                      "Facebook",
                      style: TextStyle(color: Colors.white),
                    ))
              ]),
              Column(children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.email,
                    color: Colors.white,
                    size: 36,
                  ),
                  tooltip: 'pagina web',
                  onPressed: () {},
                ),
                Center(
                    child: Text(
                      "Email",
                      style: TextStyle(color: Colors.white),
                    ))
              ])
              ,
            ],
          ),
        ),
        Image(image: AssetImage("images/logo2.png"),
          height: 200,
        ),
      ],
    );
  }
}
