---
tipo: elaboracao-de-negocio
status: esboco-inicial
produto: Estoque Mais
fase: descoberta
---

# Elaboração de negócio e visão geral

## 1. Visão do negócio

O recorte de descoberta são pequenos e médios 3PLs da Região Sudeste, com o primeiro piloto buscado em Contagem e Betim. Galpões Classe C, carga e maturidade digital são filtros de descoberta, não requisitos do ICP. A definição de produto fica em [[Decisões vigentes]]; necessidade, ROI e disposição a pagar continuam hipóteses avaliadas em [[Tese de Negócio e Validação Comercial]].

## 2. Problema de negócio

Operações menores podem depender de planilhas, anotações e processos pouco rastreáveis. Isso dificulta saber o saldo real, localizar produtos, explicar divergências e responsabilizar operações críticas. A [[Justificativa]] identifica como oportunidades principais o registro próximo do momento da movimentação, a visibilidade do estoque e o acesso às informações no local da operação.

O problema também envolve infraestrutura: o galpão pode ter endereços, equipamentos, pesos e limites físicos heterogêneos. O relatório BTG reforça, como hipótese de posicionamento, que operações Classe C podem estar em processo de modernização e precisar de soluções acessíveis e modulares. Essa leitura é estratégica e baseada em uma fonte histórica, não uma regra universal.

## 3. Público e compradores possíveis

### Usuários operacionais

- operadores de recebimento, armazenagem, picking, inventário e expedição;
- conferentes que registram quantidades, divergências, lotes e séries;
- supervisores que distribuem tarefas, tratam exceções e aprovam ajustes.

### Responsáveis pelo negócio

- gestores de operações logísticas;
- responsáveis por depósitos e armazéns;
- pequenos operadores logísticos;
- empresas que armazenam móveis, eletrônicos ou outros produtos com necessidade de rastreabilidade.

Os grupos acima são uma hipótese estruturada a partir de [[Stakeholders]] e da especificação refinada. Personas, autoridade de compra e processo comercial ainda precisam ser validados.

## 4. Proposta de valor

O Estoque Mais deve oferecer:

- controle de estoque mais confiável do que planilhas e registros fragmentados;
- operação no local por smartphone e leitura de código de barras;
- rastreabilidade por produto, lote, endereço e, quando aplicável, número de série;
- registro de divergências e histórico de ações críticas;
- implantação compatível com operações menores e infraestrutura existente;
- evolução gradual de controles básicos para capacidade física, integrações e indicadores.

A proposta não é competir inicialmente como ERP completo. O diferencial pretendido é combinar foco operacional, acessibilidade e controle suficiente para profissionalizar operações menores.

## 5. Visão do produto

O produto deverá permitir que uma operação:

1. cadastre produtos, unidades, clientes, fornecedores e endereços;
2. receba mercadorias e compare o esperado com o recebido;
3. armazene produtos em endereços controlados;
4. consulte saldo por produto, lote e endereço;
5. reserve, separe e confira pedidos;
6. controle divergências, inventários e ajustes;
7. libere expedições somente quando as condições obrigatórias forem atendidas;
8. reconstrua quem fez cada operação e quais valores foram afetados.

## 6. Escopo inicial de negócio

### Incluído no núcleo inicial

- organização, usuários, perfis e permissões;
- empresa, armazém e depositante com separação mínima de dados;
- cadastro de produtos, SKUs, códigos de barras, clientes e fornecedores;
- áreas, endereços, capacidade e status;
- estoque, lotes, reservas, bloqueios e movimentações;
- recebimento, putaway, picking, conferência e expedição;
- inventário, divergências, aprovações e ajustes rastreáveis;
- auditoria das operações críticas;
- uso operacional em smartphone.

### Evolução posterior ou dependente de evidência

- portal e faturamento específico do depositante;
- configurações avançadas para múltiplos depositantes;
- SaaS multiempresa;
- integrações extensas com ERPs, marketplaces e transportadoras;
- automação física e otimizações avançadas;
- relatórios e indicadores avançados.
## 7. Modelo de implantação e receita a explorar

A primeira versão será instalada no ambiente do cliente, conforme [[Requisitos]]. A evolução para SaaS é possibilidade futura, não promessa do MVP.

O modelo de negócio inicial deve testar:

- implantação e configuração local;
- migração e saneamento de dados;
- treinamento;
- licença ou assinatura;
- suporte e manutenção;
- integrações adicionais validadas.

Preços, canais de venda, custos de implantação, suporte e disposição a pagar continuam **A validar**.
## 8. Indicadores de sucesso a validar

O desenho do piloto, a linha de base e os critérios de sucesso estão centralizados em [[Tese de Negócio e Validação Comercial]]. Medidas de disponibilidade e desempenho técnico ficam em [[Implementação técnica]]. Este documento não mantém uma lista paralela de indicadores.

## 9. Riscos de negócio

- escopo excessivo entre um app simples e um WMS completo;
- baixa maturidade comercial e marca ainda em consolidação;
- dependência da equipe atual;
- concorrência de WMS e ERPs consolidados;
- heterogeneidade dos galpões e dos dados fornecidos pelos clientes;
- custo e complexidade de integrações e suporte local;
- adoção lenta em operações tradicionais.

## 10. Decisões pendentes

- confirmar comprador principal e autoridade para o piloto;
- detalhar a fronteira funcional do MVP sem descaracterizar o núcleo WMS;
- definir preço, unidade de cobrança e custo máximo de implantação;
- estabelecer critérios numéricos de sucesso antes do piloto;
- selecionar uma operação real em Contagem ou Betim;
- homologar dispositivos, conectividade e ambiente local;
- definir comportamento em conectividade degradada;
- homologar os fluxos FocusNFe e seus limites fiscais.
## Fontes

- [[Fontes pendentes#Especificação de requisitos original]]
- [[Fontes pendentes#Requisitos refinados]]
- [[Fontes pendentes#Relatório BTG]]
## Dimensões transversais de avaliação

Além das visões específicas de cada stakeholder, o produto deve ser avaliado por três dimensões transversais:

### Valor operacional — prioridade 5/5

Mede se o Estoque Mais reduz erros, retrabalho e tempo de execução, melhora a acuracidade do inventário e torna as informações disponíveis no local da operação. Deve ser observado principalmente nas tarefas de cadastro, recebimento, movimentação, picking, inventário e expedição.

### Viabilidade — prioridade 5/5

Mede se a solução pode ser comprada, implantada, configurada, treinada e mantida por uma operação Classe C ou pequeno operador logístico. Inclui custo, esforço de implantação, migração de dados, infraestrutura local, suporte e evolução incremental.

### Confiança — prioridade 5/5

Mede se os usuários conseguem confiar nos saldos, nas movimentações e nas decisões apoiadas pelo sistema. Inclui integridade transacional, rastreabilidade, auditoria, permissões, backup, restauração, tratamento de divergências e explicação dos valores apresentados.

Essas dimensões devem orientar a priorização do MVP, os critérios do piloto e a avaliação das decisões ainda marcadas como A validar.
