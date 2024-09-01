import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  final int dogrusayisi;

  const SonucEkrani({super.key, required this.dogrusayisi});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
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
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Text(
                    '${widget.dogrusayisi} DOĞRU ${5 - widget.dogrusayisi} YANLIŞ',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Text('%${(widget.dogrusayisi * 100 / 5).toInt()} BAŞARI',
                    style: TextStyle(fontSize: 30, color: Colors.blue)),
              ),
              SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Text('TEKRAR DENE',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              )))))
            ],
          ),
        ),
      ),
    );
  }
}
