import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Valores extends StatefulWidget {
  const Valores({super.key});

  @override
  State<Valores> createState() => _ValoresState();
}

class _ValoresState extends State<Valores> {
  //OPÇÃO DROPDOWN NATUREZA DA OPERAÇÃO
  final List<String> cod_operacao = [
    'Tributaçãp no município',
    'Tributação fora do município',
    'Isenção',
    'Imune',
    'Exigibilidade suspensa por decisão judicial',
    'Exigibilidade suspensa por procedimento administrativo'
  ];

  //OPÇÃO DROPDOWN REGIME ESPECIAL TRIBUTAÇÃO
  final List<String> reg_espec_tributacao = [
    'Microempresa municipal',
    'Estimativa',
    'Sociedade de profissionais',
    'Cooperativa',
    'MEI - Simples Nacional',
    'ME EPP- Simples Nacional'
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Serviço"),
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              //key: _formKey,
              child: Column(children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.datetime,
                      decoration:
                          const InputDecoration(labelText: "Data Emissão"),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
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
                              'Natureza da Tributação',
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
                      items: cod_operacao
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
                        if (value == 'Tributação no município') {
                        } else {}
                        //SETSTATE É PARA ATUALIZAR O ESTADO DO WIDGET ATUAL E RECONSTRUÍ-LO
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 50,
                        width: 210,
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
                    const Padding(padding: EdgeInsets.all(10)),

                    //SEGUNDO DROPDOWN
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
                              'Regime Especial de Tributação',
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
                      items: reg_espec_tributacao
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
                        if (value == 'Tributação no município') {
                        } else {}
                        //SETSTATE É PARA ATUALIZAR O ESTADO DO WIDGET ATUAL E RECONSTRUÍ-LO
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 50,
                        width: 210,
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
                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "Optante pelo Simples Nacional",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: "TRUE or FALSE")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "Valor do Serviço",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: "Valor Serviços")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "Deduções",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: "Valor Deduções")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "PIS",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: "Valor Pis")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "COFINS",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: "Valor Cofins")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "INSS",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: "Valor Inss")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "IR",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: "Valor IR")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "CSLL",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: "Valor CSLL")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "ISS Retido",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: "Informar TRUE ou FALSE")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "Valor ISS",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: "Valor ISS")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "ISS Retido",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: "Valor ISS Retido")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "Outras Retenções",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: "Outras retenções")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "Base de Calculo",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: "Base Calculo")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "Alíquota",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: "Aliquota")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "Desconto Incondicionado",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: "Desconto Incondicionado")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "Desconto Condicionado",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: "Desconto Condicionado")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "Código de Tributação do Municipio",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: "Item Lista Serviço")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "CNAE",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: "Codigo CNAE")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "Código Tributario Município",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: "Codigo Tributario Município")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "Discriminação do Serviço",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: "Discriminação do Serviço")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "Codigo do Município",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: "IBGE")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "% Total dos Tributos",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: "Percentual Total dos Tributos")),

                    const Padding(padding: EdgeInsets.all(10)),

                    const Text(
                      "Fonte Total dos Tributos",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: "Fonte Total dos Tributos")),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(32)),
              ]),
            )));
  }
}
