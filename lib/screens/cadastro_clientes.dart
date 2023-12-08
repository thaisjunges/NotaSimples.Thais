import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:muskey/muskey.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'list_customers.dart';

class CadastroClientes extends StatefulWidget {
  const CadastroClientes({Key? key}) : super(key: key);

  @override
  State<CadastroClientes> createState() => _CadastroClientesState();
}

class _CadastroClientesState extends State<CadastroClientes> {
  _CadastroClientesState();

  //CEP
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _logController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _neighborhoodController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _ibgeController = TextEditingController();
  final TextEditingController _paisdefinido = TextEditingController();
  final TextEditingController _coddefinido = TextEditingController();
  final TextEditingController _complemento = TextEditingController();
  bool isJuridica = false;
  final TextEditingController _cpfTomador = TextEditingController();
  final TextEditingController _cnpjTomador = TextEditingController();
  final TextEditingController _municipal = TextEditingController();
  final TextEditingController _razaoSocial = TextEditingController();
  final TextEditingController _nomeTomador = TextEditingController();
  final TextEditingController _estadual = TextEditingController();
  final TextEditingController _numero = TextEditingController();
  final TextEditingController _ddd = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _telefone = TextEditingController();
  final TextEditingController _celular = TextEditingController();
  String _userId = '';

  _validarCnpj() async {
    final String cnpjTomador1 = _cnpjTomador.text.replaceAll(".", "");
    final String cnpjTomador2 = cnpjTomador1.replaceAll("/", "");
    final String cnpjTomador3 = cnpjTomador2.replaceAll("-", "");
    final String cnpjTomador4 = cnpjTomador3.replaceAll(" ", "");
    final String telefone1 = _telefone.text.replaceAll("(", "");
    final String telefone2 = telefone1.replaceAll(")", "");
    final String telefone3 = telefone2.replaceAll("-", "");
    final String telefone4 = telefone3.replaceAll(" ", "");
    final String ddd1 = _ddd.text.replaceAll(")", "");
    final String ddd2 = ddd1.replaceAll("(", "");
    final String cep1 = _cepController.text.replaceAll("-", "");

    String url =
        "https://invianf.com.br/ws/appNotaSimples/cadastrarClientes.php";
    http.Response response;

    // Recuperar o UserId pelo SharedPreferences

    Map<String, String> body = {
      "apiPassword": "4pZqfXa3r88SW3aPr",
      "user_id": _userId,
      "CpfCnpjTomador": cnpjTomador4,
      "RazaoSocialTomador": _razaoSocial.text,
      "InscricaoEstadualTomador": _estadual.text,
      "InscricaoMunicipalTomador": _municipal.text,
      "TipoLogradouroTomador": "",
      "EnderecoTomador": _logController.text,
      "NumeroTomador": _numero.text,
      "ComplementoTomador": _complemento.text,
      "BairroTomador": _neighborhoodController.text,
      "CodigoCidadeTomador": _ibgeController.text,
      "DescricaoCidadeTomador": _cityController.text,
      "UfTomador": _stateController.text,
      "CepTomador": cep1,
      "PaisTomador": _paisdefinido.text,
      "DDDTomador": ddd2,
      "TelefoneTomador": telefone4,
      "EmailTomador": _email.text
    };

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    response = await http.post(Uri.parse(url),
        body: json.encode(body), headers: headers);

    if (kDebugMode) {
      print(response.body);
    }

    Map<String, dynamic> resposta = json.decode(response.body);
    if (resposta["StatusCode"] == "200") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color.fromARGB(87, 54, 206, 244),
          content: Text("Cliente cadastrado")));
      if (mounted) {
        EasyLoading.dismiss();
        Navigator.push(
            context,
            //
            MaterialPageRoute(
              builder: ((context) => const Clientes()),
            ));
      } else {
        {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.red, content: Text("Não cadastrado")));
          EasyLoading.dismiss();
        }
      }
    } else {
      debugPrint("Erro ao cadastrar");
    }
  }

  Future<dynamic> _recuperar() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userId = prefs.getString("UserId")!;
    });
    if (kDebugMode) {
      print("Visualizar ID $_userId");
    }
  }

  _validarCpf() async {
    final String cpfTomador1 = _cpfTomador.text.replaceAll("-", "");
    final String cpfTomador2 = cpfTomador1.replaceAll(".", "");
    final String telefone1 = _telefone.text.replaceAll("(", "");
    final String telefone2 = telefone1.replaceAll(")", "");
    final String telefone3 = telefone2.replaceAll("-", "");
    final String telefone4 = telefone3.replaceAll(" ", "");
    final String ddd1 = _ddd.text.replaceAll("(", "");
    final String ddd2 = ddd1.replaceAll(")", "");
    final String cep1 = _cepController.text.replaceAll("-", "");

    //String telefone4 = _telefone.text ?? "";

    String url =
        "https://invianf.com.br/ws/appNotaSimples/cadastrarClientes.php";
    http.Response response;

    Map<String, String> body = {
      "apiPassword": "4pZqfXa3r88SW3aPr",
      "user_id": _userId,
      "CpfCnpjTomador": cpfTomador2,
      "RazaoSocialTomador": _nomeTomador.text,
      "TipoLogradouroTomador": "",
      "EnderecoTomador": _logController.text,
      "NumeroTomador": _numero.text,
      "ComplementoTomador": _complemento.text,
      "BairroTomador": _neighborhoodController.text,
      "CodigoCidadeTomador": _ibgeController.text,
      "DescricaoCidadeTomador": _cityController.text,
      "UfTomador": _stateController.text,
      "CepTomador": cep1,
      "PaisTomador": _paisdefinido.text,
      "DDDTomador": ddd2,
      "TelefoneTomador": telefone4,
      "EmailTomador": _email.text
    };

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    response = await http.post(Uri.parse(url),
        body: json.encode(body), headers: headers);

    if (kDebugMode) {
      print(response.body);
      print("TelefoneTomador$telefone4");
    }

    Map<String, dynamic> resposta = json.decode(response.body);
    if (resposta["StatusCode"] == "200") {
      if (mounted) {
        EasyLoading.dismiss();
        if (kDebugMode) {
          print("TelefoneTomador$telefone4");
        }
        Navigator.push(
            context,
            //
            MaterialPageRoute(
              builder: ((context) => const Clientes()),
            ));
      } else {
        {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.red, content: Text("Não cadastrado")));
          EasyLoading.dismiss();
        }
      }
    } else {
      debugPrint("Erro ao cadastrar");
    }
  }

  // CEP
  _recuperarCep() async {
    //EasyLoading.show(status: "Carregando...");

    String cepDigitado = _cepController.text;
    String url = 'https://viacep.com.br/ws/$cepDigitado/json/';
    http.Response response;

    response = await http.get(Uri.parse(url));
    Map<dynamic, dynamic> retorno = json.decode(response.body);

    setState(() {
      _stateController.text = retorno["uf"];
      _cepController.text = retorno["cep"];
      _logController.text = retorno["logradouro"];
      _cityController.text = retorno["localidade"];
      _neighborhoodController.text = retorno["bairro"];
      _ibgeController.text = retorno["ibge"];
      //_telefoneApi.text = retorno["telfone"];
      //_paisdefinido.text = TextEditingController(text: "Brasil") as String;
    });
  }

  // PRÉ DEFINIDO

  @override
  void initState() {
    _paisdefinido.text = "Brasil";
    _coddefinido.text = "1058";
    _recuperar();
    // QUANDO REDIRECIONAR PARA A SEGUNDA TELA VAI CHAMAR A FUNÇÃO
    super.initState();
  }

  //OPÇÕES DO DROPDOWN
  final List<String> items = ['Pessoa Física', 'Pessoa Jurídica'];
  String? selectedValue;

  //ERRO PARA INSERIR CNPJ,CPF,TELEFONE
  final _formKey = GlobalKey<FormState>();
  //CRIAÇÃO DA MASCARA CELULAR

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cadastro de Clientes"),
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*const Text(
                      "Cadastrar Novo Cliente",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                      //textAlign: TextAlign.center,
                    ),*/

                    //DROPDOWN
                    DropdownButton2(
                      isExpanded: true,
                      hint: const Row(
                        children: [
                          //STYLE BOTÃO
                          /*SizedBox(
                width: 6,
              ),*/
                          Expanded(
                            child: Text(
                              'Clique para selecionar',
                              style: TextStyle(
                                fontSize: 14,
                                //fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),

                              //DEIXAR TEXTO EM COLUMN OU ROW
                              //overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: items
                          //UTILIZANDO O MÉTODO MAP PARA TRANSFORMAR CADA ELEMENTO DA LISTA EM DROPDOWN
                          .map((String item) => DropdownMenuItem<String>(
                                //DEFININDO O VALOR A CADA OPÇÃO DO MENU SUSPENSO
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),

                                  //CASO EXCEDA O ESPAÇO O TEXTO VAI APARECER COM RETICÊNCIAS(..)
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          //REALIZA A CONVERSÃO DO ITERÁVEL RETORNADO PELO MAP EM UMA LISTA DROPDOWN
                          .toList(),

                      //DEFINE A OPÇÃO SELECIONADA
                      value: selectedValue,
                      //ONCHANGED É UM CALLBACK QUE É ACIONADO QUANDO A OPÇÃO DO DROPDOWN É SELECIONADA
                      onChanged: (String? value) {
                        if (value == 'Pessoa Jurídica') {
                          setState(() {
                            isJuridica = true;
                            //DEIXAR COMO NULO O QUE FOI DIGITADO ANTERIORMENTE
                            _cpfTomador.clear();
                            _numero.clear();
                            _celular.clear();
                            _telefone.clear();
                            _email.clear();
                            _ddd.clear();
                          });
                        } else {
                          setState(() {
                            isJuridica = false;
                            _cnpjTomador.clear();
                            _numero.clear();
                            _celular.clear();
                            _telefone.clear();
                            _email.clear();
                            _ddd.clear();
                          });
                        }
                        //SETSTATE É PARA ATUALIZAR O ESTADO DO WIDGET ATUAL E RECONSTRUÍ-LO
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 50,
                        width: 160,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: const Color.fromARGB(137, 255, 255, 255)),
                        elevation: 2,
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.yellow,
                        iconDisabledColor: Colors.grey,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: const Color.fromARGB(137, 255, 255, 255)),
                        offset: const Offset(-20, 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all<double>(6),
                          thumbVisibility:
                              MaterialStateProperty.all<bool>(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),

                    //SE FOR TRUE APARECE O CAMPO CNPJ
                    isJuridica
                        ? TextFormField(
                            controller: _cnpjTomador,
                            validator: (value) {
                              if (value!.length < 14) {
                                return "CNPJ incompleto";
                              } else if (value == "") {
                                return "Digite o CNPJ";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            //maxLength: 14,
                            decoration:
                                const InputDecoration(labelText: "CNPJ :"),
                            inputFormatters: [
                              MuskeyFormatter(
                                masks: ["##.###.###/####-##"],
                                decorators: ['.', '/', '-'],
                                overflow: OverflowBehavior(
                                  allowed: false,
                                  overflowOn: RegExp('[0-9]'),
                                ),
                              )
                            ],
                          )
                        :

                        //SE NÃO APARECE CPF
                        TextFormField(
                            controller: _cpfTomador,
                            validator: (value) {
                              if (value!.length < 11) {
                                return "CPF incompleto";
                              } else if (value == "") {
                                return "Digite o CPF";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            //maxLength: 11,
                            decoration: const InputDecoration(
                              labelText: "CPF",
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 122, 84, 84)),
                            ),
                            inputFormatters: [
                              MuskeyFormatter(
                                masks: ["###.###.###-##"],
                                decorators: ['.', '-'],
                                overflow: OverflowBehavior(
                                  allowed: false,
                                  overflowOn: RegExp('[0-9]'),
                                ),
                              )
                            ],
                          ),

                    TextFormField(
                      validator: (valor) {
                        final RegExp emailRegex = RegExp(
                            r"^[a-z0-9.]+@[a-z0-9]+\.[a-z]+$",
                            caseSensitive:
                                false); // O 'i' no final torna a expressão regular case-insensitive.
                        if (valor != null && emailRegex.hasMatch(valor)) {
                          return null;
                        } else {
                          return "Email inválido";
                        }
                      },
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(labelText: "Email"),
                    ),
                    TextFormField(
                      controller: _nomeTomador,
                      validator: (value) {
                        if (value!.length < 5) {
                          return "Nome não informado";
                        } else if (value == "") {
                          return "Digite o Nome do Tomador";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          labelText: "Nome do Titular",
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 122, 84, 84))),
                    ),

                    const Padding(padding: EdgeInsets.all(20)),
                    //SE FOR TRUE
                    isJuridica
                        ? const Text(
                            "Dados Fiscais",
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 20),
                          )
                        :

                        //SE FOR TRUE
                        isJuridica
                            ? TextFormField(
                                validator: (value) {
                                  if (value!.length == 11) {
                                    return "Inscrição Estadual incorreta";
                                  } else if (value == "") {
                                    return "Digite a Inscrição Estadual";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: _estadual,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    labelText: "Inscrição Estadual",
                                    labelStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 122, 84, 84))),
                                inputFormatters: [
                                  MuskeyFormatter(
                                    masks: ["######.##-##"],
                                    decorators: ['.', '-'],
                                    overflow: OverflowBehavior(
                                      allowed: false,
                                      overflowOn: RegExp('[0-9]'),
                                    ),
                                  )
                                ],
                              )
                            : Container(),

                    isJuridica
                        ? TextFormField(
                            validator: (value) {
                              if (value!.length == 13) {
                                return "Inscrição Municipal incorreta";
                              } else if (value == "") {
                                return "Digite a Inscrição Municipal";
                              } else {
                                return null;
                              }
                            },
                            controller: _municipal,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                labelText: "Inscrição Municipal"),
                            inputFormatters: [
                              MuskeyFormatter(
                                masks: ["###/########"],
                                decorators: ['/'],
                                overflow: OverflowBehavior(
                                  allowed: false,
                                  overflowOn: RegExp('[0-9]'),
                                ),
                              )
                            ],
                          )
                        : Container(),

                    const Padding(padding: EdgeInsets.all(20)),

                    const Text(
                      "Dados de Contato",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),

                    const Padding(padding: EdgeInsets.all(20)),

                    //ddd
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _ddd,
                      maxLength: 2,
                      decoration: const InputDecoration(
                          labelText: "DDD", hintText: "DDD"),
                      inputFormatters: [
                        /*MuskeyFormatter(
                          //masks: ["(##)"],
                          //decorators: [')'],
                          overflow: OverflowBehavior(
                            allowed: true,
                            overflowOn: RegExp('[0-9]'),
                          ),
                          
                        )*/
                      ],
                    ),

                    TextFormField(
                      /*validator: (value) {
                        if (value!.length < 11) {
                          return "Telefone incorreto";
                        } else if (value == "") {
                          return "Digite um telefone válido";
                        }
                        return null;
                      },*/
                      //readOnly: false,
                      keyboardType: TextInputType.phone,
                      controller: _telefone,
                      decoration: const InputDecoration(
                          labelText: "Telefone", hintText: "Digite seu numero"),
                      inputFormatters: [
                        MuskeyFormatter(
                          masks: [
                            "#####-####",
                            "####-####",
                          ],
                          overflow: OverflowBehavior(
                            allowed: false,
                            overflowOn: RegExp('[0-9]'),
                          ),
                        )
                      ],
                    ),

                    const Padding(padding: EdgeInsets.all(20)),

                    const Text(
                      "Endereço",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),

                    //CEP
                    TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _cepController,
                        decoration: const InputDecoration(labelText: "CEP"),
                        inputFormatters: [
                          MuskeyFormatter(
                            masks: ["#####-###"],
                            overflow: OverflowBehavior(
                              allowed: false,
                              overflowOn: RegExp('[0-9]'),
                            ),
                          )
                        ]),

                    //PROCURAR CEP
                    ElevatedButton(
                        onPressed: () {
                          _recuperarCep();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 3, 63, 119)),
                        child: const Text("Procurar CEP")),

                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _logController,
                      decoration:
                          const InputDecoration(labelText: "Logradouro"),
                    ),

                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Insira o Numero";
                        }
                        return null;
                      },
                      controller: _numero,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: "Numero"),
                    ),

                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration:
                          const InputDecoration(labelText: "Complemento"),
                    ),

                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _neighborhoodController,
                      decoration: const InputDecoration(labelText: "Bairro"),
                    ),

                    TextFormField(
                      //keyboardType: TextInputType.text,
                      controller: _paisdefinido,
                      decoration: const InputDecoration(labelText: "País"),
                    ),

                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _coddefinido,
                      decoration: const InputDecoration(labelText: "Cod.País"),
                    ),

                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _ibgeController,
                      decoration: const InputDecoration(labelText: "IBGE"),
                    ),

                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _stateController,
                      decoration: const InputDecoration(labelText: "UF"),
                    ),

                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _cityController,
                      decoration: const InputDecoration(labelText: "Cidade"),
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    ElevatedButton(
                      onPressed: () {
                        //VALIDAÇÃO FORMULARIO
                        if (_formKey.currentState!.validate()) {
                          isJuridica ? _validarCnpj() : _validarCpf();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("ERRO")));
                        }
                      },
                      child: const Text("Cadastrar"),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(32)),
              ]),
            )));
  }
}
