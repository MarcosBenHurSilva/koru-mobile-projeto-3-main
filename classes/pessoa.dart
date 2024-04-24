import 'enums.dart';

class Pessoa {
  final String nome;
  late int idade;
  final String cpf;
  final DateTime dataDeNascimento;
  final Genero genero;

  Pessoa({
    required this.genero,
    required this.nome,
    required this.dataDeNascimento,
    required this.cpf,
  }) {
    idade = _calcularIdade();
  }
  // O método deve verificar se a pessoa é maior de idade.
  // Caso seja, realizar um print dizendo a idade da pessoa e que ela é maior de idade.
  // Caso não haja, realizar um print dizendo a idade da pessoa e que ela é menor de idade.
  void maiorIdade() {
    if (idade >= 18) {
      print('$nome tem $idade anos, portanto é maior de idade.');
    } else {
      print('$nome tem $idade anos, portanto é menor de idade.');
    }
  }

  // O método deve receber um parâmetro do tipo String, que representa a fala da pessoa, e realizar um print dessa fala.
  void falar(String mensagem) {
    print("$nome diz: $mensagem");
  }

  // O método deve calcular a idade da pessoa com base na data atual e na sua data de nascimento.
  int _calcularIdade() {
    final DateTime dataAtual = DateTime.now();
    int idade = dataAtual.year - dataDeNascimento.year;
    if (dataAtual.month < dataDeNascimento.month ||
        (dataAtual.month == dataDeNascimento.month &&
            dataAtual.day < dataDeNascimento.day)) {
      idade--;
    }
    return idade;
  }

  // O método deve receber um parâmetro do tipo Humor, que será um dos humores escritos no enum Humor.
  void termometroDoHumor(Humor humor) {
    switch (humor) {
      case Humor.feliz:
        print('Que bom que você está feliz hoje, $nome!');
        break;
      case Humor.triste:
        print(
            'Sinto muito que você esteja triste, $nome. Posso te ajudar em algo?');
        break;
      case Humor.ansiosa:
        print('Calma, $nome. Respire fundo e tudo vai dar certo.');
        break;
      default:
        print('Não entendi o seu humor $nome. Tente novamente.');
    }
  }

  @override
  String toString() {
    return 'Nome: $nome | Idade: $idade | CPF: $cpf | Data de Nascimento: $dataDeNascimento | Gênero: $genero';
  }
}
