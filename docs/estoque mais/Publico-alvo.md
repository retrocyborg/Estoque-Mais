---
tipo: publico-alvo
status: hipotese-de-icp
produto: Estoque Mais
fase: descoberta-e-validacao-comercial
regiao_prioritaria: Sudeste
regiao_piloto: Contagem-e-Betim-MG
---

# Público-alvo

## ICP prioritário

O público prioritário do Estoque Mais é formado por pequenos e médios operadores logísticos 3PL da Região Sudeste que administram um ou poucos armazéns, atendem múltiplos clientes ou depositantes, possuem baixa ou média maturidade digital e dependem de planilhas, controles paralelos ou sistemas fragmentados.

A hipótese considera que essas operações precisam melhorar a rastreabilidade de recebimento, armazenagem, inventário, separação e expedição sem absorver o custo e a complexidade de um WMS corporativo completo. Essa tese deve ser validada com base em [[Justificativa]], [[Tese de Negócio e Validação Comercial]] e [[Pontos Atacados e Respostas]].

## Recorte geográfico

O ICP de expansão compreende pequenos e médios 3PLs da Região Sudeste. O primeiro recorte de descoberta e piloto é **Contagem e Betim, em Minas Gerais**, por oferecer um território operacional específico e comparável.

São Paulo, Rio de Janeiro e Espírito Santo permanecem como hipóteses de expansão. A categoria de galpão, o tipo de carga e a maturidade digital devem ser registrados como atributos da operação, sem transformar “Classe C”, móveis ou eletrônicos em requisitos obrigatórios do ICP.

A prospecção deve validar primeiro a repetição da dor em Contagem e Betim antes de ampliar a cobertura geográfica, conforme [[Decisões vigentes]].
## Critérios de enquadramento

### Tipo de negócio

- operador logístico 3PL;
- pequeno ou médio distribuidor regional com operação de armazenagem;
- empresa que administra estoque de terceiros ou múltiplos fluxos de entrada e saída.

### Perfil operacional

- um ou poucos armazéns;
- múltiplos clientes, depositantes ou famílias de produtos;
- recebimento, armazenagem, inventário, picking e expedição recorrentes;
- necessidade de prestar contas ou explicar divergências;
- uso de planilhas, papel, mensagens ou sistemas que não cobrem todo o fluxo.

### Perfil de infraestrutura

Galpões Classe C ou com infraestrutura tecnológica limitada podem ser priorizados como contexto de prospecção. A Classe C é um filtro físico e infraestrutural, não uma definição completa do cliente: a classificação não informa, sozinha, o porte da operação, a maturidade digital, o comprador ou a disposição a pagar.

## Personas e papéis de compra

| Papel | Interesse principal | Influência |
| --- | --- | --- |
| Dono ou diretor do 3PL | reduzir risco, melhorar margem e preservar clientes | comprador ou patrocinador |
| Gerente de operações | controlar produtividade, divergências e nível de serviço | decisor técnico-operacional |
| Supervisor de armazém | organizar tarefas e acompanhar a execução | influenciador e usuário-chave |
| Operador de estoque | registrar movimentações e executar inventário | usuário primário |
| Cliente do 3PL ou depositante | receber visibilidade e prestação de contas | influenciador externo |
| Responsável por TI ou implantação | avaliar integração, segurança, suporte e migração | aprovador técnico, quando existir |

## Dor prioritária a testar

A hipótese principal é que o 3PL perde confiabilidade e eficiência quando a movimentação física ocorre sem registro imediato, quando existem controles paralelos ou quando o saldo não pode ser reconciliado rapidamente.

Essa hipótese deve ser investigada por meio de:

- divergências entre estoque físico e sistema;
- tempo entre a operação e o lançamento;
- retrabalho e ajustes manuais;
- erros de separação ou expedição;
- dificuldade de gerar relatórios para depositantes;
- tempo e custo para implantar ou migrar dados.

## Gatilhos de compra possíveis

- crescimento do volume ou entrada de novo depositante;
- perda de confiança nos saldos;
- auditoria ou exigência de rastreabilidade;
- reclamações de clientes sobre divergências;
- aumento de retrabalho ou erros de expedição;
- substituição de planilhas ou sistema legado;
- necessidade de operar com equipe reduzida.

## Perfil de exclusão inicial

Não priorizar inicialmente:

- grandes operadores com WMS maduro e equipe dedicada de TI;
- operações sem movimentação recorrente de estoque;
- empresas que buscam apenas um relatório financeiro;
- clientes que exigem um WMS completo já na primeira entrega;
- operações sem responsável disponível para validar dados e processos.

## Hipóteses de validação

1. O problema de acuracidade ou visibilidade é frequente e relevante.
2. O comprador possui autoridade e orçamento para iniciar um piloto.
3. O uso mobile reduz atraso ou retrabalho em tarefas críticas.
4. A migração controlada é viável em tempo e custo aceitáveis.
5. Um núcleo comum atende diferentes 3PLs sem customização excessiva.
6. O cliente aceita pagar implantação, assinatura ou ambos.

## Critérios para selecionar o primeiro piloto

- operação 3PL real de Contagem ou Betim, com um ou poucos armazéns;
- pelo menos um processo crítico mensurável;
- disponibilidade de dados mínimos para linha de base;
- responsável operacional comprometido;
- abertura para acompanhar indicadores antes e depois;
- disposição para discutir continuidade ou contratação após o piloto.

> [!warning] Status
> Este público-alvo é uma hipótese de ICP. A classificação 3PL + infraestrutura limitada orienta a descoberta, mas não comprova dor, adequação do produto, disposição a pagar ou tamanho de mercado.

## Bases externas

- [NRE-Poli/USP — Classificação da qualidade de galpões logísticos](https://www.realestate.br/site/conteudo/pagina/1%2C204%2BConheca_a_Classificacao_da_Qualidade_Galpoes_Logisticos.html)
- [Evangelista, McKinnon e Sweeney — Technology adoption by small and medium-sized logistics providers](https://doi.org/10.1108/IMDS-10-2012-0374)
- [Framework de adoção de smart warehousing por 3PLs](https://doi.org/10.1108/JEIM-05-2023-0273)
- [Mapeamento da literatura sobre WMS no contexto 3PL](https://doi.org/10.22306/al.v10i2.377)
## Contexto de mercado e inferências

Dados da ABOL/ILOS indicam que o setor brasileiro de operadores logísticos já possui presença relevante de tecnologia: a edição de 2024 reporta uso amplo de softwares, TMS, WMS e integração com clientes e fornecedores. Esses dados descrevem o conjunto pesquisado e não devem ser tratados como retrato específico dos pequenos e médios 3PLs de São Paulo e Minas Gerais. [ABOL — Receita e perfil dos operadores logísticos](https://abolbrasil.org.br/noticias/noticias/operadores-logisticos-receita-bruta-cresce-e-chega-a-r-192-bi) [ABOL — Integração tecnológica](https://abolbrasil.org.br/noticias/sala-de-imprensa/integracao-de-tecnologias-impulsiona-nova-fase-de-eficiencia-logistica-afirma-abol)

O mercado também é diversificado: os operadores atendem múltiplas indústrias e oferecem transporte, armazenagem, controle de estoque, cross-docking, picking e packing. Isso sugere que a dor do ICP pode não ser ausência total de sistema, mas a existência de lacunas entre o sistema contratado e a operação real.

Para o recorte de São Paulo e Minas Gerais, a inferência de trabalho é que os melhores candidatos estarão em polos com concentração de armazéns, distribuição regional e conexão entre mercados consumidores e corredores de transporte. Essa inferência deve ser testada por município, sem assumir que todos os polos possuem o mesmo perfil.

## Hipóteses de produto derivadas do mercado

As hipóteses abaixo são inferências de produto, não requisitos confirmados:

1. **WMS mobile:** o Estoque Mais deve ter um núcleo WMS próprio, com a experiência mobile como capacidade central para registrar e validar operações no ponto de execução. Pode integrar-se a ERP e outros sistemas, mas não depende de ser apenas uma camada complementar.
2. **Implantação e migração como produto:** o valor pode estar na importação, saneamento, reconciliação e ativação da operação, e não apenas na licença de software.
3. **Núcleo leve para unidades menores:** uma filial, armazém secundário ou operação de menor porte pode precisar de um fluxo mais simples que o WMS corporativo da empresa.
4. **Visibilidade para depositantes:** relatórios, trilha de auditoria e explicação de divergências podem ser mais valiosos para um 3PL do que apenas o saldo interno.
5. **Adoção e treinamento:** onboarding, tarefas guiadas, permissões simples e suporte podem ser parte central da proposta devido à rotatividade e à natureza presencial da operação.
6. **Integração progressiva:** o produto pode começar com arquivos e APIs simples, evoluindo para integração com WMS, ERP, CT-e ou sistemas de clientes conforme a demanda repetida.
7. **Operação em infraestrutura heterogênea:** o produto deve tolerar dispositivos, conectividade e processos diferentes entre armazéns, sem transformar cada implantação em uma customização exclusiva.

## Hipóteses de posicionamento

Devem ser comparadas em entrevistas e pilotos:

- ferramenta de controle mobile para complementar WMS ou ERP;
- solução leve para pequenos armazéns e filiais;
- serviço de implantação, migração e saneamento com software próprio;
- camada de visibilidade e prestação de contas para operações 3PL;
- sistema inicial para 3PLs que ainda dependem de planilhas e controles paralelos.

Não se deve escolher definitivamente entre esses posicionamentos com base apenas em dados setoriais. A decisão depende da dor mais frequente, do comprador e do custo que o cliente aceita pagar para resolver o problema.

## Perguntas de pesquisa atualizadas

- O 3PL já possui WMS ou TMS? Se possui, quais tarefas continuam fora do sistema?
- O problema principal é ausência de tecnologia, baixa adoção, integração ou qualidade dos dados?
- O comprador busca substituir uma ferramenta ou complementar o ambiente atual?
- A dor está no controle interno, na prestação de contas ao depositante ou nos dois?
- Uma solução mobile simples seria aceita como complemento ao WMS?
- Quanto tempo e custo são gastos em implantação, treinamento e migração?
- Em qual área de Contagem ou Betim existe acesso mais fácil a compradores e operações para piloto?
## Pressão econômica e dores de mercado

O recorte de pequenos e médios operadores logísticos deve considerar não apenas empresas sem sistema, mas também empresas que possuem WMS, TMS ou ERP e continuam enfrentando lacunas de integração, adoção, qualidade de dados e controle operacional.

O perfil ABOL/ILOS reporta que os operadores obtêm, em média, 65% da receita com transporte, 27% com armazenagem e 8% com serviços adicionais. A mesma pesquisa indica pressão sobre margens, especialmente entre operadores pequenos, além de dificuldades para repassar aumentos de custos. Esses dados são nacionais e não comprovam o cenário específico de Contagem e Betim ([Perfil ABOL/ILOS](https://www.ecommercebrasil.com.br/noticias/operadores-logisticos-crescem-18-em-2-anos-apontam-abol-e-ilos)).

Para o ICP, isso cria três hipóteses de dor:

- pressão sobre margem por combustível, mão de obra, aluguel, estoque e tecnologia;
- complexidade crescente causada por múltiplos clientes, serviços e exigências de prestação de contas;
- necessidade de reduzir retrabalho, erros e custo de implantação sem substituir necessariamente todos os sistemas atuais.

## Dados a confirmar com pequenos operadores

- custo mais pressionado no último ano;
- capacidade de repassar aumentos ao cliente;
- horas de inventário e recontagem;
- erros de picking, expedição e devolução;
- controles mantidos fora do WMS ou ERP;
- custo de treinamento e turnover;
- descontos, multas ou reclamações associados a divergências;
- interesse em uma solução complementar ou substituta.

Essas perguntas devem orientar a seleção de entrevistas e pilotos em Contagem e Betim.
## Arquétipo prioritário de dor

Um perfil prioritário dentro do ICP é o pequeno ou médio operador logístico que sofre com falta de pessoal qualificado, estrutura física limitada e processos pouco padronizados. Nesse ambiente, o conhecimento fica concentrado em poucos operadores experientes e a entrada de novos profissionais aumenta a probabilidade de erros, registros incompletos e retrabalho.

### Cadeia de problema

```text
estrutura limitada
-> processo pouco padronizado
-> dependência de conhecimento informal
-> erros e registros incompletos
-> retrabalho
-> horas extras e atrasos
-> pressão sobre a margem
```

Esse arquétipo não significa que o produto resolverá a infraestrutura física ou substituirá profissionais qualificados. A hipótese é que o sistema possa reduzir o impacto operacional dessas limitações por meio de fluxos guiados, validações, tarefas padronizadas e histórico.

### Critérios para validar o arquétipo

- alta rotatividade ou dificuldade de treinamento;
- dependência de operadores experientes;
- tarefas executadas de formas diferentes por pessoa ou turno;
- endereços, produtos ou processos pouco padronizados;
- recontagens e correções frequentes;
- horas extras relacionadas a retrabalho;
- abertura para testar workflows mobile guiados.
