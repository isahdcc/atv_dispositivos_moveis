# Constantes do Mundo

Aplicativo Flutter que apresenta constantes fundamentais da matemática e da física.

## Identificação

- **Aluno:** Breno Antonioli
- **Disciplina:** Dispositivos Móveis
- **Atividade:** criação, execução, versionamento e publicação de um projeto Flutter

## Descrição da atividade

A atividade consiste em criar um projeto Flutter do zero utilizando o ambiente de
desenvolvimento configurado em aula (VS Code, Flutter SDK, Android SDK e emulador),
desenvolver uma interface própria, executar e testar a aplicação, versionar o
projeto com Git e publicá-lo em um repositório público no GitHub.

A interface desenvolvida contém obrigatoriamente:

- uma `AppBar` com o título da aplicação;
- textos apresentados com Widgets adequados (`Text` com estilos do tema);
- organização dos elementos com Widgets de layout (`Column`, `Row`, `Wrap`,
  `Padding`, `Expanded`, `Flexible`, `Card`, `ListView`);
- botões (`ElevatedButton.icon`, `IconButton`, `ChoiceChip`);
- interações que alteram as informações apresentadas na tela, todas usando
  `StatefulWidget` e `setState`.

## Descrição da aplicação

O aplicativo **Constantes do Mundo** é um catálogo de 12 constantes fundamentais,
divididas entre matemática (π, número de Euler, razão áurea, raiz de dois e a
constante de Euler-Mascheroni) e física (velocidade da luz, gravitação universal,
constante de Planck, constante de Boltzmann, número de Avogadro, carga elementar e
gravidade padrão).

A tela é formada por um cartão de destaque no topo, pelos controles de interação e
por uma lista com todas as constantes do filtro selecionado. As constantes marcadas
como *valor exato (SI)* são definições oficiais do Sistema Internacional de Unidades
e, por isso, não possuem incerteza associada.

## Principais funcionalidades

1. **Sortear constante** — o botão escolhe aleatoriamente uma constante e a exibe no
   cartão de destaque, sempre diferente da que já estava em exibição.
2. **Controle de precisão** — os botões `+` e `−` alteram a quantidade de casas
   decimais (de 2 a 10) e reformatam, na hora, o valor de todas as constantes da
   tela. Valores muito grandes ou muito pequenos são exibidos em notação científica.
3. **Filtro por categoria** — os chips *Todas*, *Matemática* e *Física* filtram a
   lista. Se a constante em destaque não pertencer à categoria escolhida, o destaque
   é atualizado automaticamente.
4. **Cartões expansíveis** — tocar em um cartão da lista revela a descrição da
   constante, a sua categoria e a indicação de valor exato quando for o caso.

## Estrutura do projeto

```
lib/
├── main.dart                     # ponto de entrada e tema do aplicativo
├── models/constante.dart         # modelo Constante e enum Categoria
├── data/constantes.dart          # catálogo com as 12 constantes
├── screens/home_screen.dart      # tela principal e todo o estado da interface
└── widgets/
    ├── destaque_card.dart        # cartão da constante em destaque
    └── constante_card.dart       # cartão expansível usado na lista
test/
└── widget_test.dart              # testes de widget das interações
```

## Como executar

### Requisitos

- Flutter SDK instalado (`flutter --version`);
- Android Studio com o Android SDK e um emulador criado, ou um dispositivo Android
  físico com a depuração USB ativada;
- verificação do ambiente com `flutter doctor`.

### Passos

```bash
git clone https://github.com/antoniolibreno/dispositivosmoveis.git
cd dispositivosmoveis
flutter pub get
flutter devices          # confirma o emulador ou o aparelho conectado
flutter run              # ou: flutter run -d <id-do-dispositivo>
```

Para gerar o APK de instalação:

```bash
flutter build apk --release
```

### Testes

```bash
flutter analyze          # análise estática, sem problemas encontrados
flutter test             # 6 testes de widget cobrindo as interações da tela
```
