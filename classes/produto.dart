class Produto {
  final String nome;
  double valor;
  int qtdEmEstoque;
  int qtdVendida = 0;

  Produto({
    required this.nome,
    required this.valor,
    required this.qtdEmEstoque,
  });
  // O método deve verificar se ainda há aquele produto em estoque.
  // Caso haja, deve aumentar em 1 a quantidade vendida, diminuir em 1 a quantidade no estoque e realizar um print dizendo que a compra foi realizada
  //com sucesso.
  // Caso não haja, realizar um print dizendo que não temos o produto em estoque.
  void realizarVenda() {
    // try {
    //   if (qtdEmEstoque <= 0) {
    //     print('No momento não possuímos o produto $nome em estoque.');
    //   } else if (qtdEmEstoque > 0) {
    //     qtdVendida += 1;
    //     qtdEmEstoque -= 1;

    //     print('Compra de um(a) produto $nome realizada com sucesso!');
    //     print('Quantidade em estoque: $qtdEmEstoque');
    //   } else {
    //     throw Exception('No momento não possuímos o produto $nome em estoque.');
    //   }
    // } catch (e) {
    //   throw e;
    // }
    if (qtdEmEstoque > 0) {
      qtdVendida += 1;
      qtdEmEstoque -= 1;

      print('Compra de um(a) produto $nome realizada com sucesso!');
      print('Quantidade em estoque: $qtdEmEstoque');
    }
    if (qtdEmEstoque == 0) {
      throw ("No momento não possuímos o produto $nome em estoque.");
    }
    if (qtdEmEstoque < 0) {
      throw ("Quantidade inválida.");
    }
  }

  // O método deve calcular e retornar a receita gerada por aquele produto.
  // A receita do produto se dá pelo cálculo: preço x quantidade vendida.
  double verReceitaGerada() {
    return this.valor * this.qtdVendida;
  }

  void verReceitaGeradaFormatada() {
    double receita = this.valor * this.qtdVendida;
    return print(
        "Produto $nome: R\$ ${receita.toStringAsFixed(2).replaceAll('.', ',')} de receita gerada.");
  }

  @override
  String toString() {
    return 'Produto: $nome | Valor: ${valor.toStringAsFixed(2).replaceAll('.', ',')} | Estoque: $qtdEmEstoque';
  }
}
