# Estoque Mais

Conforme [[Decisões vigentes]], o **Estoque Mais** é um WMS mobile-first para pequenos e médios operadores logísticos 3PL. O mobile integra o núcleo da execução de recebimento, armazenagem, movimentação, inventário, picking e expedição. O primeiro recorte de piloto é Contagem e Betim; o restante do Sudeste permanece como expansão.

## Funcionalidades apresentadas na fonte inicial

- Cadastrar produtos.
- Registrar entradas e saídas.
- Acompanhar produtos e o inventário em tempo real.
- Receber alertas de estoque baixo.
- Consultar relatórios pelo celular.

## Estado da documentação

Na documentação Mintlify consultada, as seções **Por onde começar?** e **Principais recursos** estão presentes, mas não possuem conteúdo detalhado. Portanto, instruções de uso, requisitos e descrições adicionais permanecem **A validar**.

## Fonte

- [Estoque +: controle de estoque no seu celular](https://app.mintlify.com/estoque-mais/estoque-mais/~/Estoque-controle-de-estoque-no-seu-celular-85ac2737-4ed4-4fec-abf9-f188c61de879), consultada em 2026-10-30.
## Contexto de mercado e implicações para o produto

O setor de operadores logísticos apresenta crescimento e diversificação, mas também pressão de custos e margem. Dados ABOL/ILOS indicam que o transporte representa a maior parcela da receita média dos operadores, seguido por armazenagem e serviços adicionais. A pesquisa também aponta dificuldade de repassar integralmente aumentos de custos, especialmente entre operadores menores ([Perfil ABOL/ILOS](https://www.ecommercebrasil.com.br/noticias/operadores-logisticos-crescem-18-em-2-anos-apontam-abol-e-ilos)).

Isso sugere que o Estoque Mais não deve ser apresentado apenas como aplicativo de inventário. Para o público definido em [[Publico-alvo]], o produto pode ser uma ferramenta de proteção de margem e de confiabilidade operacional.

## Hipóteses de valor do produto

- reduzir retrabalho em inventários e conferências;
- diminuir erros de picking, expedição e devolução;
- acelerar o treinamento de operadores;
- reduzir dependência de controles paralelos;
- melhorar a prestação de contas aos depositantes;
- apoiar a identificação de gargalos que pressionam a margem;
- complementar WMS ou ERP quando a adoção no chão de armazém for insuficiente;
- reduzir custo e risco de migração e implantação.

## Limite das evidências

Dados nacionais de perdas, rupturas e custos logísticos sustentam o contexto da oportunidade, mas não comprovam o cenário específico de pequenos operadores de Contagem e Betim. O produto deve ser validado com uma linha de base operacional e indicadores de [[Justificativa]], antes de afirmar economia ou retorno sobre investimento.
## Arquétipo operacional e implicações de produto

O primeiro caso de uso prioritário pode ser um operador logístico com falta de pessoal qualificado, estrutura física limitada e processos imprecisos que geram retrabalho. Para esse cenário, o valor do produto está em padronizar a execução e impedir erros básicos, não apenas em exibir saldos.

### Capacidades prioritárias

- workflows guiados para recebimento, movimentação, inventário, picking e expedição;
- leitura de código de barras;
- validação de endereço, produto e quantidade;
- bloqueio de operações incompatíveis;
- lista de tarefas e tratamento de exceções;
- permissões por função;
- trilha de auditoria;
- treinamento contextual;
- relatórios de retrabalho, divergências e produtividade;
- migração simples e configuração reutilizável.

O produto deve exigir condições mínimas para o piloto: endereços identificáveis, produtos cadastráveis, responsável operacional e rotina básica de recebimento e expedição. Software sozinho não corrige uma estrutura física sem identificação ou um processo sem qualquer padrão.

### Hipótese de posicionamento

> Para pequenos e médios operadores logísticos com falta de pessoal qualificado e processos pouco padronizados, o Estoque Mais transforma conhecimento informal em fluxos guiados, validações e registros rastreáveis, reduzindo retrabalho e protegendo a margem.
## Decisão estrutural: WMS com mobile como núcleo

O Estoque Mais será concebido como um **WMS para pequenos e médios operadores logísticos**, com a experiência mobile como capacidade central e não como módulo opcional. O sistema deve apoiar recebimento, armazenagem, movimentação, inventário, picking, expedição, divergências, auditoria e relatórios.

O recorte do MVP será de complexidade e porte — não uma renúncia ao núcleo WMS. Funcionalidades avançadas de WMS corporativo, integrações extensas, automação física e otimizações avançadas podem ficar fora da primeira versão, mas a arquitetura deve preservar o domínio de armazém e permitir sua evolução.

Essa decisão substitui a formulação anterior de que o produto seria apenas uma camada mobile complementar. O mobile é uma característica estrutural do WMS porque o trabalho ocorre no local da operação, sob restrições de pessoal, infraestrutura e conectividade.
