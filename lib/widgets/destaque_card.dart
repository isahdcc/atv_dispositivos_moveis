import 'package:flutter/material.dart';

import '../models/constante.dart';

/// Cartão em destaque, no topo da tela, com a constante escolhida no sorteio.
class DestaqueCard extends StatelessWidget {
  const DestaqueCard({
    super.key,
    required this.constante,
    required this.casasDecimais,
  });

  final Constante constante;
  final int casasDecimais;

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = Theme.of(context);
    final Color corTexto = tema.colorScheme.onPrimaryContainer;

    return Card(
      elevation: 0,
      color: tema.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  constante.simbolo,
                  style: tema.textTheme.displaySmall?.copyWith(
                    color: corTexto,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        constante.nome,
                        key: const Key('destaque-nome'),
                        style: tema.textTheme.titleLarge?.copyWith(
                          color: corTexto,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        constante.categoria.rotulo,
                        style: tema.textTheme.labelMedium?.copyWith(
                          color: corTexto.withValues(alpha: 0.75),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Flexible(
                  child: Text(
                    constante.valorFormatado(casasDecimais),
                    key: const Key('destaque-valor'),
                    style: tema.textTheme.headlineSmall?.copyWith(
                      color: corTexto,
                    ),
                  ),
                ),
                if (constante.unidade.isNotEmpty) ...<Widget>[
                  const SizedBox(width: 6),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Text(
                      constante.unidade,
                      style: tema.textTheme.titleSmall?.copyWith(
                        color: corTexto.withValues(alpha: 0.75),
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 12),
            Text(
              constante.descricao,
              style: tema.textTheme.bodyMedium?.copyWith(color: corTexto),
            ),
          ],
        ),
      ),
    );
  }
}
