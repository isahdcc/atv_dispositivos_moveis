import 'dart:math';

import 'package:flutter/material.dart';

import '../data/constantes.dart';
import '../models/constante.dart';
import '../widgets/constante_card.dart';
import '../widgets/destaque_card.dart';

/// Tela principal do aplicativo, responsável por todo o estado da interface.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Limites de precisão que o usuário pode escolher.
  static const int _minimoCasas = 2;
  static const int _maximoCasas = 10;

  final Random _aleatorio = Random();

  /// Quantidade de casas decimais usada para formatar todos os valores.
  int _casasDecimais = 4;

  /// Categoria selecionada no filtro. `null` significa "todas".
  Categoria? _filtro;

  /// Constante exibida no cartão de destaque.
  Constante _destaque = catalogoConstantes.first;

  /// Nome da constante cujo cartão está expandido, se houver algum.
  String? _nomeExpandido;

  /// Constantes visíveis de acordo com o filtro atual.
  List<Constante> get _constantesFiltradas {
    if (_filtro == null) {
      return catalogoConstantes;
    }
    return catalogoConstantes
        .where((Constante constante) => constante.categoria == _filtro)
        .toList();
  }

  /// Sorteia uma nova constante para o destaque, sempre diferente da atual.
  void _sortearConstante() {
    final List<Constante> disponiveis = _constantesFiltradas;
    if (disponiveis.length < 2) {
      return;
    }

    Constante sorteada;
    do {
      sorteada = disponiveis[_aleatorio.nextInt(disponiveis.length)];
    } while (sorteada.nome == _destaque.nome);

    setState(() => _destaque = sorteada);
  }

  /// Aumenta ou diminui a precisão exibida, respeitando os limites.
  void _alterarPrecisao(int variacao) {
    final int novoValor = _casasDecimais + variacao;
    if (novoValor < _minimoCasas || novoValor > _maximoCasas) {
      return;
    }
    setState(() => _casasDecimais = novoValor);
  }

  /// Troca o filtro de categoria e mantém o destaque coerente com ele.
  void _aplicarFiltro(Categoria? categoria) {
    setState(() {
      _filtro = categoria;
      _nomeExpandido = null;

      final List<Constante> visiveis = _constantesFiltradas;
      final bool destaqueVisivel = visiveis.any(
        (Constante constante) => constante.nome == _destaque.nome,
      );
      if (!destaqueVisivel) {
        _destaque = visiveis.first;
      }
    });
  }

  /// Abre ou fecha a descrição de um cartão da lista.
  void _alternarExpansao(Constante constante) {
    setState(() {
      _nomeExpandido = _nomeExpandido == constante.nome ? null : constante.nome;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Constante> visiveis = _constantesFiltradas;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Constantes do Mundo'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // A tela inteira rola em uma única lista, para que o conteúdo caiba
      // mesmo em telas pequenas ou com a precisão no valor máximo.
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          children: <Widget>[
            DestaqueCard(constante: _destaque, casasDecimais: _casasDecimais),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _sortearConstante,
              icon: const Icon(Icons.shuffle),
              label: const Text('Sortear constante'),
            ),
            _construirControleDePrecisao(context),
            _construirFiltroDeCategoria(),
            const Divider(height: 1),
            const SizedBox(height: 12),
            Text(
              '${visiveis.length} constantes · toque em uma para ver a '
              'descrição',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 12),
            ..._construirCartoes(visiveis),
          ],
        ),
      ),
    );
  }

  /// Linha com os botões que aumentam e diminuem as casas decimais.
  Widget _construirControleDePrecisao(BuildContext context) {
    final ThemeData tema = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            tooltip: 'Diminuir casas decimais',
            visualDensity: VisualDensity.compact,
            onPressed: _casasDecimais > _minimoCasas
                ? () => _alterarPrecisao(-1)
                : null,
            icon: const Icon(Icons.remove_circle_outline),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Casas decimais: $_casasDecimais',
                textAlign: TextAlign.center,
                style: tema.textTheme.titleMedium,
              ),
            ),
          ),
          IconButton(
            tooltip: 'Aumentar casas decimais',
            visualDensity: VisualDensity.compact,
            onPressed: _casasDecimais < _maximoCasas
                ? () => _alterarPrecisao(1)
                : null,
            icon: const Icon(Icons.add_circle_outline),
          ),
        ],
      ),
    );
  }

  /// Chips que filtram a lista por categoria.
  Widget _construirFiltroDeCategoria() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: <Widget>[
          ChoiceChip(
            key: const Key('filtro-todas'),
            label: const Text('Todas'),
            selected: _filtro == null,
            onSelected: (_) => _aplicarFiltro(null),
          ),
          ChoiceChip(
            key: const Key('filtro-matematica'),
            label: Text(Categoria.matematica.rotulo),
            selected: _filtro == Categoria.matematica,
            onSelected: (_) => _aplicarFiltro(Categoria.matematica),
          ),
          ChoiceChip(
            key: const Key('filtro-fisica'),
            label: Text(Categoria.fisica.rotulo),
            selected: _filtro == Categoria.fisica,
            onSelected: (_) => _aplicarFiltro(Categoria.fisica),
          ),
        ],
      ),
    );
  }

  /// Cartões das constantes visíveis, um para cada item do filtro atual.
  List<Widget> _construirCartoes(List<Constante> visiveis) {
    return visiveis.map((Constante constante) {
      return ConstanteCard(
        key: ValueKey<String>('card-${constante.nome}'),
        constante: constante,
        casasDecimais: _casasDecimais,
        expandida: _nomeExpandido == constante.nome,
        aoTocar: () => _alternarExpansao(constante),
      );
    }).toList();
  }
}
