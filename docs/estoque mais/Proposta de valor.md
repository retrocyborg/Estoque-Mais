---
tipo: proposta-de-valor
status: esboco-para-validacao
produto: Estoque Mais
segmento: pequenos-e-medios-3PLs
regiao: Contagem-e-Betim-MG
---

# Proposta de valor

## Proposta central

Conforme [[Decisões vigentes]], o **Estoque Mais** será um WMS mobile-first para pequenos e médios operadores logísticos equivalentes a 3PL, inicialmente em Contagem e Betim, que precisam transformar processos imprecisos em operações de armazenagem padronizadas, rastreáveis e economicamente mensuráveis.

O produto combina um núcleo WMS real com uma experiência mobile central, implantação assistida, migração controlada e foco em operações com falta de pessoal qualificado, estrutura limitada e retrabalho recorrente.

## Problema prioritário

O cliente prioritário pode sofrer com a seguinte cadeia:

```text
estrutura limitada
-> processo pouco padronizado
-> dependência de conhecimento informal
-> erros e registros incompletos
-> retrabalho
-> horas extras e atrasos
-> pressão sobre a margem
```

O problema não é necessariamente a ausência de um sistema. O operador pode possuir ERP ou WMS e ainda manter planilhas, controles paralelos, baixa adoção, dados inconsistentes ou processos fora do sistema.

## Cliente prioritário

Pequenos e médios operadores logísticos de Contagem e Betim que:

- atendem múltiplos clientes ou depositantes;
- operam um ou poucos armazéns;
- realizam recebimento, armazenagem, inventário, picking e expedição;
- possuem baixa ou média maturidade digital;
- enfrentam retrabalho, divergências ou erros operacionais;
- não possuem equipe robusta de TI ou implantação;
- conseguem indicar um responsável pelo piloto e fornecer dados mínimos.

O perfil detalhado está em [[Publico-alvo]].

## Valor entregue

### Para o dono ou diretor

- proteção de margem;
- visibilidade sobre custos e erros;
- implantação proporcional ao porte;
- evidência de retorno operacional;
- maior capacidade de preservar clientes.

### Para o gerente de operações

- redução de divergências;
- menor retrabalho;
- acompanhamento de tarefas;
- indicadores de produtividade;
- explicação de exceções e ajustes.

### Para o supervisor

- workflows guiados;
- distribuição de tarefas;
- acompanhamento da equipe;
- redução da dependência de operadores experientes;
- identificação de gargalos por tarefa, turno ou área.

### Para o operador

- interface mobile simples;
- instruções por etapa;
- leitura de códigos;
- validação de endereço, produto e quantidade;
- menos decisões informais e retrabalho.

### Para o depositante

- visibilidade do estoque;
- rastreabilidade das movimentações;
- relatórios por cliente;
- divergências explicáveis;
- maior confiança na prestação de contas.

## Diferenciais pretendidos

- WMS com mobile como parte do núcleo, não como módulo secundário;
- foco em pequenos e médios 3PLs;
- operação multi-cliente e por depositante;
- workflows guiados para equipes com diferentes níveis de experiência;
- migração e saneamento de dados como parte da implantação;
- implantação modular e previsível;
- foco em acuracidade, auditoria e redução de retrabalho;
- integração progressiva com ERP, WMS e outros sistemas;
- escopo controlado para evitar customização excessiva.

Esses diferenciais são hipóteses de posicionamento e precisam ser comparados com alternativas existentes.

## Núcleo do MVP

O MVP deverá ser um WMS de escopo controlado, contendo:

- empresa, armazém e depositante;
- usuários, perfis e permissões;
- produtos, lotes e unidades;
- endereços;
- recebimento;
- movimentação;
- inventário;
- picking;
- expedição;
- divergências;
- auditoria;
- relatórios operacionais básicos;
- importação e migração inicial de dados;
- experiência mobile para execução.

Depositante participa do modelo mínimo com separação de dados, permissões e saldos. Portal, faturamento específico, configurações avançadas e gestão sofisticada de múltiplos depositantes ficam fora do MVP.

Funcionalidades avançadas de WMS corporativo, automação física, TMS, roteirização, RFID, machine learning e integrações extensas ficam fora da primeira versão, sem descaracterizar o núcleo WMS.

## Hipótese econômica

O valor financeiro será demonstrado pela redução de:

- horas de retrabalho;
- recontagens;
- horas extras;
- erros de picking e expedição;
- devoluções e reentregas;
- descontos e multas;
- relatórios manuais;
- tempo de treinamento;
- perdas de capacidade e confiança dos depositantes.

O cálculo inicial deve seguir:

```text
benefício operacional
- implantação
- migração
- assinatura
- suporte
= benefício líquido
```

O ROI deverá ser calculado com dados reais do cliente, depois de uma linha de base de duas a quatro semanas. Estimativas nacionais de perdas e custos logísticos servem como contexto, mas não substituem a medição em Contagem e Betim. A justificativa econômica está em [[Justificativa]].

## Caminho para alcançar a proposta

1. Selecionar 15 a 20 operadores equivalentes a 3PL em Contagem e Betim.
2. Identificar pelo menos três empresas com dor operacional semelhante.
3. Escolher um fluxo inicial de recebimento, endereçamento, movimentação e inventário.
4. Prototipar a experiência mobile no ambiente real.
5. Construir o núcleo WMS mínimo.
6. Medir uma linha de base antes do piloto.
7. Executar um piloto limitado a um armazém ou área.
8. Comparar divergências, retrabalho, erros, treinamento e tempo de tarefa.
9. Padronizar migração, configuração e treinamento.
10. Testar preço, continuidade e repetição em outro cliente.

## Gates de validação

Esta nota descreve a proposta de valor como hipótese. Gates, métricas e critérios para continuar ou parar o piloto estão centralizados em [[Tese de Negócio e Validação Comercial]]; ainda não há resultados demonstrados.

## Resposta de pitch

> Pequenos e médios 3PLs precisam de um WMS real, mas muitas vezes não conseguem absorver a complexidade, o custo ou o tempo de implantação de soluções corporativas. O Estoque Mais combina WMS mobile, execução guiada, migração assistida e rastreabilidade para transformar processos informais em operações mais confiáveis e mensuráveis.

> [!warning] Status
> Esta proposta organiza uma hipótese de valor. Ainda não comprova mercado, ROI, disposição a pagar, superioridade competitiva ou escalabilidade comercial.
