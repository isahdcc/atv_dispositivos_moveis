// Testes de widget que exercitam as interações exigidas pela atividade:
// a AppBar, o botão de sorteio, o controle de precisão, o filtro por
// categoria e a expansão dos cartões.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dispositivosmoveis/main.dart';

void main() {
  /// Lê o nome que está sendo exibido no cartão de destaque.
  String nomeEmDestaque(WidgetTester tester) {
    final Text texto = tester.widget<Text>(
      find.byKey(const Key('destaque-nome')),
    );
    return texto.data!;
  }

  testWidgets('a AppBar exibe o título do aplicativo', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const AplicativoConstantes());

    expect(find.widgetWithText(AppBar, 'Constantes do Mundo'), findsOneWidget);
    expect(find.text('Sortear constante'), findsOneWidget);
  });

  testWidgets('os botões de precisão alteram os valores exibidos na tela', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const AplicativoConstantes());

    expect(find.text('Casas decimais: 4'), findsOneWidget);
    expect(find.text('3.1416'), findsWidgets);

    await tester.tap(find.byTooltip('Aumentar casas decimais'));
    await tester.pump();

    expect(find.text('Casas decimais: 5'), findsOneWidget);
    expect(find.text('3.14159'), findsWidgets);
    expect(find.text('3.1416'), findsNothing);

    await tester.tap(find.byTooltip('Diminuir casas decimais'));
    await tester.pump();
    await tester.tap(find.byTooltip('Diminuir casas decimais'));
    await tester.pump();

    expect(find.text('Casas decimais: 3'), findsOneWidget);
    expect(find.text('3.142'), findsWidgets);
  });

  testWidgets('o botão sortear troca a constante em destaque', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const AplicativoConstantes());

    final String antes = nomeEmDestaque(tester);

    await tester.tap(find.text('Sortear constante'));
    await tester.pump();

    expect(nomeEmDestaque(tester), isNot(antes));
  });

  testWidgets('o filtro por categoria esconde as constantes matemáticas', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const AplicativoConstantes());

    expect(find.byKey(const ValueKey<String>('card-Pi')), findsOneWidget);

    await tester.tap(find.byKey(const Key('filtro-fisica')));
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey<String>('card-Pi')), findsNothing);
    expect(
      find.byKey(const ValueKey<String>('card-Velocidade da Luz')),
      findsOneWidget,
    );
    expect(
      find.text('7 constantes · toque em uma para ver a descrição'),
      findsOneWidget,
    );

    // O destaque acompanha o filtro quando a constante atual deixa de existir.
    expect(nomeEmDestaque(tester), 'Velocidade da Luz');
  });

  testWidgets('a interface cabe em uma tela de celular sem estouro', (
    WidgetTester tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(360, 690));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const AplicativoConstantes());
    await tester.pumpAndSettle();

    // Um estouro de layout registra uma exceção e reprova o teste.
    expect(tester.takeException(), isNull);
    expect(find.widgetWithText(AppBar, 'Constantes do Mundo'), findsOneWidget);
  });

  testWidgets('tocar em um cartão revela a descrição da constante', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const AplicativoConstantes());

    final Finder cartaoPi = find.byKey(const ValueKey<String>('card-Pi'));

    expect(
      find.descendant(of: cartaoPi, matching: find.byIcon(Icons.expand_more)),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: cartaoPi,
        matching: find.textContaining('circunferência'),
      ),
      findsNothing,
    );

    await tester.tap(cartaoPi);
    await tester.pumpAndSettle();

    expect(
      find.descendant(of: cartaoPi, matching: find.byIcon(Icons.expand_less)),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: cartaoPi,
        matching: find.textContaining('circunferência'),
      ),
      findsOneWidget,
    );
  });
}
