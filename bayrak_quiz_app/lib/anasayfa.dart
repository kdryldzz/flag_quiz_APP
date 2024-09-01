import 'package:bayrak_quiz_app/quiz_ekrani.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
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
              Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Text(
                  '    QUİZE HOŞGELDİNİZ',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuizEkrani()));
                      },
                      child: Text('BAŞLA',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700))))
            ],
          ),
        ),
      ),
    );
  }
}
