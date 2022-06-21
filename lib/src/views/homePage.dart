import 'dart:async';

import 'package:iot_firebase_dashboard/src/components/CustomCard2.dart';
import 'package:flutter/material.dart';
import 'package:iot_firebase_dashboard/src/components/CustomCard1.dart';
import 'package:firebase_database/firebase_database.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  final fb = FirebaseDatabase.instance;
  int temp = 0;
  int hum = 0;
  int dio = 0;
  String device = "Off";
  Widget build(BuildContext context) {

    //codigo para detectar cambio entre instantaneas de mi base de datos , por alguna
    // razon funciona mal cuando uso el useState
    /*final Stream<DatabaseEvent> stream = ref.onValue;
    stream.listen((DatabaseEvent event) {
      getData();
    });*/
    // de momento dejare comentado esta liea de codigo
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            width: 100,
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
                "ESTATUS",
                style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CardMini(
                "3",
                "Cantidad",
                "Sensores Activos",
                Colors.purple,
                Colors.purpleAccent,
                Colors.white,
                Icon(
                  Icons.blender,
                  color: Colors.deepPurple,
                  size: 64.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ),
              CardMini(
                this.device,
                "Estado",
                "Dispositivo Activo",
                Colors.amber,
                Colors.amberAccent,
                Colors.indigo,
                Icon(
                  Icons.smartphone,
                  color: Colors.orange,
                  size: 64.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          CustomCard1(
            temp.toDouble(),
            "Valores normales",
            "Temperatura",
            Colors.orange,
            Colors.deepOrangeAccent,
            Colors.white,
            Colors.greenAccent,
            Icon(
              Icons.device_thermostat,
              color: Colors.pink,
              size: 64.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ),
          SizedBox(
            height: 30,
          ),
          CustomCard1(
            hum.toDouble(),
            "Valores normales",
            "Humedad",
            Colors.indigo,
            Colors.indigoAccent,
            Colors.white,
            Colors.greenAccent,
            Icon(
              Icons.water,
              color: Colors.greenAccent,
              size: 64.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ),
          SizedBox(
            height: 30,
          ),
          CustomCard1(
            dio.toDouble(),
            "Valores Normales",
            "CO2",
            Colors.black,
            Colors.black54,
            Colors.white,
            Colors.white,
            Icon(
              Icons.air,
              color: Colors.white,
              size: 64.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          )
        ],
      ),
    );

  }
  void getData ()async{
    if (mounted) {
    final ref = fb.ref().child('sensores');
    final temperatura = await ref.child('temperatura/valor').get();
    if (temperatura.exists) {

        setState(() {
          this.temp = int.parse(temperatura.value.toString());
        });


    } else {
      print('No data available.');
    }
    final humedad = await ref.child('humedad/valor').get();
    if (humedad.exists) {

      setState(() {
        this.hum = int.parse(humedad.value.toString());
      });

    } else {
      print('No data available.');
    }
    final co2 = await ref.child('C02/valor').get();
    if (co2.exists) {
      setState(() {
        this.dio = int.parse(co2.value.toString());
      });

    } else {
      print('No data available.');
    }
    final dev = await ref.child('dispositivo/estatus').get();
    if (dev.exists) {
      setState(() {
        this.device = dev.value.toString();
      });

    } else {
      print('No data available.');
    }
    }
  }
  @override
  void initState() {
    
    super.initState();
     Timer.periodic(Duration(seconds:1),(value){
         getData();
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();


  }

}
