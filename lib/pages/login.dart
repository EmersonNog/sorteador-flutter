import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sorteador/pages/cadastrar.dart';
import 'package:sorteador/pages/home.dart';
import 'package:sorteador/pages/resetPass.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Faça login',
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      home: const Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);


  loginAuth() async {
      try{
        UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passController.text,
        );
        if(userCredential != null) {
          Navigator.pushReplacement(
            context, MaterialPageRoute(
              builder: (context) => Home(),
            )
          );
        }
      } on FirebaseAuthException catch(e) {
        if(e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content:
              Text('Usuário não encontrado'),
              backgroundColor: Colors.redAccent,
            )
          );
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content:
            Text('Senha errada'),
            backgroundColor: Colors.redAccent,
            )
          );
        }
      }
    }

  googleLogin() async{
    await _googleSignIn.signIn();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
      backgroundColor: Color.fromARGB(0, 255, 44, 44),
      elevation: 0
      ),
      body: Container (
        padding: EdgeInsets.only(
          top: 60, 
          left: 40, 
          right: 40,
        ),
        color: Color.fromARGB(255, 104, 10, 122),
        child: ListView(
          children:<Widget>[
          SizedBox(
            width: 128,
            height: 128,
            child: Image.asset("assets/login.png"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'example@email.com',
                hintStyle: TextStyle(
                  color: Colors.white54,
                  fontSize: 12
                ),
                labelText:"E-mail",
                labelStyle:TextStyle(
              color:Colors.white,
              fontWeight:FontWeight.w400,
              fontSize:20,
              ),
              ),
              style: TextStyle(
                fontSize:20,
                ),
            ),
            SizedBox(
              height:10,
            ),
            TextFormField(
              controller: _passController,
              keyboardType:TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                hintText: 'Insira sua senha',
                hintStyle: TextStyle(
                  color: Colors.white54,
                  fontSize: 12
                  ),
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style:TextStyle(fontSize: 20),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(0, 0, 0, 0),
                    shadowColor: Color.fromARGB(0, 244, 67, 54),
                    elevation: 0,
                  ),
                child: Text(
                  "Recuperar Senha",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> ResetPasswordPage()
                       ),
                    );
                  },
                ),
              ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color.fromARGB(255, 156, 64, 172), Color.fromARGB(255, 140, 81, 151)],
                      ),
                    ),
                    height:60,
                    alignment: Alignment.centerLeft,
                    child:SizedBox.expand(
                      child: MaterialButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Entrar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:Colors.white,
                                fontSize:20,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Container(
                              child: SizedBox(
                                child: Image.asset("assets/logo.png"),
                              height: 28,
                              width: 28,
                            ),
                          ),
                        ]
                        ),
                        onPressed: () {
                          loginAuth();
                        },
                      )
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color.fromARGB(255, 41, 98, 151), Color.fromARGB(255, 62, 146, 224)]
                      ),
                    ),
              height: 60,
              alignment: Alignment.centerLeft,
              child: SizedBox.expand(
                child: MaterialButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Entre com o google",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:Colors.white,
                          fontSize:20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset("assets/logo.png"),
                          height: 28,
                          width: 28,
                        ),
                        ),
                    ],
                  ),
                  onPressed: (){
                    googleLogin();
                  }
                ),
                ),
            ),
            SizedBox(
              height:10,
            ),
            new SizedBox(
              height: 50.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 42,
                  shadowColor: Colors.black,
                  primary: Color.fromARGB(255, 32, 15, 37),
                ),
                child: Text(
                  "Cadastre-se",
                  textAlign: TextAlign.center,
                ),
                  onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:(context) => SignupPage()
                          ),
                        );
                      },
              )
            ),
          ],
        ),
      ),
    );
  }
}
