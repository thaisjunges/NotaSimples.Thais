//import 'package:abo_rs/screens/configuracoes.dart';
import 'package:flutter/material.dart';
import 'package:nota_simples/main.dart';
import '../screens/teste.dart';
import '../screens/update_user.dart';
import '../screens/webview.dart';

class MenuLateral extends StatefulWidget {
  const MenuLateral({super.key});

  @override
  State<MenuLateral> createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          //IMAGEM MENU LATERAL
          //Image.asset("images/uni_abo_logo.png", width: 100, height: 50,),
          DrawerHeader(
            child: Image.asset("images/logo_ns.png"),
          ),

          //SUPORTE
          const ListTile(
              title: Text(
                  style: TextStyle(fontSize: 30, color: Colors.black),
                  "Ajuda")),

          const Padding(padding: EdgeInsets.all(5)),

          ListTile(
            title: const Text(
              "Suporte",
              style: TextStyle(color: Colors.black),
            ),
            leading: const Icon(Icons.support_agent),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const WebView(
                      title: "Suporte",
                      url: "https://invia.com.br/cert/suporte.html")));
            },
          ),

          //CLASSIFICADOS - ANÚNCIOS
          ListTile(
            title: const Text(
                style: TextStyle(color: Colors.black), "Configurações"),
            leading: const Icon(Icons.settings),
            onTap: () {
              /*Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const Configuracoes()),
              );*/
            },
          ),
          ListTile(
            title: const Text(
                style: TextStyle(color: Colors.black), "Atualizar Dados"),
            leading: const Icon(Icons.edit),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AtualizarDados()),
              );
            },
          ),
          ListTile(
            title: const Text(style: TextStyle(color: Colors.black), "Logout"),
            leading: const Icon(Icons.logout),
            onTap: () {
              //Navigator.of(context).push(
              //MaterialPageRoute(builder: (_) => MyApp()),
              //);
            },
          )
        ],
      ),
    );
  }
}
