import 'enums.dart';
import 'pessoa.dart';
import 'produto.dart';
import 'revendedor.dart';
import 'brinde.dart';

// Essa classe deve ser herdeira da classe Pessoa.
class Cliente extends Pessoa {
  double dinheiro;
  List<Produto> produtosComprados = [];
  List<Brinde> brindes = []; // Atributo inicializado com array vazia
  int pontos = 0; // Atributo inicializado com 0 (zero)

  Cliente({
    this.dinheiro = 0,
    required String nome,
    required DateTime dataDeNascimento,
    required String cpf,
    required Genero genero,
  }) : super(
          nome: nome,
          dataDeNascimento: dataDeNascimento,
          cpf: cpf,
          genero: genero,
        );

  @override
  // O método continua recebendo o parâmetro do tipo String, que representa a fala da pessoa.
  // Deve-se realizar um print da fala, mas especificando que é um cliente que está falando.
  void falar(String mensagem) {
    print("Cliente $nome diz: $mensagem");
  }

  // Método responsável por adicionar dinheiro na carteira de um cliente.
  // O método deve receber um parâmetro (valor) do tipo double e então:
  // Somar o valor recebido por parâmetro ao valor já existente no tributo dinheiro daquele cliente;
  // Realizar um print dizendo quanto a pessoa tem no total após o acréscimo.
  void adicionarDineiro(double valor) {
    dinheiro += valor;
    print(
        "$nome possui agora ${dinheiro.toStringAsFixed(2).replaceAll('.', ',')}");
  }

  // Método responsável por realizar uma compra de um produto com um revendedor.
  // O método deve receber um parâmetro do tipo Produto e um do tipo Revendedor e verificar se aquele cliente possui dinheiro suficiente
  // para comprar aquele produto, de acordo com o seu valor.
  void comprarProduto(Produto produto, Revendedor revendedor) {
    try {
      late double? dinheiroPreCompra = dinheiro;
      if (dinheiro >= produto.valor) {
        revendedor.venderProduto(produto);
        dinheiro = dinheiroPreCompra - produto.valor;
        pontos++;
        String valorArredondado =
            produto.valor.toStringAsFixed(2).replaceAll('.', ',');
        String dinheiroPreCompraArredondado =
            dinheiroPreCompra.toStringAsFixed(2);
        String dinheiroArredondado =
            dinheiro.toStringAsFixed(2).replaceAll('.', ',');
        produtosComprados.add(produto);
        print("Valor do produto: R\$ " + valorArredondado);
        print("Saldo do cliente: R\$ " + dinheiroPreCompraArredondado);
        print("Saldo do cliente após a compra: R\$ " + dinheiroArredondado);
        for (var produto in produtosComprados) {
          print("Produto comprado: ${produto.nome}");
        }
      } else {
        throw Exception(
            "$nome não possui dinheiro suficiente para comprar o produto ${produto.nome}.");
      }
    } catch (e) {
      print("Erro ao efetuar a comprar: $e");
    }
  }

  // Método responsável por calcular e retornar a média aritmética em reais dos produtos comprados por aquele cliente.
  // Para isso, deve-se utilizar os dados que estiverem dentro da Array produtosComprados.
  double calcularMediaProdutosComprados() {
    if (produtosComprados.isEmpty) {
      return 0;
    }

    double soma = 0;
    for (var produto in produtosComprados) {
      soma += produto.valor;
    }

    return double.parse((soma / produtosComprados.length).toStringAsFixed(2));
  }

  // Método responsável por calcular e retornar o total em reais gastos por aquele cliente.
  // Para isso, deve-se utilizar os dados que estiverem dentro da Array produtosComprados.
  double calcularTotalGasto() {
    double total = 0.0;
    for (var produto in produtosComprados) {
      total += produto.valor;
    }
    return double.parse(total.toStringAsFixed(2));
  }

  // Método que utiliza as funções criadas anteriormente e realiza um print do resumo de total gasto e média aritmética.
  void verResumo() {
    print(
        'O Total gasto por $nome foi de ${calcularTotalGasto().toStringAsFixed(2).replaceAll('.', ',')} reais e a média de valor dos produtos comprados é ${calcularMediaProdutosComprados().toStringAsFixed(2).replaceAll('.', ',')} reais.');
  }

  // Método responsável ordenar a lista de produtos comprados com base no nome dos produtos.
  void ordenarProdutosComprados() {
    produtosComprados.sort((a, b) => a.nome.compareTo(b.nome));
  }

  // Método responsável realizar um print dos produtos comprados em ordem alfabética, juntamente com os seus valores.
  void verProdutosComprados() {
    ordenarProdutosComprados();

    print('Produtos comprados por $nome:');
    for (var produto in produtosComprados) {
      print(
          '- Produto: ${produto.nome}, Valor: ${produto.valor.toStringAsFixed(2).replaceAll('.', ',')} reais');
    }
  }

  void consultarTotalPontos() {
    print("$nome possui $pontos pontos.");
  }

  void trocarPontosPorBrinde(Brinde brinde) {
    if (pontos >= brinde.pontosNecessarios) {
      try {
        brinde.realizarTroca();
        pontos -= brinde.pontosNecessarios;
        brindes.add(brinde);
        print('Pontos restantes: $pontos');
      } catch (e) {
        print('Erro ao trocar pontos por brinde: $e');
      }
    } else {
      print(
          'Você não possui pontos suficientes para trocar pelo brinde ${brinde.nome}.');
      print('Pontos restantes: $pontos');
    }
  }

  void ordenarBrindes() {
    brindes.sort((a, b) => a.nome.compareTo(b.nome));
  }

  void verBrindes() {
    if (brindes.isEmpty) {
      print('Você ainda não possui brindes.');
      return;
    }

    ordenarBrindes();

    print('Brindes recebidos por $nome:');
    for (var brinde in brindes) {
      print('- $brinde');
    }
  }

  @override
  String toString() {
    return 'Nome: $nome | Data de Nascimento: $dataDeNascimento | CPF: $cpf | Gênero: $genero';
  }
}
