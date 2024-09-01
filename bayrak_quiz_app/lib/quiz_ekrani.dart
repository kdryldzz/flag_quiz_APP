import 'dart:collection';
import 'package:bayrak_quiz_app/Bayraklar.dart';
import 'package:bayrak_quiz_app/bayraklardao.dart';
import 'package:bayrak_quiz_app/sonuc_ekrani.dart';
import 'package:flutter/material.dart';

class QuizEkrani extends StatefulWidget {
  const QuizEkrani({super.key});

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {
  var sorular = <Bayraklar>[];
  var yanlisSecenekler = <Bayraklar>[];
  late Bayraklar dogruSoru;
  var tumSecenkeler = HashSet<Bayraklar>();

  int soruSayac = 0;
  int dogruSayac = 0;
  int yanlisSayac = 0;
  String bayrakResimAdi = "placeholder.png";
  String buttonAyazi = "";
  String buttonByazi = "";
  String buttonCyazi = "";
  String buttonDyazi = "";

  @override
  void initState() {
    super.initState();
    sorulariAl();
  }

  Future<void> sorulariAl() async {
    sorular = await Bayraklardao().rasgele5Getir();
    soruYukle();
  }

  Future<void> soruYukle() async {
    dogruSoru = sorular[soruSayac];
    bayrakResimAdi = dogruSoru.bayrak_resim;
    yanlisSecenekler =
        await Bayraklardao().rasgele3YanlisGetir(dogruSoru.bayrak_id);

    tumSecenkeler.clear();
    tumSecenkeler.add(dogruSoru);
    tumSecenkeler.add(yanlisSecenekler[0]);
    tumSecenkeler.add(yanlisSecenekler[1]);
    tumSecenkeler.add(yanlisSecenekler[2]);

    buttonAyazi = tumSecenkeler.elementAt(0).bayrak_ad;
    buttonByazi = tumSecenkeler.elementAt(1).bayrak_ad;
    buttonCyazi = tumSecenkeler.elementAt(2).bayrak_ad;
    buttonDyazi = tumSecenkeler.elementAt(3).bayrak_ad;

    setState(() {});
  }

  void soruSayacControl() {
    soruSayac = soruSayac + 1;
    if (soruSayac != 5) {
      soruYukle();
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => SonucEkrani(
                    dogrusayisi: dogruSayac,
                  )));
    }
  }

  void dogruKontrol(String buttonYazi) {
    if (dogruSoru.bayrak_ad == buttonYazi) {
      dogruSayac += 1;
    } else {
      yanlisSayac += 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('resimler/background.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Text(
                      'Doğru:$dogruSayac',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Text('Yanlış:$yanlisSayac',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w900)),
                  ),
                ],
              ),
              soruSayac != 5
                  ? Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Text('${soruSayac + 1}.soru',
                          style: TextStyle(fontSize: 30)),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Text(
                        '5.soru',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                    ),
              Image.asset("resimler/$bayrakResimAdi"),
              SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        dogruKontrol(buttonAyazi);
                        soruSayacControl();
                      },
                      child: Text(buttonAyazi))),
              SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        dogruKontrol(buttonByazi);
                        soruSayacControl();
                      },
                      child: Text(buttonByazi))),
              SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        dogruKontrol(buttonCyazi);
                        soruSayacControl();
                      },
                      child: Text(buttonCyazi))),
              SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        dogruKontrol(buttonDyazi);
                        soruSayacControl();
                      },
                      child: Text(buttonDyazi))),
            ],
          ),
        ),
      ),
    );
  }
}
