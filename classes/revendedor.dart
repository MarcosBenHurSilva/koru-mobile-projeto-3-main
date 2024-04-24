import 'enums.dart';
import 'pessoa.dart';
import 'produto.dart';

// Essa classe deve ser herdeira da classe Pessoa.
class Revendedor extends Pessoa {
  final String matricula;
  List<Produto> produtosVendidos = [];
  double porcentagemLucro = 0.1;

  Revendedor({
    required String nome,
    required DateTime dataDeNascimento,
    required String cpf,
    required this.matricula,
    required Genero genero,
  }) : super(
          nome: nome,
          dataDeNascimento: dataDeNascimento,
          cpf: cpf,
          genero: genero,
        );

  @override
  // O método continua recebendo o parâmetro do tipo String, que representa a fala da pessoa.
  // Deve-se realizar um print da fala, mas especificando que é um revendedor que está falando.
  void falar(String mensagem) {
    String prefixo;
    switch (genero) {
      case Genero.masculino:
        prefixo = 'Revendedor';
        break;
      case Genero.feminino:
        prefixo = 'Revendedora';
        break;
      case Genero.outro:
        prefixo = 'Pessoa revendedora';
        break;
    }
    print('$prefixo $nome diz: $mensagem');
  }

  // Método responsável por realizar uma venda de um produto.
  // O método deve receber um parâmetro do tipo Produto e então:
  // Chamar o método realizarVenda daquele produto recebido;
  // Adicionar o produto na array de produtos vendidos daquele revendedor.
  void venderProduto(Produto produto) {
    try {
      produto.realizarVenda();
      produtosVendidos.add(produto);
    } catch (e) {
      throw e;
    }
  }

  // Método responsável por calcular e retornar o total em reais vendidos por aquele revendedor.
  // Para isso, deve-se utilizar os dados que estiverem dentro da Array produtosVendidos.
  double calcularTotalVendido() {
    double totalVendido = 0.0;
    for (Produto produto in produtosVendidos) {
      totalVendido += produto.valor * produto.qtdVendida;
    }
    return double.parse(totalVendido.toStringAsFixed(2).replaceAll('.', ','));
  }

  // Método responsável por calcular e retornar o lucro em reais obtido por aquele revendedor.
  // Para isso, deve-se utilizar o dado de porcentagem de lucro daquele vendedor.
  double calcularLucro() {
    double totalLucro = 0.0;
    totalLucro = calcularTotalVendido() * porcentagemLucro;
    return double.parse(totalLucro.toStringAsFixed(2));
  }

  // Método responsável por calcular e retornar a média aritmética em reais dos produtos vendidos por aquele revendedor.
  // Para isso, deve-se utilizar os dados que estiverem dentro da Array produtosVendidos.
  double calcularMediaProdutosVendidos() {
    if (produtosVendidos.isEmpty) {
      return 0.0;
    }

    double totalVendido = calcularTotalVendido();

    return double.parse(
        (totalVendido / produtosVendidos.length).toStringAsFixed(2));
  }

  // Método que utiliza as funções criadas anteriormente e realiza um print do resumo de total vendido, média aritmética e lucro obtido.
  void verResumo() {
    double totalVendido = calcularTotalVendido();
    double lucro = calcularLucro();
    double media = calcularMediaProdutosVendidos();

    print(
      'O total vendido por $nome foi $totalVendido reais e a média aritmética de valor dos produtos vendidos é $media reais. O lucro recebido foi de $lucro reais.',
    );
  }

  @override
  String toString() {
    return 'Nome: $nome | Matrícula: $matricula |Data de Nascimento: $dataDeNascimento | CPF: $cpf | Gênero: $genero';
  }
}
