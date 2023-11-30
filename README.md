# App de Previsão Meteorológica

Um aplicativo Flutter simples para verificar a previsão meteorológica, usando a API [HGBrasil Weather](https://console.hgbrasil.com/documentation/weather).

## Capturas de Tela


<img src="https://github.com/JGMeneses/previsao_metorologica/blob/main/lib/img/condicaotempo.jpg" alt="Imagem de Capa" width="300">

## Funcionalidades

- Consulta de previsão meteorológica com base na localização
- Exibição da condição atual e previsão semanal

## Como Executar

Certifique-se de ter o Flutter instalado em sua máquina.

1. Clone o repositório:

```bash
git clone https://github.com/seu-usuario/nome-do-repositorio.git

## Para conseguir acessar a API você tem que criar uma conta e criar uma chave no link:
https://console.hgbrasil.com/documentation/weather

Depois disso terá que ir no main.dart e adicionar onde tem 'SUACHAVE' a chave fornecida pelo site.

Future<Map<String, dynamic>> getDadosPorCidade(String cidade) async {
    print("get dados por cidade");
    try {
      final resposta = await http.get(
        Uri.parse(
          'https://api.hgbrasil.com/weather?key=SUACHAVE_name=$cidade',
        ),
      );



