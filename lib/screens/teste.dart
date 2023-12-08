import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:nota_simples/screens/homePage.dart';
import 'package:nota_simples/widgets/admob.dart';
import 'cadastrar_servico.dart';
import 'cadastro_clientes.dart';
import 'list_customers.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 450,
                  height: 250,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'images/logo_ns.png',
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                ),
                /*ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.account_circle_rounded),
                  title: const Text('Profile'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.favorite),
                  title: const Text('Favourites'),
                ),*/
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                ),
                const Spacer(),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nota Simples'),
          backgroundColor: Colors.orange,
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Clientes()));
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
            //PROPAGANDA
            const Admobwidget(),
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
            const Admobwidget(),
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
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
