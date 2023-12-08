/*import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmitirNota extends StatefulWidget {
  const EmitirNota({super.key});

  @override
  State<EmitirNota> createState() => _EmitirNotaState();
}

class _EmitirNotaState extends State<EmitirNota> {
  String urlEmissao = "https://homologacao.focusnfe.com.br/v2/nfse?ref=01";
  late http.Response response;

  Set body = {
    {
      "data_emissao": "2017-09-21T22:15:00",
      "prestador": {
        "cnpj": "07808224000173",
        "inscricao_municipal": "12345",
        "codigo_municipio": "3516200"
      },
      "tomador": {
        "cnpj": "07808224000173",
        "razao_social": "PERONDI & FERREIRA LTDA",
        "email": "contato@focusnfe.com.br",
        "endereco": {
          "logradouro": "Rua Dias da Rocha Filho",
          "numero": "999",
          "complemento": "Prédio 04 - Sala 34C",
          "bairro": "Alto da XV",
          "codigo_municipio": "4106902",
          "uf": "PR",
          "cep": "80045165"
        }
      },
      "servico": {
        "aliquota": 3,
        "discriminacao": "Nota fiscal referente a serviços prestados",
        "iss_retido": "false",
        "item_lista_servico": "0107",
        "codigo_tributario_municipio": "620910000",
        "valor_servicos": 1.0
      }
    }

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    }

    response = await http.post(Uri.parse(url),
        body: json.encode(body), headers: headers);
  };

  Map<String, dynamic> resposta = json.decode(response.body);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emitir Nota"),
      ),
    );
  }
}*/
