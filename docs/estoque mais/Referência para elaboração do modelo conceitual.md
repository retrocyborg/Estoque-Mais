---
tipo: referencia-de-modelagem
status: referencia-vigente
produto: Estoque Mais
atualizado_em: 2026-11-11
---

# Referência para elaboração do modelo conceitual

## Objetivo e uso

Esta nota reúne o contexto necessário para elaborar, revisar e evoluir o modelo conceitual do Estoque Mais. Ela orienta a descoberta do domínio e serve de checklist de cobertura; não substitui decisões aprovadas, requisitos, modelo conceitual/lógico existente ou validação com operadores.

Use junto com [[Decisões vigentes]] (decisões aprovadas), [[Requisitos]] (comportamentos exigidos), [[Modelo lógico e conceitual]] (modelo em consolidação), [[Implementação técnica]] (limites e decisões técnicas), [[Structure/pendent]] (questões em aberto) e [[Tese de Negócio e Validação Comercial]] (contexto e piloto). Havendo divergência, decisões aprovadas prevalecem; conteúdo não confirmado deve permanecer marcado como hipótese ou pendência.

## Etapa atual e limites

O projeto está em descoberta e validação. O produto pretendido é um WMS mobile-first para pequenos e médios operadores logísticos 3PL. O primeiro recorte de descoberta/piloto é Contagem e Betim, MG; o ICP de expansão é a Região Sudeste. Adequação ao mercado, ROI, adoção e disposição a pagar ainda não foram comprovados.

O MVP prioriza processos essenciais de armazém e implantação inicial no ambiente do cliente. A nota de modelo continua em consolidação e não define esquema de banco, APIs ou arquitetura implementada. Não há código de aplicação nesta pasta do vault. Integração FocusNFe está aprovada apenas como prova técnica futura de consulta a CT-e emitido; ainda não implementada nem homologada.

## Escopo do domínio a representar

O modelo deve descrever o que existe no negócio, como se relaciona e quais fatos mudam durante a operação:

- organização operadora, pessoas/organizações participantes e responsabilidades;
- usuários internos, perfis, permissões e escopo de acesso por depositante;
- depositantes, clientes, fornecedores e seus vínculos;
- armazéns, áreas, endereços e estruturas temporárias (paletes/gaiolas, quando aplicável);
- catálogo por depositante: produto, SKU, código de barras, unidade, lote, série, peso e dimensões;
- saldo físico e sua composição, reservas, bloqueios, inspeção, movimentos e histórico;
- recebimento, conferência, putaway/armazenagem, transferências e ocorrências;
- pedido de saída, reserva, tarefa de picking, conferência, aval do cliente e expedição;
- inventário, contagem, divergência, ajuste e aprovação;
- devolução vinculada à expedição, inspeção e destinação;
- auditoria, anexos/evidências e integrações fiscais;
- carga de dados mestres e saldo inicial de migração.

Relatórios, indicadores, telas, endpoints, tabelas físicas e detalhes de framework pertencem a requisitos, arquitetura ou implementação; incluí-los como entidades somente quando representarem um conceito persistente do domínio.

## Glossário de domínio

- **Empresa operadora:** operador 3PL que usa o WMS para executar processos e atender múltiplos participantes.
- **Depositante:** entidade/parte responsável pelo estoque armazenado; determina segregação mínima de saldos e autorização.
- **Cliente:** destinatário e participante da conferência de uma saída. É papel distinto de depositante; a mesma pessoa jurídica pode exercer ambos sem fundir cadastros ou papéis.
- **Vínculo cliente-depositante:** associação explícita N:M, ativa ou inativa, que permite validar a combinação usada no pedido.
- **Armazém:** instalação da empresa operadora; um depositante pode operar em vários armazéns mediante associação explícita.
- **Produto:** item de catálogo no contexto do depositante, com unidade e política de rastreabilidade.
- **SKU:** código do produto único dentro de um depositante; pode se repetir em outro depositante.
- **Lote:** agrupamento rastreável de unidades de produto.
- **Número de série:** identificador de unidade individual associada a produto e lote.
- **Posição/saldo de estoque:** projeção de quantidade física em um escopo de produto e localização, sob condição e rastreabilidade aplicáveis.
- **Reserva:** compromisso de parte do saldo físico para um pedido; reduz disponibilidade, mas não reduz o físico.
- **Bloqueio/inspeção:** restrição que torna quantidade indisponível por motivo; não é baixa física.
- **Movimento:** fato registrado de entrada, saída, transferência ou ajuste que altera quantidade, localização ou condição física; não é apagado para corrigir histórico.
- **Pedido de saída:** demanda de estoque de um depositante para um cliente, vinculada a um fluxo operacional.
- **Aval do cliente:** decisão operacional do representante autorizado após conferência. Pode ser comprovada por e-mail, assinatura ou documento anexado; não é evento fiscal nem baixa de estoque.
- **Expedição:** conclusão física do fluxo de saída. No fluxo inicial, a baixa ocorre uma vez ao final da expedição integral.
- **Estado fiscal:** informação independente retornada pelo provedor fiscal; não substitui estados operacionais ou movimentos físicos.

## Entidades conceituais e fatos a esclarecer

A lista é ponto de partida, não imposição de uma entidade/tabela por item. Consolidar conceitos apenas quando sua identidade, ciclo de vida e regras forem realmente os mesmos.

| Conceito | Responsabilidade no domínio | Identidade ou vínculo importante |
|---|---|---|
| Empresa operadora | Define o contexto do 3PL | Dona dos armazéns e usuários internos |
| Usuário | Identifica quem executa ou aprova ações | Associado a perfis e escopos autorizados |
| Perfil e permissão | Expressa capacidades internas | Acesso negado por padrão; escopo por depositante |
| Organização/pessoa | Representa uma parte participante | Pode exercer papel de cliente, depositante ou fornecedor sem fundir papéis |
| Depositante | Segrega responsabilidade e estoque | Relaciona-se N:M com clientes; associado a armazéns |
| Cliente | Destinatário e participante de saída | Relaciona-se N:M com depositantes |
| Vínculo cliente-depositante | Controla associação operacional | Ativo/inativo; desativação exige aprovação de supervisor |
| Armazém, área, endereço | Representa estrutura física | Endereço pertence a uma estrutura; capacidades/tolerâncias carecem de validação |
| Produto | Define item e regras de catálogo | Pertence ao contexto de depositante no MVP |
| SKU/código de barras | Identifica produto no contexto | Unicidade por depositante; leitura usa contexto ativo |
| Lote/série | Rastreia grupos/unidades | Lote único por produto/depositante; série única por produto/depositante e vinculada a lote |
| Unidade de medida | Dá significado às quantidades | Conversões e unidade-base ainda precisam de especificação detalhada |
| Posição de estoque | Projeta saldo por escopo | Empresa, depositante, produto, armazém, endereço, lote/série e condição aplicáveis |
| Movimento de estoque | Mantém trilha de fatos físicos | Quantidade positiva, tipo, origem/destino, autor, instante e referências |
| Reserva | Compromete disponibilidade | Vinculada a pedido e posições; ciclo de criação/liberação/consumo |
| Bloqueio/inspeção | Retira quantidade da disponibilidade | Motivo, quantidade, origem, solicitante/aprovador e encerramento |
| Recebimento | Controla entrada esperada e conferida | Depositante e fornecedor/documento de origem quando disponíveis |
| Pedido de saída | Define demanda e destinatário | Exatamente um depositante e cliente; vínculo ativo exigido na validação |
| Tarefa de operação | Orienta execução mobile | Atribuição, sequência, responsável, estado e resultado; separar da movimentação física |
| Conferência | Registra quantidades/ocorrências verificadas | Associada ao recebimento ou pedido e a quem verificou |
| Representante autorizado | Pode expressar aval em nome do cliente | Cadastro pelo supervisor e organização/papel; vigência/substituição ainda aberta |
| Aval/decisão do cliente | Registra decisão, data/hora e evidência | Representante autorizado; evidência por e-mail, assinatura ou documento |
| Expedição | Registra saída física concluída | Pedido integral; gera a baixa única no fluxo inicial |
| Inventário/contagem | Observa quantidade em um escopo e instante | Snapshot/versionamento e reconciliação de movimentos posteriores |
| Divergência/ajuste | Registra diferença e correção aprovada | Recontagem obrigatória; justificativa e aprovação de supervisor |
| Devolução | Registra entrada relacionada a saída anterior | Referência à expedição; indisponível até inspeção e destinação |
| Evidência/anexo | Preserva documento comprobatório | Referência ao fato/decisão, origem, data e metadados; requisitos de retenção/privacidade a detalhar |
| Evento de auditoria | Registra ação crítica e resultado | Ator, instante, entidade, valores relevantes, justificativa/aprovação |
| Consulta fiscal | Registra tentativa e retorno do provedor | Referência, estado bruto e reconciliação, sem duplicar movimento |
| Carga de saldo inicial | Registra origem do saldo migrado | Data/hora, lote de carga, evidências e movimento inicial rastreável |

## Relacionamentos e cardinalidades já estabelecidos

- Empresa operadora 1:N armazéns e usuários internos, conforme escopo de operação.
- Depositante N:M cliente por vínculo explícito ativo/inativo. Cada pedido tem exatamente 1 depositante e 1 cliente e requer vínculo ativo na validação.
- Depositante N:M armazém por associação explícita.
- Depositante 1:N produtos; produto tem SKU único por depositante.
- Produto 1:N lotes; lote é único por produto e depositante. Produto serializado requer lote; série pertence a um produto e lote e é única por produto/depositante.
- Armazém 1:N áreas/endereço, com hierarquia física conforme detalhamento aprovado no modelo.
- Estoque é segregado no mínimo por empresa, depositante, produto, armazém, endereço e rastreabilidade/condição aplicáveis.
- Pedido 1:N linhas de pedido; cada linha referencia produto e quantidade. Reserva vincula demanda à quantidade/posição elegível; a cardinalidade final entre reserva e linha deve preservar múltiplas alocações sem duplicar demanda.
- Recebimento e pedido relacionam-se a conferências, tarefas, ocorrências e movimentos segundo o fluxo; uma etapa operacional não deve ser confundida automaticamente com um movimento.
- Pedido de saída tem zero ou um aval vigente por decisão registrada? **A cardinalidade e o tratamento de recusas, substituições e nova aprovação ainda devem ser validados.** Evite fixar cardinalidade antes de fechar esse ciclo.
- Expedição integral concluída gera exatamente uma baixa física. Devolução referencia uma expedição anterior e pode originar entradas inspecionadas.
- Contagem registra observações; divergência liga observado ao saldo/snapshot; ajuste aprovado gera movimento corretivo rastreável.
- Evidência é ligada ao evento/decisão que comprova; definir se um evento pode ter várias evidências e formatos permitidos.
- Consulta fiscal pode ter várias tentativas para uma referência, preservando retorno bruto e estado da integração.

Cardinalidades que não devem ser inventadas: quantidade de aprovações por pedido, estrutura organizacional entre empresa e cliente, vínculo de usuário com empresa versus depositante além da regra aprovada, dependência fiscal por fluxo e restrições adicionais de contrato/armazém/produto no vínculo cliente-depositante.

## Ciclos operacionais que o modelo deve sustentar

### Recebimento e armazenagem

1. Planejar/registrar recebimento esperado quando houver origem conhecida.
2. Conferir quantidade e identificar produto, lote/série, condição e divergências.
3. Confirmar entrada física com movimento para endereço de recebimento.
4. Executar putaway como transferência para endereço de armazenagem.
5. Preservar usuário, instante, origem/destino, quantidade e justificativas.

A obrigatoriedade de documento/origem, tratamento de excedente/falta, unidade alternativa e aprovação de divergência precisa ser detalhada nos requisitos e regras pendentes.

### Saída, picking, aval e expedição

1. Criar pedido para exatamente um cliente e um depositante; validar vínculo ativo.
2. Validar estoque elegível e reservar atomicamente sem alterar saldo físico.
3. Atribuir tarefas e realizar picking; `em_separacao` é estado operacional, não baixa.
4. Conferir pedido separado e registrar divergências.
5. Registrar aval do representante autorizado como pré-condição operacional da expedição; conferente transcreve a decisão sem decidir pelo cliente. Evidência pode ser e-mail, assinatura ou documento anexado.
6. Concluir expedição integral fisicamente e gerar uma única baixa do estoque, consumindo a reserva.
7. Em cancelamento antes da expedição, liberar reservas com histórico. Após a baixa, tratar entrada por devolução vinculada; não cancelar nem apagar a saída.

No MVP não há expedição parcial nem saldo físico negativo. O efeito de desativar o vínculo cliente-depositante sobre pedidos em andamento segue pendente.

### Bloqueios e inventário

- Bloqueio solicitado por operador é aprovado por supervisor. Em urgência, usuário autorizado pode bloquear imediatamente, com revisão posterior do supervisor.
- Se houver reserva ativa, liberar/cancelar atomicamente e auditar antes de retirar quantidade da disponibilidade; evitar subtrair a mesma parcela como reserva e bloqueio.
- Toda divergência de inventário exige recontagem. Ajuste requer justificativa e aprovação de supervisor.
- Usar snapshot/versionamento do escopo no início da contagem e reconciliar movimentos posteriores antes do ajuste.
- Devolução permanece indisponível até inspeção; supervisor aprova disponibilidade ou classificação não utilizável.

## Regras transversais e invariantes

1. **Separação de papéis:** cliente e depositante são distintos, inclusive quando a mesma pessoa jurídica exerce ambos; nunca inferir um pelo outro.
2. **Isolamento/autorização:** acesso por perfil e depositante, com negação por padrão. Usuários veem apenas depositantes associados; concessão de escopo de empresa é explícita e auditada. Cliente externo não possui portal/conta no MVP.
3. **Catálogo contextualizado:** SKU e código de barras únicos por depositante; duplicidade entre depositantes é permitida e resolvida pelo contexto ativo.
4. **Rastreabilidade:** lote obrigatório por padrão; exceção definida por produto, com motivo, responsável e aprovação do supervisor; nunca para produto serializado. Série exige lote.
5. **Saldo:** disponibilidade calculada = físico − reservas ativas − bloqueios, sem dupla dedução. Reserva, separação e aval não são baixa. Saldo físico negativo é proibido.
6. **Integridade do movimento:** registrar entradas/saídas/transferências/ajustes como fatos auditáveis; corrigir por movimento vinculado, não apagar ou reescrever histórico.
7. **Baixa idempotente:** repetição de confirmação/reenvio não cria movimentos duplicados. Baixa física ocorre uma única vez quando a expedição integral é concluída.
8. **Online para estoque:** movimentos e reservas exigem conexão. Offline pode preservar rascunho não confirmado; saldo em cache não autoriza operação. Reenvio deve usar idempotência.
9. **Segregação de eventos:** decisão do cliente, despacho físico, movimento de estoque e estado fiscal são eventos relacionados, mas distintos.
10. **Auditoria:** registrar ator, instante, ação, entidade, valores relevantes, justificativa, aprovação e resultado para operações críticas.
11. **Migração:** MVP carrega cadastros operacionais e saldo inicial por depositante/produto/armazém/endereço/lote-série/condição, sem histórico anterior de movimentos; carga aceita gera movimento inicial rastreável e deve admitir reconciliação/rollback.
12. **Fiscal:** consulta FocusNFe de CT-e emitido por referência permanece escopo de prova. Preservar estado bruto, `status_sefaz` e `mensagem_sefaz` quando disponíveis. Falha de rede/autenticação/timeout/não encontrado é estado da integração, não rejeição/cancelamento fiscal. CT-e recebido, emissão e cancelamento estão fora do escopo inicial; integração não cria nem duplica movimento e não bloqueia expedição por padrão.

## Matriz de permissões aprovada como fatos do domínio

| Perfil | Capacidades e limites aprovados |
|---|---|
| Administrador | Gerencia usuários, perfis, cadastros e configurações; aprova bloqueios/ajustes apenas se também tiver papel de supervisor. Escopo de empresa explícito e ações administrativas auditadas. |
| Supervisor | Opera depositantes associados, distribui tarefas, aprova bloqueios e ajustes, cadastra representantes autorizados; não aprova a própria solicitação. Aprova desativação de vínculo cliente-depositante. |
| Operador | Executa tarefas atribuídas de recebimento, armazenagem, movimentação e picking; solicita bloqueios e registra ocorrências; não aprova ajustes, bloqueios ou aval em nome do cliente. |
| Conferente | Registra conferência e divergências; transcreve a decisão do representante autorizado e anexa evidência; não decide pelo cliente nem aprova ajustes. |
| Auditor | Somente leitura nos depositantes atribuídos, sem movimentação ou aprovação. |

Esta matriz descreve capacidades no domínio. Estratégia de papéis múltiplos, permissões granulares, autenticação, delegação e segregação técnica permanecem detalhes de autorização/implementação a especificar.

## Decisões aprovadas, propostas e pendências

### Aprovado e vigente

- WMS mobile-first para pequenos e médios 3PLs; piloto de descoberta inicial em Contagem e Betim; implantação inicial no ambiente do cliente.
- Depositante é entidade de domínio, com separação mínima de dados, permissões e saldos; cliente é papel distinto.
- Vínculo cliente-depositante N:M, ativo/inativo; pedido aponta um de cada e exige par ativo; desativação exige aprovação de supervisor.
- SKU/barcode por depositante; regras de lote/série acima.
- Reserva não reduz físico; saldo disponível é calculado; sem saldo negativo; saída integral com baixa única ao concluir expedição.
- Aval operacional por representante autorizado, comprovável por e-mail, assinatura ou anexo; FocusNFe não substitui aval ou baixa.
- Perfis operacionais da matriz; estoque online-only e integração fiscal limitada à prova CT-e emitido.

### Hipóteses a validar

- Existência, intensidade e custo das dores de operação nos 3PLs do recorte.
- Adequação do produto, facilidade de adoção mobile, ROI, preço, implantação, suporte e disposição a pagar.
- Restrições específicas de infraestrutura, endereços, equipamentos e carga em cada operação.
- Valor de workflows, automação, indicadores e integração na compra/continuidade.

### Pendências que afetam o modelo

- Vigência, comprovação, substituição e revogação da autorização do representante do cliente.
- Recusa do aval, nova conferência, nova aprovação e histórico de decisões.
- Tratamento de pedidos em andamento após desativação do vínculo cliente-depositante.
- Taxonomia padronizada de motivos e evidências para bloqueio, desbloqueio, cancelamento, devolução e recusa.
- Tolerâncias de peso, capacidade de endereço/veículo, unidade de medida e divergências fiscais baseadas em dados documentados.
- Tratamento detalhado de faltas/excedentes no recebimento, conversões de unidade e disposição de produto não utilizável.
- Rastreio de validade e datas se aplicável, além de política de exclusão/anonimização e retenção de dados/anexos.
- Fonte, qualidade, leiaute e conciliação dos dados de abertura; relação formal de movimento de abertura com carga e evidências.
- Gate fiscal por fluxo e cardinalidade/histórico de consultas e documentos associados.
- Limites de concorrência, temporalidade e versionamento necessários à consistência sob operação real.

A lista atualizada de trabalho está em [[Structure/pendent]]. Não representar itens acima como regra aprovada sem decisão explícita.

## Roteiro para elaborar ou revisar o modelo conceitual

1. Confirmar o escopo e a etapa do produto em [[README]] e [[Decisões vigentes]].
2. Coletar termos usados por operadores, conferentes, supervisores e representantes; registrar sinônimos e evitar que o nome de uma tela dite a entidade.
3. Listar eventos de negócio observáveis: recebimento conferido, reserva criada/liberada, bloqueio, recontagem, aval aceito/recusado, expedição concluída, ajuste aprovado, devolução inspecionada.
4. Identificar participantes, responsabilidades e autoridade em cada evento; relacionar perfis aprovados sem antecipar mecanismo técnico.
5. Descobrir entidades por identidade/ciclo de vida; distinguir cadastro, associação, transação, evento, estado derivado e evidência.
6. Definir vínculos e cardinalidades com regras de participação e temporalidade: obrigatório/opcional, um/muitos, vigente/histórico, ativo/inativo.
7. Descrever atributos conceituais somente quando carregarem significado de negócio; indicar unidade, origem, possibilidade de ausência e histórico necessário.
8. Formular invariantes e pré/pós-condições; testar separação cliente-depositante, concorrência de reservas, bloqueio de reserva, cancelamento, reenvio idempotente e desativação de vínculo.
9. Traçar cada fluxo do início ao fim e mapear quais eventos alteram posição/quantidade física; não inferir uma baixa a partir de aprovação ou tarefa.
10. Registrar exceções, auditoria e evidências, incluindo quem pode solicitar, aprovar e revisar; nunca apagar eventos já ocorridos.
11. Marcar cada elemento como **Aprovado**, **Proposto**, **Hipótese** ou **A validar**, apontando fonte e responsável pela validação.
12. Revisar cobertura contra [[Requisitos]], atualizar primeiro [[Modelo lógico e conceitual]] e encaminhar questões ainda abertas a [[Structure/pendent]].
13. Fazer leitura crítica com representantes operacionais antes de converter o modelo conceitual em modelo lógico, esquema físico, API ou código.

## Entregáveis esperados do modelo conceitual

- Diagrama entidade-relacionamento conceitual com nomes do negócio, relações, cardinalidades e opcionalidade.
- Glossário canônico e regras de identidade/unicidade no nível do domínio.
- Catálogo de eventos/estados por ciclo operacional, separando estado derivado de fato persistente.
- Invariantes e regras de autorização/aprovação relevantes.
- Mapa de evidências, auditoria, origem dos dados e rastreabilidade.
- Registro explícito de decisões, hipóteses e pendências com fonte/responsável.
- Matriz de rastreabilidade entre elementos do modelo e requisitos.
- Histórico de revisão/validação com participantes e data.

## Critério de qualidade

O modelo está pronto para revisão quando explica sem ambiguidade quem é responsável por cada saldo, a quem ele pertence, onde está e em que condição; quem pode executar ou aprovar cada evento; como pedido, reserva, separação, aval, expedição, baixa, devolução e fiscal se relacionam; como corrigir divergências sem perder histórico; e quais questões continuam abertas. A aprovação do modelo não comprova demanda comercial nem arquitetura implementada.