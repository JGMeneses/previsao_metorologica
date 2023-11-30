import 'package:codition_tempo/CardImagem.dart';
import 'package:flutter/material.dart';

class CardPrincipal extends StatelessWidget {
  final CardImagem iconeCondicao;
  final String descricao;
  final String temp;
  final String cidade;
  final String date;

  const CardPrincipal({
    Key? key,
    required this.descricao,
    required this.temp,
    required this.cidade,
    required this.date,
    required this.iconeCondicao,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
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
                cidade,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: iconeCondicao,
                  ),
                  Text(
                    temp,
                    style: const TextStyle(
                      fontSize: 64,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                descricao,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
