# Stakeholders

A identificação de stakeholders foi refinada a partir do ICP prioritário descrito em [[Publico-alvo]]: pequenos e médios operadores logísticos 3PL da Região Sudeste, distribuidores regionais e operações de armazenagem com baixa ou média maturidade digital. Os papéis abaixo são hipóteses derivadas do escopo funcional e ainda precisam ser confirmados com entrevistas. O primeiro recorte de descoberta é Contagem e Betim; o restante do Sudeste permanece como expansão. O primeiro recorte de descoberta é Contagem e Betim; o restante do Sudeste permanece como expansão.

## Stakeholders do cliente prioritário

| Stakeholder | Relação com o produto | Necessidade ou interesse | Status |
| --- | --- | --- | --- |
| Dono ou diretor do 3PL | Patrocina ou compra a solução | Reduzir risco, melhorar margem e preservar clientes | Hipótese de comprador |
| Gerente de operações | Decide ou influencia a adoção | Controlar divergências, produtividade e nível de serviço | Hipótese de decisor |
| Supervisor de armazém | Coordena a execução diária | Distribuir tarefas e acompanhar recebimento, inventário e expedição | Hipótese de influenciador |
| Operador de estoque | Usa o produto no local da operação | Registrar movimentações com rapidez e simplicidade | Usuário primário hipotético |
| Cliente do 3PL ou depositante | Recebe o serviço e os resultados | Obter visibilidade, prestação de contas e confiabilidade dos saldos | Influenciador externo |
| Responsável por TI ou implantação | Avalia condições técnicas | Verificar integração, segurança, backup, suporte e migração | A validar |
| Equipe de implantação do Estoque Mais | Configura e sustenta a solução | Migrar dados, treinar usuários e acompanhar indicadores | A definir |

## Stakeholders secundários

- fornecedores de ERP, WMS ou sistemas legados;
- responsáveis por transporte e expedição;
- auditores ou responsáveis por inventário;
- parceiros de hardware, leitores e infraestrutura;
- patrocinadores financeiros ou investidores do produto;
- responsáveis por proteção de dados e segurança, quando aplicável.

## Necessidades a validar

- Quem possui autoridade para aprovar um piloto e contratar a solução.
- Em qual estado e praça a operação está localizada e se existem diferenças relevantes entre SP, MG, RJ e ES.
- Qual problema é mais caro para o 3PL: divergência, retrabalho, atraso, erro de expedição ou perda de visibilidade.
- Se múltiplos depositantes são uma dor real e recorrente.
- Quais tarefas precisam ser executadas no celular.
- Quais permissões e responsabilidades devem ser separadas.
- Quais dados precisam ser migrados e quem aprova a reconciliação.
- Quais indicadores o cliente já acompanha.
- Qual nível de conectividade e hardware existe no armazém.
- Qual modelo comercial seria aceitável: implantação, assinatura, usuário, armazém ou volume.

## Matriz de influência e interesse

| Grupo | Influência | Interesse | Abordagem inicial |
| --- | --- | --- | --- |
| Dono ou diretor | Alta | Alta | Validar dor, risco, orçamento e decisão de compra |
| Gerente de operações | Alta | Alta | Mapear processos, indicadores e critérios do piloto |
| Supervisor | Média | Alta | Observar execução e identificar retrabalho |
| Operador | Baixa individualmente | Alta | Testar usabilidade e aderência ao fluxo real |
| Cliente do 3PL | Média ou alta | Média ou alta | Validar visibilidade e qualidade do serviço percebido |
| TI ou implantação | Média | Média ou alta | Validar integração, segurança e migração |

## Plano de descoberta

1. Selecionar uma ou duas praças prioritárias no Sudeste.
2. Entrevistar o comprador e o gerente de operações.
3. Observar pelo menos um ciclo de recebimento, movimentação, inventário e expedição.
4. Entrevistar operadores e supervisores separadamente.
5. Medir uma linha de base de divergências, tempo de registro e retrabalho.
6. Validar o impacto percebido pelo cliente do 3PL ou depositante.
7. Registrar critérios de sucesso, responsáveis e decisão de continuidade.

> [!warning] A validar
> Os stakeholders, papéis de compra e níveis de influência ainda são hipóteses. A classificação 3PL e Classe C orienta a seleção de entrevistas, mas não substitui a confirmação do organograma, da autoridade de compra e das necessidades reais.
## Implicações do contexto de mercado

O mercado de operadores logísticos já apresenta adoção relevante de WMS, TMS, softwares e integrações, conforme os dados da ABOL/ILOS. Portanto, o stakeholder não deve ser tratado apenas como uma empresa sem tecnologia. O problema pode estar na baixa adoção, em controles paralelos, na migração, na integração ou na falta de visibilidade para clientes e depositantes. Essa é uma inferência de mercado a validar com operadores de São Paulo e Minas Gerais.

## Interesses e objeções por stakeholder

| Stakeholder | Interesse potencial | Objeção provável | Evidência necessária |
| --- | --- | --- | --- |
| Dono ou diretor do 3PL | proteger margem, retenção e crescimento | custo sem ROI claro | impacto financeiro e intenção de compra |
| Gerente de operações | reduzir divergências e retrabalho | solução pode atrapalhar o fluxo | piloto com indicadores antes/depois |
| Supervisor de armazém | controlar tarefas e produtividade | equipe pode rejeitar mudanças | observação, teste de usabilidade e adoção |
| Operador de estoque | executar tarefas com rapidez | mais telas ou registros | tempo de tarefa e taxa de conclusão |
| Cliente do 3PL ou depositante | receber visibilidade e prestação de contas | dados podem continuar inconsistentes | relatórios, auditoria e reconciliação |
| Responsável por TI | integrar, proteger e sustentar a solução | duplicação em relação ao WMS atual | arquitetura, APIs, segurança e suporte |
| Equipe de implantação | migrar e ativar clientes | customização excessiva | horas por implantação e taxa de erro |
| Investidor ou patrocinador | validar mercado e escala | serviço pode não ser repetível | CAC, margem, tempo de implantação e retenção |

## Hipóteses de produto por stakeholder

- Para o dono ou diretor: painel de valor operacional, custo de implantação e evidência de ROI.
- Para o gerente: indicadores de divergência, retrabalho, inventário, picking e expedição.
- Para o supervisor: fila de tarefas, prioridades, exceções e acompanhamento de equipe.
- Para o operador: interface mobile simples, leitura de código e poucos passos por tarefa.
- Para o depositante: visibilidade por cliente, histórico, saldo explicado e relatórios exportáveis.
- Para TI: integração incremental, controle de acesso, backup, auditoria e migração reversível.
- Para implantação: templates, staging, dry run, reconciliação e configuração sem código.
- Para o investidor: núcleo comum, baixo custo marginal, evidência de repetição entre clientes e receita recorrente.

## Recorte de descoberta em São Paulo e Minas Gerais

A primeira amostra deve concentrar-se em operadores de Contagem e Betim. Comparações com outras praças de Minas Gerais e São Paulo entram depois que houver repetição do problema no recorte inicial.

Para cada operação, registrar porte, tipo de carga, infraestrutura, maturidade tecnológica, comprador, usuários e processo crítico. A classificação física do galpão não substitui a análise da decisão de compra.

O objetivo é identificar se o Estoque Mais entra como WMS principal de uma operação menor ou se precisa coexistir com ERP e sistemas legados, preservando a definição de WMS mobile-first em [[Decisões vigentes]].