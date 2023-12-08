import 'dart:convert';
//import 'package:Nota_Simples/src/db_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:nota_simples/main.dart';
import 'package:nota_simples/screens/teste.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Menu.dart';

class Login extends StatefulWidget {
  final String? senha;
  final String? usuario;
  const Login({super.key, this.senha, this.usuario});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //RECUPERANDO USUARIO,SENHA
  final TextEditingController _usuario = TextEditingController();
  final TextEditingController _senha = TextEditingController();

  //COMUNICACAO ASSINCRONA
  void _requisicaoLogin() async {
    EasyLoading.show(status: "Carregando...");
    EasyLoading.instance.displayDuration = const Duration(milliseconds: 2000);

    //RECUPERANDO DADOS DIGITADOS
    String usuarioDigitado = _usuario.text;
    String senhaDigitada = _senha.text;

    //ROTA LOGIN : ENDPOINT
    String url = "https://invianf.com.br/ws/appNotaSimples/login.php";
    http.Response response;

    //JSON DE CHAMADA
    Map<String, String> body = {
      "apiPassword": "4pZqfXa3r88SW3aPr",
      "appUsername": usuarioDigitado,
      "appPassword": senhaDigitada
    };

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    //AWAIT PARA AGUARDAR O RESPONSE
    response = await http.post(Uri.parse(url),
        body: json.encode(body), headers: headers);

    if (kDebugMode) {
      print(response.body);
    }

    Map<String, dynamic> resposta = json.decode(response.body);
    if (resposta["StatusCode"] == "200") {
      /*String usuario = resposta["Usuario"];
      String email = resposta["Email"];
      String telefone = resposta["Telefone"];
      String userId = resposta["UserID"];
      String ibge = resposta["ibge"];*/

      //Salvar no banco de dados local
      //DatabaseHelper.createCliente(resposta['telefoneTOMADOR']);

      // SALVANDO o userId com o SharedPereferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("UserId", resposta["UserID"]);

      EasyLoading.dismiss();
      Navigator.push(
          context,
          //
          MaterialPageRoute(
            builder: ((context) => HomeScreen()),
          ));
    } else {
      {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Usuario inexistente ou Senha invalida")));
        EasyLoading.dismiss();
      }
    }
  }

  @override
  void initState() {
    if (widget.senha != null && widget.usuario != null) {
      _senha.text = widget.senha!;
      _usuario.text = widget.usuario!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela Login")
          //backgroundColor: ,
          ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.3,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 247, 140, 53),
                    Color.fromARGB(255, 243, 164, 61)
                  ],
                ),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(70)),
              ),
              child: ClipRRect(
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(90)),
                  child: Image.asset("images/logo_ns.png")),
            ),

            const SizedBox(
              height: 40,
            ),

            //TEXTO USUÁRIO
            TextFormField(
              textAlign: TextAlign.center,
              controller: _usuario,
              keyboardType: TextInputType.text,
              //textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: "Usuário",
                //hintText: "Insira sua senha",
                labelStyle: const TextStyle(
                    color: Color.fromARGB(240, 7, 1, 1), fontSize: 20),
              ),
            ),

            //Padding(padding: EdgeInsets.all(20)),

            const SizedBox(
              height: 40,
            ),

            //const Padding(padding: EdgeInsets.all(25)),

            //TEXTO SENHA
            TextFormField(
                textAlign: TextAlign.center,
                controller: _senha,
                keyboardType: TextInputType.number,
                //textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelText: "Senha",
                  //hintText: "Insira sua senha",
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(240, 7, 1, 1), fontSize: 20),
                ),
                obscureText: true),

            const Padding(padding: EdgeInsets.all(20)),

            //BOTÃO LOGIN
            FloatingActionButton.extended(
              onPressed: () {
                _requisicaoLogin();
              },
              icon: const Icon(Icons.login),
              label: const Text("Login"),
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),

            /*OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 76, 129, 235)),
                onPressed: () {
                  _requisicaoLogin();
                },
                //TEXTO LOGIN
                child: const Text("Login")),
            const Padding(padding: EdgeInsets.all(10)),
            //Text(_sucesso),
          ],*/
          ])),
    );
  }
}
