# Justificativa

O **Estoque Mais** é proposto para operações de armazenagem que precisam melhorar a confiabilidade dos saldos e o registro das movimentações, mas podem não conseguir absorver o custo, a complexidade ou o tempo de implantação de um WMS completo.

Esta é uma justificativa de produto em fase de descoberta. A existência do problema é plausível, mas ainda precisa ser confirmada por entrevistas, observação operacional e dados de pilotos. As referências internas utilizadas nesta formulação estão indicadas junto aos trechos correspondentes em [[Estoque Mais - visão geral]], [[Requisitos]] e [[Elaboração de Negócio e Visão Geral]].

## Problema empresarial

Em operações que dependem de planilhas, registros manuais ou lançamentos posteriores, pode existir uma diferença entre o que aconteceu fisicamente no armazém e o que está registrado no sistema. Essa diferença pode dificultar a consulta de saldos, o inventário, a reposição, a separação e a expedição.

Estudos sobre imprecisão de registros de inventário relacionam divergências entre estoque físico e registros do sistema a rupturas, excesso de estoque, retrabalho e decisões de reposição inadequadas. Um estudo empírico com aproximadamente 370 mil registros também aponta a complexidade operacional e as práticas de auditoria como fatores relevantes para a acuracidade do inventário ([DeHoratius e Raman, Management Science](https://pubsonline.informs.org/doi/10.1287/mnsc.1070.0789)).

Para o Estoque Mais, a hipótese é que parte do problema pode ser reduzida quando a movimentação é registrada no local e no momento em que ocorre, com permissões, histórico e reconciliação suficientes para explicar divergências.

## Hipótese de cliente prioritário

A primeira hipótese de público é formada por pequenos e médios operadores logísticos 3PL de Contagem e Betim que:

- operam um ou poucos armazéns;
- atendem clientes ou depositantes;
- usam planilhas, controles paralelos ou sistemas fragmentados;
- possuem equipe operacional reduzida;
- precisam registrar recebimento, movimentação, inventário, picking e expedição;
- não conseguem absorver a implantação de um WMS corporativo avançado;
- aceitam medir uma linha de base e participar de um piloto.

O restante da Região Sudeste permanece como hipótese de expansão. Galpão Classe C, móveis e eletrônicos são atributos de descoberta, não requisitos obrigatórios do ICP, conforme [[Publico-alvo]] e [[Decisões vigentes]].
## Mecanismo de criação de valor

O produto pretende criar valor por meio de uma cadeia operacional:

1. registrar a movimentação mais próximo do ponto de execução;
2. reduzir a dependência de anotações e lançamentos posteriores;
3. manter histórico de operações, ajustes e divergências;
4. tornar os saldos e alertas mais acessíveis aos responsáveis;
5. apoiar decisões de inventário, reposição e expedição;
6. gerar evidências que permitam identificar falhas de processo.

O acesso mobile é, portanto, uma resposta a uma condição operacional específica, não o benefício final por si só. O benefício precisa ser demonstrado por melhoria de acuracidade, redução de retrabalho, menor tempo de registro ou maior previsibilidade da operação.

## Necessidades atendidas

- Acompanhar produtos e inventário com atualização próxima da movimentação.
- Registrar entradas, saídas, ajustes e inventários pelo celular.
- Identificar situações de estoque baixo por meio de alertas configuráveis.
- Consultar informações no local da operação.
- Centralizar o acompanhamento de um ou vários armazéns, conforme o escopo validado.
- Preservar histórico, permissões e evidências de reconciliação.

## Benefícios esperados e indicadores

Os benefícios abaixo são hipóteses e não resultados comprovados:

| Benefício esperado | Indicador de validação |
|---|---|
| Registro mais próximo do momento da operação | tempo entre movimentação física e lançamento |
| Maior acuracidade do saldo | divergência entre contagem física e saldo registrado |
| Menos retrabalho | número de ajustes, correções e lançamentos duplicados |
| Inventário mais controlável | tempo de contagem e taxa de itens reconciliados |
| Melhor execução de pedidos | erros de separação, expedição ou conferência |
| Adoção operacional | frequência de uso e conclusão de tarefas críticas |
| Implantação viável | tempo, custo e esforço de treinamento e migração |

Nenhuma meta numérica deve ser apresentada como fato antes de ser definida para um piloto e medida em uma linha de base comparável.

## Escopo inicial de produto

O MVP inclui o núcleo de um WMS mobile-first: empresa, armazém, depositante, usuários, produtos, lotes, endereços, recebimento, movimentação, inventário, picking, expedição, divergências, auditoria, relatórios básicos e migração inicial, conforme [[Requisitos]].

Recursos avançados de múltiplos depositantes, portal, automação física, offline completo, integrações extensas e SaaS permanecem como evolução dependente de evidência. A FocusNFe está selecionada apenas para prova técnica da integração fiscal.
## Migração de dados

A adoção do Estoque Mais também depende de migrar dados existentes de planilhas, ERPs, WMS anteriores ou controles paralelos. Uma migração sem inventário, saneamento, mapeamento e reconciliação pode transportar erros para o novo sistema e comprometer a confiança nos saldos.

Por isso, a implantação deve prever uma carga controlada em etapas: inventário da origem, mapeamento, saneamento, staging area, dry run, aprovação, migração oficial, reconciliação e possibilidade de rollback. A estratégia pode começar por cadastros e estoque inicial, deixando históricos completos para uma etapa posterior conforme a necessidade e o custo.

Esse requisito, definido em [[Requisitos]], reforça que a implantação não é apenas instalação técnica. Ela envolve qualidade dos dados, participação do responsável pelo estoque, evidências de conferência e preservação da origem.

## Hipótese comercial

O modelo comercial ainda está `A validar`. As possibilidades iniciais incluem:

- taxa de implantação e saneamento de dados;
- assinatura por armazém, unidade ou operação;
- cobrança por usuários ou faixas de volume;
- treinamento e suporte recorrente;
- módulos ou integrações adicionais.

O modelo deve ser escolhido depois de entender quem compra, quem usa, qual problema é mais caro e qual resultado o cliente aceita pagar para obter. Essa decisão está relacionada à tese de negócio descrita em [[Elaboração de Negócio e Visão Geral]].

## Fontes externas de fundamentação

- [IBGE — Empresas de transporte, armazenagem e correios](https://anuario.ibge.gov.br/2024/servicos/transportes.html): dimensionamento amplo do setor; não prova, sozinho, demanda pelo produto.
- [IBGE — Pesquisa de Estoques](https://www.ibge.gov.br/estatisticas/todos-os-produtos-estatisticas/9199-pesquisa-de-estoques.html): estrutura e distribuição de unidades de armazenagem.
- [Plano Nacional de Logística — EPL](https://portal.epl.gov.br/plano-nacional-de-logistica-pnl): contexto de eficiência, indicadores e planejamento logístico.
- [DeHoratius e Raman — Inventory Record Inaccuracy](https://pubsonline.informs.org/doi/10.1287/mnsc.1070.0789): evidência acadêmica sobre divergência entre registros e estoque físico.
- [Impactos da imprecisão de inventário em centros de distribuição](https://doi.org/10.1590/0103-6513.20220077): estudo brasileiro sobre imprecisão e contagem cíclica.
- [GS1 — Global Traceability Standard](https://www.gs1.org/docs/traceability/Global_Traceability_Standard.pdf): referência para identificação e rastreabilidade.
- [LGPD — Lei nº 13.709/2018](https://www.gov.br/mj/pt-br/assuntos/sua-protecao/sedigi/Lei13709.pdf): referência para dados pessoais, usuários, permissões e segurança da informação.

## Pontos pendentes

- Definir o segmento prioritário e o comprador principal.
- Confirmar se o problema é suficientemente frequente e caro para justificar compra.
- Entrevistar operadores, gestores e patrocinadores.
- Observar processos reais de recebimento, armazenagem, picking, expedição e inventário.
- Medir uma linha de base antes de afirmar redução de erros ou ganhos de produtividade.
- Definir escopo e critérios do primeiro piloto.
- Validar preço, unidade de cobrança, implantação e disposição a pagar.
- Detalhar as seções **Por onde começar?** e **Principais recursos** da documentação inicial.

> [!warning] Status
> Esta nota sustenta uma hipótese de problema e uma proposta de solução. Ela não comprova mercado, ROI, redução de erros, disposição a pagar ou superioridade sobre ERP, WMS ou planilhas.
## Evidências nacionais sobre o custo da ineficiência de estoque

As fontes nacionais disponíveis sustentam a relevância econômica de perdas, rupturas e baixa acuracidade, mas a maior parte dos dados vem do varejo. Portanto, esses números servem como contexto e hipótese de impacto; não são benchmarks diretos para pequenos 3PLs de Contagem e Betim.

### Indicadores nacionais de referência

- A Pesquisa Abrappe/KPMG, com dados de 2023, apontou perdas médias de 1,57% das vendas, 84% das perdas relacionadas a quebras operacionais, furtos e erros de inventário, ruptura comercial média de 7,65% e ruptura operacional média de 6,11% ([KPMG/Abrappe — Pesquisa de Perdas no Varejo Brasileiro 2024](https://kpmg.com/br/pt/insights/2024/11/pesquisa-abrappe-2024.html)).
- A ABRAS identificou quebra operacional, furto externo, erros de inventário e erros administrativos entre as principais causas de perdas ([ABRAS — Pesquisa de Eficiência Operacional](https://www.abras.com.br/economia-e-pesquisa/pesquisa-de-eficiencia-operacional/pesquisa-2021)).
- Pesquisa anterior da Abrappe/EY registrou acuracidade média de 81,06% no indicador qualitativo e 83,77% no quantitativo, além de ruptura operacional média de 7,94% ([Pesquisa Abrappe/EY](https://www.prevenirperdas.com.br/portal/conteudo/noticias/item/download/249_7311d7bbf552b16ecaf27eae42e132c6.html)).
- Um estudo de caso em uma rede farmacêutica de Minas Gerais elevou a acuracidade de 86,4% para 97,8% e reduziu ajustes anuais de R$ 382 mil para R$ 94 mil após intervenções de controle ([estudo aplicado em Minas Gerais](https://doi.org/10.54899/dcs.v23i99.155)).
- Estudo brasileiro sobre centros de distribuição relaciona imprecisões acumuladas a falsos estoques negativos, reposição desnecessária, retrabalho e perda de confiabilidade do WMS ([estudo sobre centros de distribuição](https://doi.org/10.1590/0103-6513.20220077)).

### Limite de interpretação

Não aplicar diretamente os percentuais do varejo à receita de um 3PL. As populações, definições de perda e processos são diferentes. Para um operador de [[Publico-alvo]], a linha de base deve medir ajustes, recontagens, horas de retrabalho, erros de picking, devoluções, reentregas, multas, descontos e reclamações de depositantes.

### Fórmula inicial para o piloto

```text
Custo mensal da ineficiência =
ajustes de estoque
+ horas de recontagem e retrabalho
+ horas extras
+ erros de picking e expedição
+ devoluções e reentregas
+ multas ou descontos contratuais
+ perdas e avarias
+ relatórios manuais
```

Esses dados devem ser coletados antes e depois do piloto. A evidência nacional confirma a relevância do problema, mas ainda não comprova o índice, o custo ou o ROI específico dos pequenos 3PLs de Contagem e Betim.
## Pressão de custos e justificativa econômica

O problema do Estoque Mais também pode ser formulado como um problema de margem. Dados da ABOL/ILOS indicam que pequenos operadores logísticos enfrentam pressão maior sobre a margem e dificuldade de repassar integralmente os aumentos de custos. O transporte representa a maior parcela da receita média dos operadores, seguido por armazenagem e serviços adicionais ([Perfil ABOL/ILOS](https://www.ecommercebrasil.com.br/noticias/operadores-logisticos-crescem-18-em-2-anos-apontam-abol-e-ilos)).

No contexto macroeconômico, o ILOS estimou que os custos logísticos brasileiros representaram 18,4% do PIB em 2023, com participação relevante de transporte, estoques, armazenagem e administração ([ILOS — Custos logísticos no Brasil](https://www.abolbrasil.org.br/noticias/noticias-do-setor/custos-logisticos-no-brasil-atingem-184-do-pib-em-2023)). Esses números não devem ser aplicados diretamente à receita de um 3PL, mas ajudam a demonstrar que estoque e armazenagem são componentes materiais do custo empresarial.

Para o Estoque Mais, a hipótese econômica é que melhorar o registro, a acuracidade e a prestação de contas possa proteger margem por meio da redução de:

- horas de recontagem e retrabalho;
- erros de picking e expedição;
- devoluções e reentregas;
- descontos e multas contratuais;
- relatórios manuais;
- treinamento repetitivo de operadores;
- perdas de capacidade e confiança dos depositantes.

## Dores nacionais de referência

Pesquisas nacionais de perdas no varejo apontam perdas médias, rupturas e erros de inventário relevantes. A Abrappe/KPMG registrou perdas médias de 1,57% das vendas em 2023, ruptura comercial média de 7,65% e ruptura operacional média de 6,11% ([Pesquisa Abrappe/KPMG](https://kpmg.com/br/pt/insights/2024/11/pesquisa-abrappe-2024.html)). Esses dados são de varejo e não constituem benchmark para 3PLs, mas apoiam a hipótese de que baixa acuracidade e falhas de processo possuem impacto econômico.

A justificativa específica para os operadores de Contagem e Betim deve ser produzida por linha de base própria, medindo custo de ajustes, retrabalho, erros, devoluções, multas e tempo administrativo antes do piloto.
## Arquétipo econômico prioritário

Um caso de ROI especialmente relevante é o operador que combina falta de pessoal qualificado, estrutura física limitada e processos imprecisos. A hipótese de criação de valor é:

```text
estrutura ruim
-> processo pouco padronizado
-> dependência de conhecimento informal
-> erros e registros incompletos
-> retrabalho
-> horas extras e atrasos
-> pressão sobre a margem
```

O Estoque Mais não resolverá a estrutura física nem substituirá profissionais qualificados. Poderá, contudo, reduzir o impacto operacional por meio de workflows guiados, validação de endereço e quantidade, bloqueios, tarefas, tratamento de exceções e trilha de auditoria.

### Modelo teórico de benefício

Para um operador hipotético com 15 funcionários, dois depositantes e processos parcialmente manuais, o custo influenciável pode incluir:

- horas de retrabalho;
- horas extras;
- erros de picking e expedição;
- recontagem e ajustes;
- devoluções e reentregas;
- treinamento repetido.

O valor do piloto deve ser calculado por redução observada nesses componentes. As estimativas iniciais são hipóteses; não devem ser apresentadas como resultado comprovado.

### Indicadores do arquétipo

- tempo para treinar novo operador;
- tempo até executar uma tarefa sem supervisão;
- erros por operador, turno e tarefa;
- horas de retrabalho e horas extras;
- tarefas executadas fora do padrão;
- movimentações sem registro;
- divergência por SKU e endereço;
- tempo de inventário;
- devoluções, reentregas e reclamações.

O piloto deve medir uma linha de base antes da implantação e comparar os mesmos indicadores depois da adoção.
