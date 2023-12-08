import 'dart:convert';
//import 'package:abo_rs/Utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

class recuperacaoSenha extends StatefulWidget {
  recuperacaoSenha({super.key, required String senha, required String usuario});

  @override
  State<recuperacaoSenha> createState() => _recuperacaoSenhaState();
}

class _recuperacaoSenhaState extends State<recuperacaoSenha> {
  //INSTANCIANDO CONTROLERS
  final TextEditingController _senhaOld = TextEditingController();
  final TextEditingController _senhaNew = TextEditingController();
  final TextEditingController _senhaConfirm = TextEditingController();
  final TextEditingController _usuario = TextEditingController();

  Future<void> _recuperarSenha() async {
    EasyLoading.show(status: "Carregando...");

    //RECUPERAÇÃO DE INF PASSANDO PARA VARIAVEIS
    String senhaAntiga = _senhaOld.text;
    String senhaNova = _senhaNew.text;
    String senhaConfirmada = _senhaConfirm.text;
    String usuarioDigitado = _usuario.text;

    //ROTA LOGIN : ENDPOINT
    String url = "https://invianf.com.br/ws/appNotaSimples/changePassword.php";

    //JSON DE CHAMADA
    //SENHA ATUAL 123456
    Map<String, String> body = {
      "apiPassword": "4pZqfXa3r88SW3aPr",
      "oldPassword": senhaAntiga,
      "newPassword": senhaNova,
      "confirmPassword": senhaConfirmada,
      "username": usuarioDigitado
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
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  Login(senha: senhaNova, usuario: usuarioDigitado)));
      debugPrint("Senha alterada com sucesso!");
      EasyLoading.dismiss();
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red, content: Text("Senhas não conferem")));
      EasyLoading.dismiss();
      debugPrint("Retorno não foi 200: $retorno");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 231, 218, 170),
        appBar: AppBar(
          title: const Text("Recuperação de Senha"),
          //backgroundColor: corPrincipal,
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
                    controller: _senhaOld,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: "Senha Antiga",
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(240, 7, 1, 1), fontSize: 20),
                    ),
                    obscureText: true),
                TextFormField(
                    textAlign: TextAlign.center,
                    controller: _senhaNew,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: "Senha Nova",
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(240, 7, 1, 1), fontSize: 20),
                    ),
                    obscureText: true),
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: _senhaConfirm,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelText: "Confirmar Senha",
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(240, 7, 1, 1), fontSize: 20),
                  ),
                  obscureText: true,
                ),
                TextFormField(
                    textAlign: TextAlign.center,
                    controller: _usuario,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: "Usuário",
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(240, 7, 1, 1), fontSize: 20),
                    )),
                /* FloatingActionButton.extended(
                  onPressed: () {
                    _recuperarSenha();
                  },
                  label:const Text("Confirmar alteração"),
                  ),*/
                ElevatedButton(
                    onPressed: () {
                      _recuperarSenha();
                    },
                    child: const Text("Confirmar Senha"))
              ],
            ),
          ),
        ));
  }
}
