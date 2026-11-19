---
tipo: requisitos
status: em-consolidacao
produto: Estoque Mais
fase: descoberta-e-especificacao
---

# Requisitos funcionais e não funcionais

## 1. Convenções

Este documento organiza os requisitos identificados na especificação original e refinados no documento consolidado. As prioridades são `Essencial`, `Importante` e `Desejável`.

Os estados utilizados são:

- **Base:** requisito presente na especificação ou decisão já incorporada;
- **Proposto:** refinamento de engenharia ainda sujeito a confirmação;
- **A validar:** depende de teste, documento técnico, decisão de negócio ou evidência operacional.

A decisão vigente é construir um **WMS mobile-first**, e não apenas uma camada complementar. O MVP limita complexidade e porte, mas preserva o domínio de armazém. Depositante participa do modelo mínimo; capacidades avançadas de múltiplos depositantes ficam fora. A implantação inicial ocorre no ambiente do cliente, com evolução futura para SaaS, conforme [[Decisões vigentes]].

Os requisitos devem ser lidos junto de [[Tese de Negócio e Validação Comercial]], [[Elaboração de Negócio e Visão Geral]] e [[Implementação técnica]].
## 2. Requisitos funcionais

### Organização e acesso

#### RF-001 — Usuários, perfis e permissões

**Prioridade:** Essencial  
**Estado:** Base

O sistema deve manter usuários, perfis, permissões e parâmetros operacionais. O acesso às funções deve ser controlado por perfil e permissão, com escopo por depositante e negação por padrão. Acesso de empresa deve ser concedido explicitamente ao administrador e auditado. A matriz de permissões aprovada para cada perfil consta em [[Modelo lógico e conceitual#Depositantes, clientes e acesso]].

O MVP não oferece portal externo de cliente/depositante. O supervisor cadastra os representantes autorizados dos clientes. O aval deve ser registrado pelo conferente com representante, decisão e data/hora, e pode ser comprovado por e-mail, assinatura ou documento anexado; o conferente registra a decisão do representante sem decidir em seu lugar. Desativar um vínculo cliente-depositante exige aprovação de supervisor. Separação entre solicitação e aprovação deve impedir que um usuário aprove a própria exceção.

#### RF-002 — Auditoria de operações críticas

**Prioridade:** Importante  
**Estado:** Base, com detalhamento a validar

O sistema deve registrar usuário, ação, data e hora, entidade afetada, valores relevantes, justificativa, aprovação e resultado para operações críticas.

As operações críticas devem ser enumeradas e as regras de retenção e acesso devem ser definidas.

### Cadastros

#### RF-003 — Cadastros básicos

**Prioridade:** Essencial  
**Estado:** Base

O sistema deve manter produtos, SKUs, códigos de barras, unidades de medida, categorias, clientes e fornecedores. SKU e código de barras devem ser únicos no escopo de cada depositante; o mesmo código pode existir para depositantes diferentes, e a leitura é resolvida pelo contexto do depositante ativo.

#### RF-004 — Peso e dimensões do produto

**Prioridade:** Essencial  
**Estado:** Proposto; origem e obrigatoriedade dimensional a validar

O sistema deve permitir cadastrar peso, unidade de referência e dimensões do produto ou embalagem quando necessárias aos controles de carga e volume.

O cadastro deve distinguir peso líquido, peso bruto, tara, base de conversão e origem do dado quando a validação depender dessas informações.

### Armazém e capacidade

#### RF-005 — Cadastro de armazém e endereços

**Prioridade:** Essencial  
**Estado:** Base

O sistema deve manter armazéns, áreas, endereços, tipos de endereço, capacidade, agrupamentos físicos e status operacional.

#### RF-006 — Bloqueio de endereço inativo

**Prioridade:** Essencial  
**Estado:** Base

O sistema deve impedir movimentações normais com destino a endereço inativo.

#### RF-007 — Validação de capacidade do endereço

**Prioridade:** Importante  
**Estado:** Proposto; dados técnicos a validar

O sistema deve validar a capacidade aplicável no putaway e nas movimentações internas, considerando peso, posições, quantidade e, quando habilitado, volume ou dimensões.

Endereços sujeitos a limite de carga sem capacidade validada devem permanecer indisponíveis para novas entradas até saneamento.

#### RF-008 — Cadastro de paletes, gaiolas e veículos

**Prioridade:** Importante  
**Estado:** Proposto; homologação técnica a validar

O sistema deve permitir cadastrar modelos de palete, gaiola e veículo com capacidade, unidade, fonte técnica, revisão e situação de liberação.

Valores genéricos ou históricos não devem preencher automaticamente limites operacionais.

### Estoque e movimentações

#### RF-009 — Consulta de saldo

**Prioridade:** Essencial  
**Estado:** Base

O sistema deve permitir consultar saldo por produto, lote e endereço, distinguindo quantidades físicas, reservadas e bloqueadas quando aplicável.

#### RF-010 — Bloqueio de saldo negativo

**Prioridade:** Essencial  
**Estado:** Base

O sistema deve bloquear toda movimentação que produza saldo físico negativo. O MVP não oferece exceções operacionais.

#### RF-011 — Cálculo do estoque elegível

**Prioridade:** Essencial  
**Estado:** Base

O sistema deve calcular o estoque disponível para nova reserva como quantidade física menos reservas ativas e bloqueios. Para bloquear quantidade já reservada, a reserva deve ser cancelada/liberada primeiro, evitando dupla dedução. O cálculo e a criação de reserva devem ser atômicos sob concorrência.
Disponibilidade é um valor calculado, não um estado persistido. Reserva é uma alocação; bloqueio e inspeção são restrições com motivo. No MVP, avaria, validade e quarentena são motivos de bloqueio, sem estados próprios.

#### RF-012 — Movimentações transacionais

**Prioridade:** Essencial  
**Estado:** Base

As operações de estoque devem ser atômicas e registrar quantidade positiva, unidade de medida, origem, destino, produto, lote e demais dados aplicáveis.

#### RF-013 — Controle por lote

**Prioridade:** Essencial  
**Estado:** Base

O sistema deve associar saldos, entradas, movimentações e saídas a um lote. O código do lote é único por produto e depositante.

Lote é obrigatório por padrão. Exceção deve ser configurada por produto, justificada, identificada com responsável e aprovada por supervisor. Produtos serializados não admitem exceção ao lote obrigatório.

#### RF-014 — Controle por número de série

**Prioridade:** Importante  
**Estado:** Base

Produtos configurados como serializados devem registrar o número de série de cada unidade no recebimento, localização, movimentação, inventário, expedição e devolução.

Todo número de série pertence a um lote e é único por produto e depositante.

### Inbound

#### RF-015 — Recebimento esperado e recebido

**Prioridade:** Essencial  
**Estado:** Base

O sistema deve registrar separadamente a quantidade esperada e a quantidade recebida.

#### RF-016 — Divergências de recebimento

**Prioridade:** Essencial  
**Estado:** Base

O sistema deve identificar, registrar e listar divergências entre o esperado e o recebido.

#### RF-017 — Recebimento concluído protegido

**Prioridade:** Importante  
**Estado:** Proposto

O sistema deve impedir edição direta de recebimento concluído. Correções devem ocorrer por estorno ou ajuste rastreável, com justificativa, autorização e revalidação dos efeitos.

### Outbound

#### RF-018 — Validação e reserva de pedido

**Prioridade:** Essencial  
**Estado:** Base

O sistema deve validar o pedido liberado antes de reservar estoque e impedir reserva acima do estoque elegível.

#### RF-019 — Picking

**Prioridade:** Essencial  
**Estado:** Base

O sistema deve distribuir ou disponibilizar tarefas autorizadas de picking, verificar saldo na origem e registrar a quantidade efetivamente separada, inclusive em separação parcial.

#### RF-020 — Condições de expedição

**Prioridade:** Essencial  
**Estado:** Base

O sistema deve impedir a expedição enquanto houver condição obrigatória pendente, picking incompleto, divergência impeditiva ou aval do cliente ausente/reprovado no fluxo inicial.

O MVP não permite expedição parcial: o pedido é expedido integralmente ou cancelado antes da expedição. A conclusão física gera a baixa única da quantidade expedida. Antes da expedição, cancelamento libera reservas com histórico. Após baixa física, não se cancela: a devolução é registrada como nova entrada vinculada à expedição e fica indisponível até inspeção e aprovação do supervisor. Cada fluxo define separadamente se autorização fiscal é pré-condição.

#### RF-021 — Validação de carga do veículo

**Prioridade:** Importante  
**Estado:** Proposto; capacidade real a validar

O sistema deve comparar a carga total atribuída à expedição com a capacidade documentada e validada do veículo ou conjunto utilizado.

### Inventário e divergências

#### RF-022 — Inventário e recontagem

**Prioridade:** Essencial  
**Estado:** Base

O sistema deve permitir inventário, contagem, recontagem e registro de divergência. Toda divergência exige recontagem antes da decisão de ajuste. Contagens anteriores permanecem no histórico.
O inventário deve registrar snapshot/versionamento das posições no início da contagem. Movimentos posteriores ao corte são reconciliados antes do ajuste.

#### RF-023 — Ajuste rastreável

**Prioridade:** Essencial  
**Estado:** Base

O ajuste de inventário deve ser uma nova movimentação, sem sobrescrever o saldo ou o evento anterior.

#### RF-024 — Aprovação de divergência

**Prioridade:** Importante  
**Estado:** Base

Todo ajuste de saldo exige justificativa e aprovação de supervisor autorizado antes de gerar o movimento de ajuste. A aprovação não altera nem apaga contagens ou divergências que a originaram.

### Operação e relatórios

#### RF-025 — Leitura de código de barras

**Prioridade:** Importante  
**Estado:** Base

O sistema deve permitir executar tarefas por câmera do smartphone ou leitor de código de barras compatível.

#### RF-026 — Distribuição e acompanhamento de tarefas

**Prioridade:** Importante  
**Estado:** Base

O supervisor deve poder distribuir tarefas e acompanhar sua execução pelos operadores.

#### RF-027 — Relatórios e indicadores

**Prioridade:** Desejável  
**Estado:** Base; indicadores a definir

O sistema deve emitir relatórios e indicadores operacionais sobre estoque, divergências, tarefas, recebimentos, expedições e inventários.

### Integrações

#### RF-028 — Consulta de CT-e

**Prioridade:** Importante  
**Estado:** Escopo aprovado; prova técnica pendente

O primeiro escopo fiscal do MVP deve consultar CT-e emitido pela FocusNFe, usando a referência do documento. Consulta de CT-e recebido, emissão, cancelamento, NF-e, NFC-e e outros documentos ficam fora deste escopo inicial e dependem de decisão posterior.

A integração deve usar contrato documentado, credenciais protegidas no back-end, ambiente de homologação, identificador interno, idempotência, registro de tentativas e dados para reconciliação. Deve preservar o status original e, quando disponíveis, `status_sefaz` e `mensagem_sefaz`, além de mapear o retorno para estado fiscal interno. Falha técnica de consulta deve ser registrada separadamente da situação fiscal do documento.

#### RF-029 — Conferência com CT-e

**Prioridade:** Importante  
**Estado:** Proposto; reconciliação e regra por fluxo a validar

O sistema deve associar o estado fiscal interno do CT-e emitido à operação logística, preservando o status original e detalhes da SEFAZ quando disponíveis. Falha técnica de consulta não é situação fiscal do documento. A situação fiscal fica separada do aval do cliente e do estado físico da expedição; a consulta inicial não bloqueia expedição por padrão e não cria, antecipa ou duplica movimento de estoque.

Divergências entre WMS e FocusNFe, reprocessamento e critérios de reconciliação devem permanecer rastreáveis. Eventual uso de estado fiscal como pré-condição será definido por fluxo após validação.

## 3. Requisitos não funcionais

#### RNF-001 — Integridade transacional

**Prioridade:** Essencial  
**Estado:** Base

As operações devem ser atômicas e consistentes mesmo com vários operadores atuando sobre o mesmo saldo simultaneamente.

#### RNF-002 — Trilha de auditoria protegida

**Prioridade:** Importante  
**Estado:** Base; retenção e acesso a validar

Registros de auditoria não devem ser alterados ou apagados pelos usuários operacionais. A proteção contra acesso administrativo direto precisa ser especificada separadamente.

#### RNF-003 — Usabilidade operacional

**Prioridade:** Importante  
**Estado:** Proposto

As tarefas operacionais devem ter instruções objetivas e, como hipótese inicial, no máximo três telas. A meta deve ser avaliada em contexto real de uso.

#### RNF-004 — Tempo de resposta

**Prioridade:** Importante  
**Estado:** Proposto

O sistema deve confirmar tarefas operacionais rapidamente. A meta inicial de até três segundos é uma hipótese de ensaio e não uma exigência normativa comprovada.

#### RNF-005 — Uso em smartphone

**Prioridade:** Essencial  
**Estado:** Base

As funções operacionais devem funcionar em smartphone com câmera ou leitor de código de barras compatível.

#### RNF-006 — Controle de acesso

**Prioridade:** Essencial  
**Estado:** Base

Funções, dados e aprovações devem respeitar perfis e permissões configurados.

#### RNF-007 — Backup e restauração

**Prioridade:** Importante  
**Estado:** Base para backup diário e ensaio de restauração; metas a validar

O sistema deve oferecer backup e restauração consistentes, incluindo banco, configurações, trilhas e evidências operacionais necessárias. Para o piloto, realizar cópia automática diária em armazenamento separado já disponível e autorizado; testar restauração antes do go-live e periodicamente.

Retenção, RPO, RTO e responsável operacional ainda serão definidos para o ambiente do cliente. Sem uma segunda cópia separada, usar apenas dados de teste.

#### RNF-008 — Instalação local

**Prioridade:** Essencial  
**Estado:** Base; ambiente a homologar

A primeira versão deve ser instalada e atualizada no ambiente do cliente de forma reproduzível. O piloto não exige compra inicial: utiliza dispositivos e equipamento já disponíveis e autorizados; homologar apenas os aparelhos e versões efetivamente usados.

O MVP exige conexão para confirmar operações de estoque. Sem rede, preservar apenas rascunho local e não usar saldo em cache para autorizar operações. Dimensionar servidor e rede com carga representativa do piloto. A preparação para SaaS é arquitetural e não constitui capacidade prometida no MVP.

#### RNF-009 — Preparação para evolução SaaS

**Prioridade:** Desejável  
**Estado:** Proposto

A arquitetura deve separar domínio, aplicação e infraestrutura para permitir evolução futura sem reescrever as regras centrais.

#### RNF-010 — Integração por API

**Prioridade:** Importante  
**Estado:** Proposto

Integrações externas devem utilizar contratos, autenticação, tratamento de erro, logs e testes de repetição definidos. A primeira candidata é a consulta de CT-e.

### RNF-011 — Migração de dados controlada

**Prioridade:** Importante  
**Estado:** Base para o escopo do MVP; origem e leiaute a validar

O MVP migra cadastros necessários à operação e saldos iniciais por depositante, produto, armazém, endereço, lote/série e condição. Não importa histórico de movimentações, inventários, divergências ou auditoria; a origem é preservada como arquivo de consulta. O saldo inicial gera movimento de abertura identificado pela data/hora de corte.

A migração preserva integridade, rastreabilidade e reconciliação. Nenhum dado é descartado, transformado ou sobrescrito silenciosamente. Linhas inválidas são reportadas para correção na origem ou rejeição documentada; não entram silenciosamente no saldo oficial.

##### Fluxo mínimo de migração

1. **Inventário da origem:** identificar sistemas/arquivos, responsáveis, data de extração, registros, colunas e limitações.
2. **Mapeamento:** relacionar campos e chaves de origem a depositantes, clientes, produtos/SKUs, unidades, armazéns, endereços, lotes, séries e saldos.
3. **Saneamento:** identificar duplicidades, ausências, unidades incompatíveis, endereços inexistentes, séries repetidas e saldos inconsistentes; registrar correções e rejeições.
4. **Staging:** carregar em área temporária sem alterar o estoque oficial e validar tipos, referências, unidades e totais.
5. **Dry run:** gerar relatório de aceitos, rejeitados, transformações propostas e diferenças.
6. **Aprovação:** supervisor do armazém e representante autorizado do depositante revisam a reconciliação antes da carga oficial.
7. **Data de corte:** registrar versão da origem e data/hora; controlar alterações entre extração, carga e go-live para impedir duplicidade.
8. **Migração oficial e reconciliação:** criar movimento de abertura e comparar origem/destino por depositante, produto, endereço, lote/série e quantidade.
9. **Go-live e rollback:** preservar origem e evidências; interromper, corrigir e repetir carga sem duplicar saldos.

A data de corte, formato da origem, mapeamento de campos, qualidade e volume dos dados ainda precisam ser definidos para o piloto.

## 4. Critérios gerais de aceitação

- cada requisito deve possuir regra, cenário de teste e evidência correspondente;
- operações concorrentes não podem duplicar reserva, movimento ou capacidade;
- divergências devem ser explicáveis e permanecer no histórico;
- dados ausentes devem bloquear validações que dependam deles, em vez de gerar aprovação silenciosa;
- requisitos marcados como `A validar` não devem ser apresentados como implementados ou homologados;
- o piloto deve medir valor operacional, viabilidade e confiança, conforme as três dimensões registradas em [[Elaboração de Negócio e Visão Geral]].

## 5. Pendências de especificação

- reconciliar a numeração entre a especificação original e os documentos refinados;
- definir motivos e evidências padronizados para bloqueio, desbloqueio, cancelamento, devolução e recusa do aval;
- definir tolerâncias de documentos fiscais, peso e volume;
- obter documentação técnica de estruturas, paletes, gaiolas e veículos;
- formalizar cenários de cancelamento/devolução para validação do piloto;
- definir comportamento em conectividade degradada e critérios para eventual offline;
- homologar ambiente, hardware, carga, backup e restauração;
- homologar os fluxos FocusNFe e a regra, por fluxo, para autorização fiscal como condição de expedição;
- transformar requisitos em matriz de rastreabilidade requisito-regra-teste-evidência.

## Fontes

- [[Fontes pendentes#Especificação de requisitos original]]
- [[Fontes pendentes#Requisitos refinados]]
