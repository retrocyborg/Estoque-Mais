---
tipo: implementacao-tecnica
status: esboco-tecnico
produto: Estoque Mais
---

# Implementação técnica

## Objetivo

Esta nota registra a stack tecnológica atualmente escolhida e as decisões técnicas necessárias para transformar o [[Estoque Mais - visão geral]] em um WMS mobile para pequenos e médios operadores logísticos. As decisões abaixo são uma base de implementação, não uma comprovação de arquitetura pronta. As definições canônicas de produto e implantação estão em [[Decisões vigentes]].

## Decisões vigentes

- **Produto:** WMS mobile-first; React Native integra o núcleo da execução.
- **Implantação inicial:** ambiente do cliente, de forma reproduzível.
- **Piloto sem compra inicial:** usar dispositivos, servidor/rede e armazenamento de backup que já existam e sejam autorizados; limitar a homologação aos aparelhos usados no piloto.
- **Conectividade:** operações que alteram estoque exigem conexão. Ações não enviadas ficam como rascunho; não usar saldo em cache nem confirmar offline. Reenvio usa idempotência.
- **Backup:** cópia automática diária em armazenamento separado já disponível; ensaio de restauração antes e durante a operação. Retenção, RPO/RTO e responsáveis serão definidos para cada ambiente.
- **Depositante no MVP:** entidade de domínio com separação mínima de dados, permissões e saldos; recursos avançados permanecem posteriores.
- **Integração fiscal:** FocusNFe selecionada para prova técnica, ainda não implementada ou homologada.
- **Migração:** somente cadastros necessários e saldo inicial; sem histórico de movimentos no MVP.

## Stack definida

- **Front-end mobile:** React Native.
- **Back-end:** Node.js.
- **Banco de dados:** MySQL.

A stack atende à decisão de que o mobile faz parte do núcleo do WMS, e não é apenas uma interface complementar. Os fluxos de recebimento, armazenagem, movimentação, inventário, picking e expedição devem ser executáveis no local da operação, conforme o escopo funcional de [[Requisitos]].

## Diretrizes arquiteturais

- O back-end deve concentrar regras de negócio, validações, permissões e auditoria.
- O MySQL deve manter a consistência transacional dos saldos e das movimentações.
- O React Native deve oferecer fluxos guiados, leitura de códigos, feedback de validação e tratamento explícito de falhas de conectividade.
- O modelo deve suportar separação mínima entre clientes, armazéns e depositantes desde o MVP, conforme [[Decisões vigentes]].
- A arquitetura deve permitir importação controlada de dados e evolução para integrações, sem transformar cada implantação em uma customização isolada.

Essas diretrizes respondem aos principais riscos técnicos registrados em [[Pontos Atacados e Respostas]], especialmente confiabilidade do saldo, operação mobile, migração, segurança e evolução do produto.

## Integração fiscal: FocusNFe

O primeiro escopo aprovado é a **consulta de CT-e emitido** pela FocusNFe, usando a referência do documento. Emissão, cancelamento e consulta de CT-e recebido ficam fora deste escopo. A consulta de CT-e emitido retorna status como `processando_autorizacao`, `autorizado`, `cancelado` e `erro_autorizacao`, conforme a documentação da [operação de consulta da FocusNFe](https://doc.focusnfe.com.br/reference/consultar_cte_cte_os).

O domínio deve mapear os status do provedor para estados fiscais internos, preservando o valor original e `status_sefaz`/`mensagem_sefaz` quando disponíveis. Erro de autenticação, conectividade, timeout ou recurso não encontrado é falha da consulta/integração, e não deve ser registrado como rejeição ou cancelamento fiscal do CT-e. Registrar identificador interno, referência, status retornado, tentativas e dados de reconciliação. Credenciais permanecem protegidas no back-end. Falhas são rastreáveis e reprocessáveis sem criar movimentos duplicados. Estado fiscal não se confunde com aval operacional ou baixa física e não bloqueia expedição por padrão; eventual gate será definido por fluxo. Integração ainda não implementada ou homologada.

## Decisões ainda pendentes

### Back-end

- framework Node.js, como NestJS, Fastify ou Express;
- padrão de API, inicialmente REST ou outra alternativa;
- estratégia de validação, tratamento de erros e versionamento;
- ORM ou query builder;
- filas e processamento assíncrono, se necessários.

### Aplicativo mobile

- estratégia de navegação e gerenciamento de estado;
- biblioteca de leitura de código de barras;
- armazenamento local de rascunhos não confirmados e política de expiração/limpeza;
- matriz exata de dispositivos e versões homologados no piloto.

Operações de estoque não serão gravadas offline; saldo em cache não pode autorizar reserva ou movimentação.

### Dados e operação

- modelo de entidades e eventos de estoque;
- idempotência, concorrência e prevenção de movimentações duplicadas;
- isolamento entre clientes e depositantes;
- política de auditoria e retenção;
- backup, restauração e recuperação de desastre.

### Infraestrutura

- automatizar instalação/atualização local e documentar pré-requisitos do ambiente existente;
- medir CPU, memória, armazenamento e rede com carga representativa antes de recomendar dimensionamento;
- definir local de backup separado, retenção, RPO, RTO, responsável e rotina de restauração;
- definir autenticação, autorização, gestão de sessões, observabilidade, logs, métricas e alertas;
- estabelecer suporte e atualização do aplicativo sem exigir compra de hardware no piloto.

## Arquitetura mínima a validar

1. O React Native registra a operação no dispositivo.
2. O back-end Node.js autentica o operador e valida a transação.
3. O MySQL grava a movimentação de forma transacional e auditável.
4. O back-end recalcula ou consulta o saldo conforme regras de domínio.
5. O aplicativo recebe confirmação ou erro acionável.
6. Exceções ficam disponíveis para reconciliação e análise operacional.

Esse fluxo é uma hipótese de arquitetura conceitual. Deve ser validado com testes de concorrência, falhas de rede, duplicidade de requisições, saldo negativo, inventário e restauração.

## Critérios técnicos iniciais

- nenhuma movimentação confirmada sem identificação do operador, horário, origem, destino, produto e quantidade;
- operações repetidas não devem duplicar movimentações;
- alterações críticas devem ser auditáveis;
- dados de um cliente não devem ser expostos a outro;
- erros de conectividade devem ser compreensíveis e recuperáveis;
- migrações devem permitir validação, reconciliação e rollback, conforme [[Requisitos]];
- o desempenho deve ser medido em dispositivos e redes representativos do galpão.

## Limites atuais

A escolha de React Native, Node.js e MySQL não define, sozinha, segurança, escalabilidade, disponibilidade ou custo de implantação. O MVP não suporta gravação de operações de estoque offline; conectividade degradada conserva apenas rascunhos não confirmados. Capacidade e desempenho dependem de medição no ambiente e nos dispositivos do piloto. A proposta de valor continua sendo uma hipótese a validar em operação real, conforme [[Proposta de valor]].

## Próximas validações

- desenhar o modelo inicial de dados de estoque;
- escolher framework e ORM do Node.js;
- definir contrato mínimo da API;
- prototipar um fluxo mobile completo de recebimento;
- testar uma movimentação concorrente no MySQL;
- definir autenticação, perfis e isolamento de dados;
- executar um piloto técnico com dispositivos e conectividade representativos.
