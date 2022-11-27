import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(
      email: _emailController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content:
              Text('Link para redefinição enviado para seu email'),
              backgroundColor: Color.fromARGB(255, 40, 145, 31),
            )
          );
    } on FirebaseAuthException catch (e) {
      if(e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content:
              Text('Email não cadastrado'),
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
        backgroundColor: Color.fromARGB(0, 255, 44, 44),
        elevation: 0,
      ),
       body: Container(
        color: Color.fromARGB(255, 104, 10, 122),
         padding:EdgeInsets.only(
           top:60, 
           left: 40, 
           right: 40
           ),
         child: ListView(
           children:<Widget> [
             SizedBox(
               width: 200,
               height: 200,
               child: Image.asset("assets/reset_pass.png"),
             ),
             SizedBox(
               height:20 ,
               ),
               Text(
                 "Esqueceu sua senha?",
                 style: TextStyle(
                   fontSize:32,
                   fontWeight:FontWeight.w500,
                   color: Colors.white
                     ),
                     textAlign: TextAlign.center,
               ),
               SizedBox(
                 height: 10,
               ),
               Text(
                 "Por favor, informe o e-mail associado a sua conta que enviaremos um link para o mesmo com as intruções para a restauração de sua senha.",
                 style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.w400,
                   color: Colors.white60
                 ),
                 textAlign: TextAlign.center,
               ),
               SizedBox(
                 height: 20,
               ),
               TextFormField(
                controller: _emailController,
                 keyboardType:TextInputType.emailAddress,
                 decoration:InputDecoration(
                  hintText: 'example@email.com',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 12
                  ),
                   labelText: "E-mail",
                   labelStyle: TextStyle(
                     color:Colors.white,
                     fontWeight:FontWeight.w400,
                     fontSize:20,
                      ),
                 ),
                 style:TextStyle(
                   fontSize: 20,
                   ),
               ),
               SizedBox(
                 height: 20,
               ),
               Container(
                decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops:[0.3,1],
                        colors: [
                          Color.fromARGB(255, 157, 9, 243),
                          Color(0xFFF92B7F),
                        ],
                      ),
                    ),
                 height: 60,
                 alignment: Alignment.centerLeft,
                 child:SizedBox.expand(
                   child: MaterialButton(
                     child:Text(
                       "Enviar",
                       style: TextStyle(
                         fontWeight:FontWeight.bold,
                         color:Colors.white,
                         fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                     ),
                     onPressed: () {
                      passwordReset();
                     },
                   ),
                 ),
               ),
               SizedBox(
                 height: 20,
               ),
           ],
         ),
        ),
      );
    }
  }