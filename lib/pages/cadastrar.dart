import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sorteador/checagem.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {

  @override
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  cadastrar() async {
    try {
      UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passController.text);
          
      if(userCredential != null) {
        userCredential.user!.updateDisplayName(_nomeController.text);
        Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(
          builder: (context) => ChecagemPage(),
        ),
        (route) => false);
      }
    }on FirebaseAuthException catch (e) {
      if(e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content:
              Text('Crie uma senha mais segura'),
              backgroundColor: Colors.redAccent,
            )
          );
      }else if(e.code == 'email-already-in-use'){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content:
              Text('Email já cadastrado'),
              backgroundColor: Colors.redAccent,
            )
          );
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color.fromARGB(0, 255, 44, 44),
        elevation: 0

      ),
      body: Container(
        color: Color.fromARGB(255, 104, 10, 122),
        padding: EdgeInsets.only(top: 10, left: 40, right:40),
        child: ListView(
          children: <Widget>[
            SizedBox(
                width: 100,
                height: 100,
                child: Image.asset("assets/signup.png"),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _nomeController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                hintText: 'Insira seu nome',
                hintStyle: TextStyle(
                  color: Colors.white54,
                  fontSize: 12
                  ),
                labelText: "Nome",
                labelStyle: TextStyle(
                  color:Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                ),
                style: TextStyle(
                  fontSize:20, 
                  ),
              ),
              SizedBox(
                height: 10,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Insira seu email',
                    hintStyle: TextStyle(
                      color: Colors.white54,
                      fontSize: 12
                  ),
                    labelText:"E-mail",
                    labelStyle:TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize:20,
                       ),
                        ),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                ),
                SizedBox(
                  height:10,
                ),
                TextFormField(
                  controller: _passController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Insira sua senha',
                    hintStyle: TextStyle(
                      color: Colors.white54,
                      fontSize: 12
                  ),
                    labelText: "Senha",
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize:20,
                    ),
                  ),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height:10,
                ),
                Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end:Alignment.bottomRight,
                        stops:[0.3,1],
                        colors:[
                          Color.fromARGB(255, 157, 9, 243),
                          Color(0xFFF92B7F),
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      )
                    ),
                  child: SizedBox.expand(
                    child: ElevatedButton(
                      child: Text("Cadastrar",),
                           onPressed: (){
                            cadastrar();
                          },
                        ),
                      ),
                    ),
                SizedBox(
                  height: 10,
                ),
               ],
             ),
           ), 
         );
       }
  }
