/*import 'package:flutter/material.dart';
import 'package:nota_simples/screens/teste.dart';
import '../services/emitir_note.dart';
import '../widgets/menu_lateral.dart';
import 'cadastrar_servico.dart';
import 'homePage.dart';
import 'list_customers.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        title: const Text("Menu"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const Clientes()));
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10.0,
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                      offset: Offset(5, 5)),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              height: 290,
              //width: width - 36,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: Image.asset("images/cliente.png", width: 100)),
                    //Icon(size: 28.0, FontAwesomeIcons.tooth),
                    const Text(
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        "Cadastre seus clientes e visualize os cadastrados"),
                    const Text(
                        style: TextStyle(
                          fontSize: 22,
                        ),
                        "CLIENTES"),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            /*onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const EmitirNota(),
                ),
              );
            },*/
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10.0,
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                      offset: Offset(5, 5)),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              height: 260,
              //width: width - 36,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        "images/emitir_nfe.png",
                        width: 70,
                      ),
                    ),
                    //Icon(size: 28.0, FontAwesomeIcons.book),
                    const Text(
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        "Emita sua nota agora mesmo"),
                    const Text(
                        style: TextStyle(
                          fontSize: 22,
                        ),
                        "EMITIR NOTA"),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Valores()));
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10.0,
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                      offset: Offset(5, 5)),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              height: 290,
              //width: width - 36,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: Image.asset(
                      "images/servico.png",
                      width: 80,
                    )),

                    //Icon(size: 28.0, FontAwesomeIcons.landmark),
                    const Text(
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        "Cadastre seus serviços"),
                    const Text(
                        style: TextStyle(
                          fontSize: 22,
                        ),
                        "SERVIÇO"),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}*/
