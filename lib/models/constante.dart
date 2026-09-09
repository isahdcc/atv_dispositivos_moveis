/// Categorias usadas para agrupar e filtrar as constantes na tela.
enum Categoria {
  matematica('Matemática'),
  fisica('Física');

  const Categoria(this.rotulo);

  /// Texto exibido na interface.
  final String rotulo;
}

/// Representa uma constante fundamental da matemática ou da física.
class Constante {
  const Constante({
    required this.nome,
    required this.simbolo,
    required this.valor,
    required this.categoria,
    required this.descricao,
    this.unidade = '',
    this.notacaoCientifica = false,
    this.exata = false,
  });

  /// Nome por extenso da constante, usado como identificador na lista.
  final String nome;

  /// Símbolo tradicional da constante (π, e, φ, c, ...).
  final String simbolo;

  /// Valor numérico da constante.
  final double valor;

  /// Unidade de medida no SI. Constantes matemáticas não possuem unidade.
  final String unidade;

  final Categoria categoria;

  /// Explicação curta exibida quando o cartão é expandido.
  final String descricao;

  /// Valores muito grandes ou muito pequenos são exibidos em notação científica.
  final bool notacaoCientifica;

  /// Constantes definidas por convenção no SI, portanto sem incerteza.
  final bool exata;

  /// Formata o valor de acordo com a precisão escolhida pelo usuário.
  String valorFormatado(int casasDecimais) {
    if (notacaoCientifica) {
      return valor.toStringAsExponential(casasDecimais);
    }
    return valor.toStringAsFixed(casasDecimais);
  }
}
