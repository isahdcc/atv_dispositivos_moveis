import 'package:flutter/material.dart';

import '../models/constante.dart';

/// Cartão da lista. Ao ser tocado, expande e mostra a descrição da constante.
class ConstanteCard extends StatelessWidget {
  const ConstanteCard({
    super.key,
    required this.constante,
    required this.casasDecimais,
    required this.expandida,
    required this.aoTocar,
  });

  final Constante constante;
  final int casasDecimais;

  /// Indica se a descrição desta constante está visível.
  final bool expandida;

  final VoidCallback aoTocar;

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: aoTocar,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  _SimboloCircular(simbolo: constante.simbolo),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          constante.nome,
                          style: tema.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                constante.valorFormatado(casasDecimais),
                                style: tema.textTheme.bodyLarge?.copyWith(
                                  color: tema.colorScheme.primary,
                                ),
                              ),
                            ),
                            if (constante.unidade.isNotEmpty) ...<Widget>[
                              const SizedBox(width: 6),
                              Text(
                                constante.unidade,
                                style: tema.textTheme.bodySmall,
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    expandida ? Icons.expand_less : Icons.expand_more,
                    color: tema.colorScheme.outline,
                  ),
                ],
              ),
              if (expandida) ...<Widget>[
                const Divider(height: 24),
                Text(constante.descricao, style: tema.textTheme.bodyMedium),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: <Widget>[
                    _Etiqueta(texto: constante.categoria.rotulo),
                    if (constante.exata)
                      const _Etiqueta(texto: 'Valor exato (SI)'),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Círculo colorido com o símbolo da constante.
class _SimboloCircular extends StatelessWidget {
  const _SimboloCircular({required this.simbolo});

  final String simbolo;

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = Theme.of(context);

    return Container(
      width: 48,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: tema.colorScheme.secondaryContainer,
        shape: BoxShape.circle,
      ),
      child: Text(
        simbolo,
        style: tema.textTheme.titleLarge?.copyWith(
          color: tema.colorScheme.onSecondaryContainer,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

/// Etiqueta pequena usada para categoria e para o aviso de valor exato.
class _Etiqueta extends StatelessWidget {
  const _Etiqueta({required this.texto});

  final String texto;

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: tema.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(texto, style: tema.textTheme.labelSmall),
    );
  }
}
