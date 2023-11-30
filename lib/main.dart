import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:codition_tempo/CardImagem.dart';
import 'package:codition_tempo/CardPrincipal.dart';
import 'package:codition_tempo/CardSemanal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const HomeMaterial(),
    );
  }
}

class HomeMaterial extends StatefulWidget {
  const HomeMaterial({Key? key}) : super(key: key);

  @override
  State<HomeMaterial> createState() => _HomeMaterialState();
}

class _HomeMaterialState extends State<HomeMaterial> {
  late Future<Map<String, dynamic>> dadosTemp;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dadosTemp = getDadosPorCidade('São Paulo, SP');
  }

  Future<Map<String, dynamic>> getDadosPorCidade(String cidade) async {
    print("get dados por cidade");
    try {
      final resposta = await http.get(
        Uri.parse(
          'https://api.hgbrasil.com/weather?key=9d972e7c&city_name=$cidade',
        ),
      );

      if (resposta.statusCode != HttpStatus.ok) {
        throw 'Erro de conexão';
      }

      final data = jsonDecode(resposta.body);

      print(data['results']);

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: 'Buscar...',
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  dadosTemp = getDadosPorCidade(searchController.text);
                });
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: dadosTemp,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          final data = snapshot.data!;

          final dados = data['results'];

          final previsaoSemanal = dados['forecast'];

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardPrincipal(
                  descricao: dados['description'] ?? '',
                  temp: "${dados['temp']}º",
                  cidade: "${dados['city']}" ?? '',
                  date: "${dados['date']}" ?? '',
                  iconeCondicao: CardImagem(
                    condicao: dados['condition_slug'] ?? '',
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Previsão Semanal',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (int i = 0; i < 7; i++)
                        CardSemanal(
                          diaSemana: previsaoSemanal[i]['weekday'] ?? '',
                          descricao: previsaoSemanal[i]['description'] ?? '',
                          temp:
                              "${previsaoSemanal[i]['max']}º / ${previsaoSemanal[i]['min']}º",
                          date: previsaoSemanal[i]['date'] ?? '',
                          iconeCondicao: CardImagem(
                            condicao: previsaoSemanal[i]['condition'] ?? '',
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
