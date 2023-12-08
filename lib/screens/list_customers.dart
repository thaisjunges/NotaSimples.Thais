import 'dart:convert';
//import 'package:abo_rs/screens/cadastro_clientes.dart';
import 'package:animated_floating_buttons/widgets/animated_floating_action_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import "package:abo_rs/Utils/constants.dart";
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shared_preferences/shared_preferences.dart';

import 'cadastro_clientes.dart';

class Clientes extends StatefulWidget {
  const Clientes({super.key});

  @override
  State<Clientes> createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  Widget float1() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const CadastroClientes()));
        },
        heroTag: "btn1",
        tooltip: 'First button',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget float2() {
    return Container(
      child: const FloatingActionButton(
        onPressed: null,
        heroTag: "btn2",
        tooltip: 'Second button',
        child: Icon(Icons.edit),
      ),
    );
  }

  //CONTROLLER DO ENDEREÇO
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _logController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _neighborhoodController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _ibgeController = TextEditingController();
  final TextEditingController _paisdefinido = TextEditingController();
  final TextEditingController _coddefinido = TextEditingController();
  final TextEditingController _cliIdController = TextEditingController();
  //final TextEditingController _telefoneController = TextEditingController();
  var results = [];
  String? _userId = '';

  Future<void> recuperarDados() async {
    //ENDPOINT
    String url = "https://invianf.com.br/ws/appNotaSimples/listarClientes.php";
    http.Response response;

    //JSON CHAMADA
    Map<String, String> body = {
      "apiPassword": "4pZqfXa3r88SW3aPr",
      "UserID": _userId!
    };

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    //AGUARDAR O RESPONSE
    response = await http.post(Uri.parse(url),
        body: json.encode(body), headers: headers);

    if (kDebugMode) {
      print(response.body);
    }

    //final responseB = await response.body.readAsString();
    Map<String, dynamic> resposta = json.decode(response.body);
    if (resposta["StatusCode"] == "200") {
      setState(() {
        results = resposta["Results"];
        debugPrint(results[0]["cli_id"].toString());
        EasyLoading.dismiss();
      });
      debugPrint(resposta["RazaoSocialTomador"]);
      debugPrint("Length ${results.length}");
      //debugPrint("recuperar ${recuperarDados()}");
      //debugPrint("user_ID $_userId");
    } else {
      debugPrint("NÃO SUCESSO");
    }
  }

  //RECUPERANDO O VALOR DA CHAVE (USERID) UTILIZANDO SHARED PREFERNCES
  _recuperar() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userId = prefs.getString("UserId");
    });
    //debugPrint("Shared $_userId");
  }

  @override
  void initState() {
    _recuperar();
    recuperarDados();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Clientes"),
          backgroundColor: Colors.orange,
          //backgroundColor: corPrincipal,
        ),
        body: ListView.separated(
          itemCount: results.length,
          itemBuilder: (BuildContext context, int index) {
            //String cpfCnpj = results![index]["CpfCnpjTomador"];
            //VERIFICANDO SE RESULTS É NULO
            //SE FOR NULO
            if (results[index]["TelefoneTomador"] == null) {
              return Container();
            }

            return ListTile(
              leading: badges.Badge(
                badgeContent: Text(results[index]["cli_id"]),
                child: Image.asset("images/mulher.png"),
              ) /*Image.asset("images/mulher.png")*/,
              title: /*Text(results[index]["DDDTomador"] +
                        results[index]["TelefoneTomador"]),*/
                  Text(results[index]["RazaoSocialTomador"] +
                      "\n" +
                      results[index]["CpfCnpjTomador"] +
                      "\n" +
                      results[index]["DescricaoCidadeTomador"]),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AnimatedFloatingActionButton(
              //Fab list
              fabButtons: <Widget>[float1(), float2()],
              //key : key,
              colorStartAnimation: const Color.fromARGB(255, 177, 132, 37),
              colorEndAnimation: Colors.red,
              animatedIconData: AnimatedIcons.menu_close //To principal button
              ),
        ),

        /*floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const CadastroClientes()));
          },
        ),*/
        //bottomNavigationBar: BottomAppBar(child: Container(height: 50.0)),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked);
  }
}
