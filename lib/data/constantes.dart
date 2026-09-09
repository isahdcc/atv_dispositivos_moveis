import '../models/constante.dart';

/// Catálogo de constantes exibido pelo aplicativo.
///
/// Os valores marcados como exatos são definições oficiais do Sistema
/// Internacional de Unidades e, por isso, não possuem incerteza associada.
const List<Constante> catalogoConstantes = <Constante>[
  Constante(
    nome: 'Pi',
    simbolo: 'π',
    valor: 3.141592653589793,
    categoria: Categoria.matematica,
    descricao:
        'Razão entre o comprimento de uma circunferência e o seu '
        'diâmetro. Aparece em praticamente toda a geometria e na análise.',
  ),
  Constante(
    nome: 'Número de Euler',
    simbolo: 'e',
    valor: 2.718281828459045,
    categoria: Categoria.matematica,
    descricao:
        'Base dos logaritmos naturais. Descreve fenômenos de '
        'crescimento e decaimento contínuos.',
  ),
  Constante(
    nome: 'Razão Áurea',
    simbolo: 'φ',
    valor: 1.618033988749895,
    categoria: Categoria.matematica,
    descricao:
        'Proporção em que a razão entre a soma de dois valores e o '
        'maior deles é igual à razão entre o maior e o menor.',
  ),
  Constante(
    nome: 'Raiz de Dois',
    simbolo: '√2',
    valor: 1.4142135623730951,
    categoria: Categoria.matematica,
    descricao:
        'Comprimento da diagonal de um quadrado de lado 1. Foi o '
        'primeiro número reconhecido como irracional.',
  ),
  Constante(
    nome: 'Euler-Mascheroni',
    simbolo: 'γ',
    valor: 0.5772156649015329,
    categoria: Categoria.matematica,
    descricao:
        'Limite da diferença entre a série harmônica e o logaritmo '
        'natural. Ainda não se sabe se é um número irracional.',
  ),
  Constante(
    nome: 'Velocidade da Luz',
    simbolo: 'c',
    valor: 299792458,
    unidade: 'm/s',
    categoria: Categoria.fisica,
    exata: true,
    descricao:
        'Velocidade da luz no vácuo. É o limite de velocidade do '
        'universo e serve de base para a definição do metro.',
  ),
  Constante(
    nome: 'Gravitação Universal',
    simbolo: 'G',
    valor: 6.6743e-11,
    unidade: 'm³/(kg·s²)',
    categoria: Categoria.fisica,
    notacaoCientifica: true,
    descricao:
        'Mede a intensidade da atração gravitacional entre dois '
        'corpos. É a constante fundamental medida com menor precisão.',
  ),
  Constante(
    nome: 'Constante de Planck',
    simbolo: 'h',
    valor: 6.62607015e-34,
    unidade: 'J·s',
    categoria: Categoria.fisica,
    notacaoCientifica: true,
    exata: true,
    descricao:
        'Relaciona a energia de um fóton à sua frequência e é a base '
        'da mecânica quântica.',
  ),
  Constante(
    nome: 'Constante de Boltzmann',
    simbolo: 'k',
    valor: 1.380649e-23,
    unidade: 'J/K',
    categoria: Categoria.fisica,
    notacaoCientifica: true,
    exata: true,
    descricao:
        'Liga a temperatura de um sistema à energia média de suas '
        'partículas, conectando a termodinâmica à mecânica estatística.',
  ),
  Constante(
    nome: 'Número de Avogadro',
    simbolo: 'Nₐ',
    valor: 6.02214076e23,
    unidade: 'mol⁻¹',
    categoria: Categoria.fisica,
    notacaoCientifica: true,
    exata: true,
    descricao:
        'Quantidade de entidades elementares contidas em um mol de '
        'qualquer substância.',
  ),
  Constante(
    nome: 'Carga Elementar',
    simbolo: 'e',
    valor: 1.602176634e-19,
    unidade: 'C',
    categoria: Categoria.fisica,
    notacaoCientifica: true,
    exata: true,
    descricao:
        'Módulo da carga elétrica do elétron e menor carga livre '
        'observada na natureza.',
  ),
  Constante(
    nome: 'Gravidade Padrão',
    simbolo: 'g',
    valor: 9.80665,
    unidade: 'm/s²',
    categoria: Categoria.fisica,
    exata: true,
    descricao:
        'Aceleração da gravidade adotada por convenção ao nível do '
        'mar, usada como referência em cálculos de engenharia.',
  ),
];
