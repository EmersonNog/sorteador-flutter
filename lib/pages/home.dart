import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sorteador/checagem.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _firebaseAuth = FirebaseAuth.instance;
  String nome = '';
  String email = '';

  @override
  initState(){
    usuario();
  }

  sair() async{
    await _firebaseAuth.signOut().then((usuario) => 
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (context) => ChecagemPage(),
        )
      )
    );
  
  }

  usuario() async {
    User? usuario = await _firebaseAuth.currentUser;
    if(usuario != null) {
      setState(() {
        nome = usuario.displayName!;
        email = usuario.email!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(nome), 
              accountEmail: Text(email),
            ),
            ListTile(
              dense: true,
              title: Text('Sair'),
              trailing: Icon(Icons.logout),
              onTap: () {
                sair();
              }
            )
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            tooltip: "Sair",
            onPressed: (){
              sair();
            },
          )
        ],
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(33, 150, 243, 1),
                Color.fromARGB(255, 49, 161, 252)
              ]
            ),
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: SizedBox(
                child: Image.asset("assets/home.png"),
                  height: 158,
                  width: 158,
                ),
              ),
              SizedBox(
                height: 30,
              ),
            Text("Olá " +
            nome + " bem-vindo",
            textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 20
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Hora de ver quem é o VENCEDOR!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(68.0),
                child: Container(
                  height: 60,
                  decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 0, 0, 0), 
                            Color.fromARGB(255, 0, 0, 0)],
                        ),
                      ),
                  child: MaterialButton(
                      child: Text('Sorteador',
                      style: TextStyle(color: Colors.white),
                      ),
                      onPressed: (){
                        Navigator.of(context).pushReplacementNamed('/sorteador');
                      }
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
