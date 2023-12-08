// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
//import 'package:abo_rs/screens/homePage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'homePage.dart';

class AtualizarDados extends StatefulWidget {
  const AtualizarDados({super.key});

  @override
  State<AtualizarDados> createState() => _AtualizarDadosState();
}

class _AtualizarDadosState extends State<AtualizarDados> {
  //INSTANCIANDO CONTROLLERS
  final TextEditingController _user = TextEditingController();
  final TextEditingController _telephone = TextEditingController();
  final TextEditingController _email = TextEditingController();

  Future<void> _atualizarDados() async {
    //RECUPERAÇÃO VARIAVEIS
    String userTyped = _user.text;
    String telephone = _telephone.text;
    String email = _email.text;

    //ROTA - ENDPOINT
    String url = "https://invianf.com.br/ws/appNotaSimples/updateUser.php";

    //JSON CHAMADA
    Map<String, String> body = {
      "apiPassword": "4pZqfXa3r88SW3aPr",
      "appUsername": userTyped,
      "appPhone": telephone,
      "appEmail": email
    };

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    //AWAIT PARA AGUARDAR O RESPONSE
    http.Response response = await http.post(Uri.parse(url),
        body: json.encode(body), headers: headers);

    if (kDebugMode) {
      print(response.body);
    }

    //PEGANDO O RETORNO EM FORMA DE JSON
    Map<String, dynamic> retorno = json.decode(response.body);

    if (retorno["StatusCode"] == "200") {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
      debugPrint("PASSOU");
    } else {
      debugPrint("NÃO PASSOU");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 231, 218, 170),
        appBar: AppBar(
          title: const Text("Atualizar Dados"),
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            height: MediaQuery.sizeOf(context).height -
                MediaQuery.of(context).padding.top -
                56,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //FORM SENHA ANTIGA
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: _user,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelText: "Novo Usuário",
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(240, 7, 1, 1), fontSize: 20),
                  ),
                ),

                TextFormField(
                  textAlign: TextAlign.center,
                  controller: _email,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelText: "Novo Email",
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(240, 7, 1, 1), fontSize: 20),
                  ),
                ),

                TextFormField(
                    textAlign: TextAlign.center,
                    controller: _telephone,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: "Novo Telefone",
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(240, 7, 1, 1), fontSize: 20),
                    )),

                ElevatedButton(
                    onPressed: () {
                      _atualizarDados();
                    },
                    child: const Text("Atualizar Dados"))
              ],
            ),
          ),
        ));
  }
}
