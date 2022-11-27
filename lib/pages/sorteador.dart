import 'package:flutter/material.dart';
import 'package:sorteador/pages/home.dart';
import 'dart:math';
import '../presentation/fonte.dart';

void main(){
  runApp(const sorteador());
}

class sorteador extends StatelessWidget {
  const sorteador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      home: const Sorteador(),
    );
  }
}

class Sorteador extends StatefulWidget {
  const Sorteador({Key? key}) : super(key: key);

  @override
  State<Sorteador> createState() => _SorteadorState();
}

class _SorteadorState extends State<Sorteador> {
  int intValue =  0;
  
  void _sorteador() {
    setState(() {
      intValue = Random().nextInt(10000) + 50; // Value is >= 50 and < 150.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 244, 67, 54),
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () { 
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => Home()
                  )
                );
               },
                );
          }
        )
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(166, 138, 36, 201),
                Color.fromARGB(255, 61, 5, 78)
              ]
            ),
          ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                      Text(
                        'Sorteio',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 42.0,
                          letterSpacing: 8,
                        ),
                      ),
                    
                    Padding(padding: EdgeInsets.only(bottom: 70),
                      child: Text(
                        'Hora de ver quem é o VENCEDOR!',
                        style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic
                          ),
                        ),
                      ),
                    Center(
                      child: Container(
                        margin: new EdgeInsets.only(bottom: 20.0),
                      width: 300.0,
                      height: 400.0,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 59, 59, 59),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Seu número sorteado:',
                                style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                                  ),
                                ),
                              Container(
                                child: Center(
                                  child: Text(
                                    '$intValue',
                                    style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                        ),
                                      ),
                                    ),
                            height: 120.0,
                            width: 120.0,
                            margin: new EdgeInsets.only(top: 20.0),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(209, 100, 100, 100),
                              borderRadius: BorderRadius.circular(360.0),
                              ),
                            ),
                            
                            Container(
                              margin: new EdgeInsets.only(top: 40.0),
                              child: Center(
                                child: Text(
                                  'Click aqui para gerar ',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 202, 202, 202)
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ))
                    )],
                  ),
                ),
              ),
              

      floatingActionButton: FloatingActionButton(
        onPressed: _sorteador,
        tooltip: 'Gerador',
        child: const Icon(CustomIcon.shuffle, size: 20.0),
        
      ),
      floatingActionButtonLocation: 
        FloatingActionButtonLocation.centerFloat, 
      bottomSheet: Padding(padding: EdgeInsets.only(bottom: 165.0)),
    );
  }
}
