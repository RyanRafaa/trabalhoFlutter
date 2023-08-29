// Importando as bibliotecas necessárias
import 'dart:convert'; // Biblioteca para lidar com codificação e decodificação de JSON.
import 'package:uniflixx/model/filme.dart'; // Importando a classe Filme do seu modelo.

// Definindo a classe FilmeApi
class FilmeApi {
  // Uma string que simula a resposta da API em formato JSON.
  String respostaApi = '''
    [
      {
          "id": 1,
          "titulo": "Homem de Ferro 2",
          "resumo":"Filme do Homem de Ferro",
          "atores":"Robert Downey",
          "capa":"https://upload.wikimedia.org/wikipedia/pt/0/00/Iron_Man_poster.jpg",
          "duracao":140
      },
      {
          "id": 2,
          "titulo": "Super Man",
          "resumo":"Filme do Super Man",
          "atores":"Henry Cavill",
          "capa":"https://cinema10.com.br/upload/noticias/2019-2/4144d07d8f.jpeg",
          "duracao":140
      },
      {
          "id": 2,
          "titulo": "Bataman",
          "resumo":"Filme do Batman",
          "atores":"Christian Bale",
          "capa":"https://cinepop.com.br/wp-content/uploads/2022/01/batman-4-e1643232722596.jpg",
          "duracao":120
      },
      {
          "id": 2,
          "titulo": "Mulher Maravilha",
          "resumo":"Filme da Mulher Maravilha",
          "atores":"Gal Gadot",
          "capa":"https://uploads.metropoles.com/wp-content/uploads/2017/05/31153627/wonder-woman-gal-gadot-hi-res2.jpg",
          "duracao":160
      }

    ]
    ''';
  // Definindo um método assíncrono para buscar filmes offline.
  Future<List<Filme>> getFilmesOffline() async {
    // Decodificando a string JSON para um objeto Dart.
    final json = jsonDecode(respostaApi);

    // Convertendo os objetos JSON em List<Map<String, dynamic>>.
    final mapsFilme = json.cast<Map<String, dynamic>>();

    // Criando uma lista vazia para armazenar os objetos Filme.
    List<Filme> listFilmes = [];

    // Iterando por cada mapa de filme e convertendo em objetos Filme.
    for (var map in mapsFilme) {
      Filme filme = Filme.fromJson(map);
      listFilmes.add(filme);
    }

    // Delay simulado de 1 segundo (para simular o tempo de resposta da API).
    await Future.delayed(const Duration(seconds: 1));

    // Retornando a lista de filmes após o processo.
    return listFilmes;
  }
}
