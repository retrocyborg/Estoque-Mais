# Sprint Estoque Mais — Novembro de 2026

**Período proposto:** 19 a 30 de novembro de 2026  
**Duração:** 2 semanas corridas; ajustar ao calendário real de trabalho da equipe  
**Status:** proposta para planejamento — não representa execução iniciada  
**Equipe considerada:** seis frentes funcionais descritas no PDF de CRUDs e Kanban; nomes e disponibilidade não confirmados.

## Objetivo da sprint

Preparar e validar com a equipe o primeiro fluxo vertical do MVP, usando **recebimento mobile** como candidato, e fechar as decisões de domínio e capacidade que impedem transformar o fluxo em histórias prontas para implementação.

Ao final, a equipe deve ter um fluxo de recebimento delimitado, critérios verificáveis, dependências identificadas, regras pendentes registradas e um incremento demonstrável em protótipo ou especificação navegável. A implementação funcional fica condicionada à confirmação da equipe sobre arquitetura, disponibilidade e capacidade.

## Escopo priorizado

| Prioridade | Item relacionado | Resultado esperado |
|---|---|---|
| P0 | K01 — definir o primeiro fluxo vertical | Confirmar recebimento como fluxo inicial ou registrar a escolha alternativa; mapear ator, pré-condições, caminho normal, exceções e estado final. |
| P0 | K02 — histórias e critérios de aceite | Converter o fluxo escolhido em histórias pequenas, rastreáveis aos requisitos e regras vigentes, com critérios observáveis e dependências. |
| P1 | K03 — autoridade e vínculos | Registrar decisões ou pendências sobre autorização de representantes, desativação de vínculo cliente-depositante e responsáveis por bloqueio/desbloqueio. |
| P1 | K04 — capacidade e fonte técnica | Definir dados necessários para validar limites de endereço e estrutura; identificar fonte, unidade, responsável pela validação e itens sem evidência suficiente. |
| P1 | Preparação da validação | Fazer revisão de fluxo com representantes da equipe e, quando disponível, operador/cliente; registrar evidências e mudanças solicitadas. |

**Fora do compromisso desta sprint:** concluir os CRUDs, implementar todos os fluxos de estoque, homologar hardware, garantir metas de desempenho, realizar piloto ou declarar integração fiscal validada. Esses itens permanecem no backlog até que suas dependências e critérios estejam confirmados.

## Cartões e critérios de conclusão

### S-NOV-01 — Selecionar e delimitar o fluxo vertical

**Base:** K01.  
**Responsáveis sugeridos:** Produto e UX, com participação de API, Mobile e Dados.

- Escolher formalmente o fluxo inicial; recebimento é a opção candidata do backlog.
- Mapear atores, pré-condições, sequência principal, divergência, cancelamento/erro e resultado persistido.
- Marcar claramente o que depende de leitura de código, conectividade e participação do cliente.
- **Aceite:** diagrama ou fluxo textual revisado pela equipe; fronteiras do MVP e decisões abertas registradas.

### S-NOV-02 — Refinar histórias e critérios de aceite

**Base:** K02.  
**Responsáveis sugeridos:** Produto e Qualidade, com revisão técnica das frentes afetadas.

- Criar histórias para cadastro/seleção do produto, registro do esperado e recebido, divergência, lote/série quando aplicável e confirmação do recebimento.
- Rastrear histórias a RF/RN/RNF pertinentes; diferenciar regra decidida de hipótese.
- Definir evidência esperada para cada critério e dependências entre interface, API e banco.
- **Aceite:** cada história tem objetivo, prioridade, dependências, critérios testáveis e estado de refinamento; nenhum critério depende de número ou regra não validada sem isso estar sinalizado.

### S-NOV-03 — Resolver ou encaminhar regras de autoridade

**Base:** K03.  
**Responsáveis sugeridos:** Produto e API.

- Descrever como comprovar a autorização do representante e como registrar sua vigência.
- Definir o tratamento de pedidos em andamento quando um vínculo cliente-depositante é desativado.
- Separar quem solicita e quem aprova bloqueio, desbloqueio, cancelamento, devolução e recusa do aval, quando aplicável.
- **Aceite:** decisões aprovadas registradas na fonte de verdade; pendências restantes têm responsável decisório e próximo passo. Não inventar regra para substituir decisão do cliente.

### S-NOV-04 — Preparar validação da capacidade física

**Base:** K04 e regras de capacidade do documento de requisitos refinados.

- Listar estruturas a considerar (endereço, porta-palete, palete, gaiola e veículo, conforme aplicável).
- Para cada limite, registrar valor, unidade, fonte técnica, estrutura/modelo, data de validação e aprovador.
- Distinguir capacidade nominal do equipamento de limite operacional aprovado para o armazém.
- **Aceite:** matriz de validação pronta; limites sem documentação ficam marcados como “não verificáveis” e não são tratados como parâmetro homologado.

### S-NOV-05 — Revisar o fluxo com usuários e equipe

**Responsáveis sugeridos:** UX e Produto, com Qualidade.

- Apresentar o fluxo e os critérios a pessoas disponíveis, registrando função dos participantes e observações.
- Verificar se a conferência do fluxo de saída continua descrita como sempre realizada junto do cliente; a sprint atual não altera essa regra.
- **Aceite:** comentários, decisões, dúvidas e alterações propostas registrados; ausência de participante externo fica documentada como limitação, sem alegar validação com cliente.

## Planejamento por semana

| Janela proposta | Foco | Saída |
|---|---|---|
| 19–22 nov | Alinhamento, escolha do fluxo e levantamento de pendências | Fluxo candidato, atores, dependências e decisões abertas. |
| 23–26 nov | Histórias, critérios e validação das regras de autoridade | Backlog refinado e registros de decisão/pendência. |
| 27–30 nov | Matriz de capacidade, revisão conjunta e demonstração | Evidências de revisão, matriz técnica e retrospectiva da sprint. |

As datas representam uma distribuição inicial dentro do período proposto. Replanejar conforme dias úteis, disponibilidade e capacidade real da equipe.

## Definição de pronto para iniciar

- Objetivo e escopo compreendidos pela equipe.
- Participantes e responsáveis confirmados pelo próprio time.
- Acesso às fontes de requisito e às decisões vigentes.
- Histórias com dependências identificadas e critérios verificáveis.
- Dados de cliente ou armazém usados em revisão autorizados e disponíveis; utilizar dados fictícios se não houver autorização.

## Definição de concluído nesta sprint

- Entregáveis documentais revisados pela equipe.
- Decisões aprovadas distinguidas de propostas e pendências.
- Critérios de aceite verificáveis e rastreáveis.
- Evidência da revisão registrada (ata, comentários ou checklist).
- Backlog atualizado com itens não concluídos e próximos passos.
- Nenhum teste de execução ou homologação alegado sem evidência correspondente.

## Capacidade, fluxo e acompanhamento

A equipe descrita no material-base tem seis frentes sugeridas, mas a disponibilidade individual e a capacidade em horas/pontos não foram informadas. Portanto, **não há estimativa de pontos ou compromisso quantitativo** nesta proposta.

Manter como referência inicial do Kanban existente: até 4 cartões em desenvolvimento, 2 em revisão e 2 em validação; reavaliar os limites com dados reais após 2–3 semanas. Priorizar terminar ou desbloquear trabalho antes de puxar novos cartões.

Acompanhar no check-in da equipe: progresso por cartão, bloqueios, decisões aguardadas, evidências produzidas e risco para o objetivo. Reuniões diárias, responsáveis nominais e cerimônias dependem de acordo do time.

## Riscos e dependências

- **Disponibilidade de usuários/cliente:** pode impedir validação externa; mitigar com revisão interna e registrar a limitação.
- **Capacidades sem fonte técnica:** não parametrizar valores não verificados; solicitar documentação e aprovação do responsável pelo armazém.
- **Regras de vínculo e autoridade abertas:** manter histórias dependentes em “bloqueado/pronto pendente” até decisão.
- **Escopo excessivo:** proteger o objetivo da sprint; CRUDs completos e integração fiscal não entram como compromisso desta janela.
- **Base documental divergente:** reconciliar alterações aprovadas na fonte canônica de requisitos antes de tratar como decisão homologada.

## Revisão e retrospectiva (30/11/2026)

Registrar ao final:

1. Objetivo atingido, parcialmente atingido ou não atingido, com evidências.
2. Histórias refinadas e decisões concluídas.
3. Pendências, bloqueios e responsáveis decisórios.
4. Feedback da equipe e de usuários, identificando quem participou.
5. O que deve entrar na sprint seguinte e quais critérios continuam dependentes de validação.

## Base e rastreabilidade

Esta proposta deriva dos cartões K01–K04 e das regras de fluxo do documento **Estoque_Mais_Crud_e_Kanban_Equipe_6.pdf**, além das decisões e requisitos mantidos em `docs/estoque mais`. A conferência com cliente é tratada como requisito vigente do projeto. Datas, sequência, prioridades desta sprint e responsabilidades funcionais são propostas para refinamento; nomes, estimativas, capacidade e confirmação da equipe são **não verificáveis** até serem acordados.
