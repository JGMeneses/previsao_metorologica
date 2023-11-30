import 'package:codition_tempo/CardImagem.dart';
import 'package:flutter/material.dart';

class CardSemanal extends StatelessWidget {
  final String diaSemana; // Adicionado novo parâmetro para o dia da semana
  final CardImagem iconeCondicao;
  final String descricao;
  final String temp;
  final String date;

  const CardSemanal({
    Key? key,
    required this.diaSemana, // Adicionado novo parâmetro para o dia da semana
    required this.descricao,
    required this.temp,
    required this.date,
    required this.iconeCondicao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250, // Ajuste a largura conforme necessário
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                diaSemana,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 100, // Ajuste a largura do ícone
                height: 100, // Ajuste a altura do ícone
                child: iconeCondicao,
              ),
              const SizedBox(height: 8),
              Text(
                temp,
                style: const TextStyle(
                  fontSize: 15, // Ajuste o tamanho da fonte
                ),
              ),
              const SizedBox(height: 5), // Ajuste o espaçamento
              Text(
                descricao,
                style: const TextStyle(
                  fontSize: 10, // Ajuste o tamanho da fonte
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 14, // Ajuste o tamanho da fonte
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
