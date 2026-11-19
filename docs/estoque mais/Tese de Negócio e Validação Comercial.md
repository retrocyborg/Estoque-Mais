---
tipo: tese-de-negocio
status: esboco-inicial
produto: Estoque Mais
fase: descoberta-comercial
---

# Tese de negócio e validação comercial

## 1. Tese central

Pequenos e médios operadores logísticos podem obter valor ao substituir controles fragmentados por um **WMS mobile-first**, rastreável e dimensionado para operações menores. A hipótese é melhorar acuracidade, execução e prestação de contas sem exigir a complexidade de um WMS corporativo avançado.

O primeiro recorte de validação é Contagem e Betim. Esta é uma hipótese de negócio e ainda precisa ser confirmada por entrevistas, observação, piloto e evidências financeiras, conforme [[Decisões vigentes]].
## 2. Cliente prioritário

### Hipótese de ICP

Pequeno operador logístico ou empresa com um galpão Classe C, operação de móveis, eletrônicos ou produtos com necessidade de rastreabilidade, uso relevante de planilhas e dificuldade para explicar divergências de estoque.

### Comprador provável

- dono ou diretor da operação;
- gestor de armazém;
- responsável por logística ou tecnologia;
- operador logístico que precisa demonstrar controle ao seu cliente.

### Usuários influenciadores

- supervisor;
- conferente;
- operador de recebimento, armazenagem, picking ou expedição;
- responsável financeiro ou administrativo.

Essa segmentação é uma hipótese derivada de [[Stakeholders]], da [[Elaboração de Negócio e Visão Geral]] e da especificação refinada. Deve ser confirmada com entrevistas reais.

## 3. Problema caro e frequente

O cliente pode enfrentar:

- saldos incorretos e divergências de inventário;
- retrabalho para localizar produtos e reconstituir movimentações;
- falhas de conferência entre esperado, recebido, separado e expedido;
- dependência de poucas pessoas que conhecem as planilhas e os processos;
- demora para produzir evidências ao cliente do armazém;
- risco de expedir quantidade, lote ou série incorretos;
- baixa visibilidade sobre capacidade e restrições do galpão.

O problema só será considerado validado quando houver frequência, impacto financeiro ou operacional demonstrado por clientes potenciais.

## 4. Alternativas atuais

As alternativas a investigar são:

- planilhas e registros manuais;
- módulos de estoque de ERP;
- WMS de maior porte;
- aplicativos móveis genéricos;
- desenvolvimento interno;
- combinação de sistemas e controles paralelos.

Para cada alternativa, a pesquisa deve registrar custo, tempo de implantação, limitações, nível de adoção e motivo pelo qual o cliente ainda procura uma solução diferente.

## 5. Proposta de valor

O Estoque Mais pretende oferecer uma entrada de menor complexidade para profissionalizar a operação:

- registrar movimentações no local pelo celular;
- reduzir erros e retrabalho;
- localizar saldo por produto, lote e endereço;
- preservar a história das operações críticas;
- tratar divergências com responsáveis e evidências;
- começar com implantação local e evoluir por módulos;
- acomodar restrições físicas reais de operações menores.

A [[Análise SWOT]] apoia a hipótese de diferenciação por simplicidade, foco no essencial, flexibilidade de implantação e custo competitivo. Esses diferenciais ainda não estão comprovados perante o mercado.

## 6. Hipótese de preço e receita

### Modelo inicial a testar

- taxa de implantação e configuração;
- migração ou preparação de cadastros;
- treinamento inicial;
- licença local ou contrato de uso;
- suporte e manutenção recorrentes;
- serviços adicionais de integração ou customização.

### Perguntas de validação

- O cliente prefere licença local, mensalidade ou combinação dos dois?
- Qual valor é aceitável para implantação?
- O suporte deve ser vendido separadamente?
- O comprador paga por armazém, usuário, volume ou módulo?
- Qual custo de implantação torna a solução inviável?
- Existe disposição para pagar por auditoria, integração ou indicadores avançados?

Nenhum preço deve ser tratado como definido antes de entrevistas, propostas comerciais e testes de disposição a pagar.

## 7. Hipótese de ROI

O valor econômico deve ser estimado comparando:

- custo de divergências antes e depois;
- horas de conferência e retrabalho;
- tempo para localizar produtos;
- perdas por expedição incorreta;
- tempo para produzir relatórios e evidências;
- custo de treinamento e substituição de operadores;
- custo total de implantação, licença, suporte e infraestrutura.

### Indicadores sugeridos

- redução percentual de divergências;
- redução de horas de retrabalho por pedido;
- redução do tempo de inventário;
- aumento da acuracidade do saldo;
- redução do tempo de conferência;
- prazo de retorno do investimento;
- custo operacional por movimentação.

## 8. MVP patrocinável

O MVP deve provar valor em uma operação real sem absorver funcionalidades avançadas de um WMS corporativo.

1. empresa, armazém e depositante com separação mínima de dados;
2. usuários, perfis e permissões;
3. produtos, lotes, unidades e endereços;
4. recebimento e comparação entre esperado e recebido;
5. saldo e movimentação pelo celular;
6. picking, conferência e expedição básica;
7. inventário, divergências e auditoria essencial;
8. importação inicial de dados.

Portal e faturamento específico do depositante, configurações avançadas de múltiplos depositantes, automação física, offline completo, integrações extensas e SaaS entram somente após evidência de prioridade e viabilidade.
## 9. Desenho do piloto

### Perfil recomendado

Um galpão real, com operação suficientemente manual para revelar problemas, mas com responsável disposto a fornecer dados e participar da validação.

### Duração a definir

O piloto deve cobrir um ciclo representativo de recebimento, armazenagem, movimentação, inventário e expedição.

### Dados mínimos

- número de produtos e SKUs;
- quantidade de endereços;
- volume de recebimentos e expedições;
- divergências históricas;
- usuários e perfis;
- dispositivos e conectividade disponíveis;
- tempo atual das principais tarefas.

### Evidências

- registros antes e depois;
- métricas de tempo e erro;
- entrevistas com usuários;
- ocorrências e retrabalho;
- decisões de supervisão;
- limitações técnicas encontradas;
- disposição do cliente para continuar usando ou pagar.

## 10. Critérios de sucesso

O piloto poderá ser considerado promissor se demonstrar, em condições declaradas:

- uso recorrente pelos operadores;
- conclusão das tarefas críticas sem duplicidade ou perda de movimento;
- melhora mensurável em pelo menos uma métrica operacional;
- saldos e divergências explicáveis;
- aceitação por operador e gestor;
- implantação e treinamento compatíveis com o perfil do cliente;
- intenção documentada de continuidade ou contratação.

As metas numéricas devem ser definidas antes do piloto ou registradas como hipótese de teste. Não devem ser inventadas após os resultados.

## 11. Riscos comerciais

- o problema ser percebido como incômodo, mas não caro o suficiente para comprar;
- o segmento exigir customizações incompatíveis com um produto repetível;
- o comprador ser diferente do usuário e bloquear a adoção;
- o custo de implantação local superar a margem do produto;
- concorrentes oferecerem pacote mais completo ou já conhecido;
- a operação não possuir dados confiáveis para iniciar;
- a categoria Classe C ser ampla demais para definir uma proposta única.

## 12. Gates de decisão do patrocinador

### Gate 1 — Problema

Continuar somente se entrevistas e observação confirmarem um problema frequente, relevante e com responsável disposto a resolvê-lo.

### Gate 2 — MVP

Continuar somente se o escopo mínimo puder ser implantado sem absorver todo o WMS e sem depender de integrações não validadas.

### Gate 3 — Piloto

Continuar somente se houver uso real, evidência operacional e participação de um cliente ou operação representativa.

### Gate 4 — Expansão

Investir em integrações extensas, portal, recursos avançados de múltiplos depositantes ou SaaS somente após evidência de valor, viabilidade e demanda repetida.

## 13. Fontes e bases de validação

- [[Fontes pendentes#Especificação de requisitos original]]
- [[Fontes pendentes#Requisitos refinados]]
- [[Fontes pendentes#Relatório BTG]]
- Dados públicos e documentação oficial devem ser incorporados apenas quando efetivamente utilizados.
