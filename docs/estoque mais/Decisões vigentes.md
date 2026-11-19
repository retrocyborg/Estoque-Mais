---
tipo: registro-de-decisoes
status: vigente
produto: Estoque Mais
atualizado_em: 2026-11-11
---

# Decisões vigentes

Esta nota é a referência canônica para decisões de produto que aparecem de forma divergente em documentos históricos. Quando uma nota conflitar com este registro, esta nota prevalece até nova decisão explícita.

## Produto

O Estoque Mais é um **WMS mobile-first para pequenos e médios operadores logísticos 3PL**. O aplicativo mobile integra o núcleo da execução; não é apenas uma camada opcional. O recorte do MVP limita complexidade e porte, mas preserva recebimento, armazenagem, movimentação, inventário, picking, expedição, divergências, auditoria e relatórios, conforme [[Requisitos]].

## Público e território

O ICP de expansão está na Região Sudeste. O primeiro recorte de descoberta e piloto é **Contagem e Betim, em Minas Gerais**, conforme [[Publico-alvo]] e [[Proposta de valor]]. Galpão Classe C, móveis e eletrônicos são filtros de descoberta, não requisitos obrigatórios do ICP.

## Depositantes

`Depositante` é entidade de domínio do MVP, com separação mínima de dados, permissões e saldos. A relação depositante-cliente é **N:M**, por associação ativa/inativa explícita; cada pedido referencia exatamente um depositante e um cliente e valida que o par esteja ativo. No MVP, o vínculo não terá restrição adicional por armazém, contrato ou produto.

Cliente e depositante permanecem cadastros separados mesmo quando compartilham a mesma pessoa jurídica. Coincidência de documento não funde identidades, papéis, permissões ou saldos.

O acesso dos usuários internos aos dados é limitado aos depositantes autorizados em seus perfis. Portal externo do cliente/depositante fica fora do MVP. O aval do cliente é registrado internamente com representante, organização/papel, decisão, data/hora e evidência; somente representante autorizado pode aprovar.

**Regras operacionais aprovadas para o MVP:**
- O acesso segue perfil e depositante, com negação por padrão. Escopo de empresa exige concessão explícita ao administrador e ações administrativas são auditadas.
- Administrador gerencia usuários, perfis, cadastros e configurações; aprova bloqueios e ajustes somente se também tiver o papel de supervisor.
- Supervisor opera os depositantes associados, distribui tarefas, aprova bloqueios e ajustes e cadastra representantes autorizados dos clientes. Não aprova a própria solicitação.
- Operador executa tarefas atribuídas de recebimento, armazenagem, movimentação e picking, solicita bloqueios e registra ocorrências; não aprova ajustes, bloqueios ou aval em nome do cliente.
- Conferente registra conferências e divergências, transcreve a decisão do representante autorizado e anexa a evidência; não decide pelo cliente nem aprova ajustes.
- Auditor tem leitura somente nos depositantes atribuídos, sem movimentação ou aprovação. Cliente/depositante externo não tem conta ou portal no MVP.
- O aval do cliente pode ser comprovado por e-mail, assinatura ou documento anexado.
- A desativação do vínculo cliente-depositante exige aprovação do supervisor.

Portal do depositante, faturamento específico, configurações avançadas e gestão sofisticada de múltiplos depositantes permanecem fora do MVP até validação comercial e técnica. O tratamento de pedidos em andamento após a desativação do vínculo segue pendente em [[Modelo lógico e conceitual]].

## Modelo de domínio e baixa de estoque

- **Cliente e depositante:** entidades/papéis distintos, mesmo quando compartilham a pessoa jurídica. O depositante identifica a propriedade do estoque; o cliente identifica o destinatário e participante da conferência.
- **Cardinalidade:** depositantes e clientes relacionam-se N:M por associação ativa/inativa. Cada pedido contém exatamente um depositante e um cliente e exige par ativo; sem restrição adicional por armazém, contrato ou produto no MVP.
- Um depositante pode operar em vários armazéns, por associação explícita.
- SKU é único por depositante; códigos de barras são únicos por depositante e podem repetir entre depositantes, resolvidos pelo contexto ativo. Lote é obrigatório por padrão e único por produto/depositante; exceção é configurada por produto, com motivo, responsável e aprovação de supervisor, e não se aplica a produto serializado. Número de série exige lote e é único por produto/depositante.
- Disponibilidade é calculada, nunca armazenada como estado independente; reserva é alocação, não baixa nem condição física. Bloqueio e inspeção são restrições com motivo e tornam a quantidade indisponível. No MVP, avaria, validade e quarentena são motivos de bloqueio, não estados próprios.
- `em_separacao` é estado operacional e não representa baixa física.
- **Saída inicial:** aval registrado de representante autorizado do cliente é pré-condição para expedir. Não permitir saldo negativo nem expedição parcial. Baixa física única ao concluir expedição integral.
- **Bloqueio:** operador pode solicitar; supervisor aprova e registra motivo. Em urgência, usuário autorizado pode bloquear imediatamente e o supervisor revisa; reserva ativa é liberada atomicamente e auditada antes de retirar o saldo da disponibilidade.
- **Inventário:** toda divergência exige recontagem; todo ajuste exige justificativa e aprovação de supervisor. Usar snapshot/versionamento do escopo no início da contagem e reconciliar movimentos posteriores antes de ajustar.
- **Cancelamento e devolução:** antes da expedição, cancelar libera reservas com histórico. Após a baixa física não há cancelamento: usar processo de devolução vinculado à expedição. Devolução permanece indisponível até inspeção de produto, quantidade, lote/série e condição; supervisor aprova liberação para disponível ou classificação não utilizável.
- As regras de autorização podem variar por fluxo. Cada fluxo declara pré-condições e evento de baixa; confirmação repetida não gera movimento duplicado.
- FocusNFe e outras integrações fiscais mantêm estado separado. Cada fluxo declara se autorização fiscal é pré-condição de expedição; integração não cria nem duplica a baixa física.

O detalhamento e os pontos ainda a validar estão em [[Modelo lógico e conceitual]].

## Implantação

A primeira versão será instalada no ambiente do cliente de forma reproduzível. O piloto visa zero novas compras: usar aparelho existente/emprestado e equipamento, rede e armazenamento separado já disponíveis e autorizados. Se não houver cópia separada para backup, usar somente dados sintéticos/de teste até haver proteção adequada; não colocar saldo real em produção sem essa segunda cópia.

Operações que alteram estoque são online-only no MVP. Sem conexão, preservar preenchimento como rascunho, indicar que não foi confirmado e não usar saldo em cache para decisões. Após reconectar, enviar com idempotência.

Fazer backup automático diário em armazenamento separado já disponível e autorizado; testar restauração antes do go-live e periodicamente. Retenção, RPO, RTO e responsável operacional serão definidos com o cliente após medir o ambiente. Homologar apenas os dispositivos/versões usados no piloto e dimensionar servidor e rede com carga representativa; não prometer configuração universal.

O escopo de migração do MVP inclui cadastros necessários à operação e saldo inicial por depositante, produto, armazém, endereço, lote/série e condição. O MVP não importa histórico de movimentações; a origem permanece arquivada e o saldo é registrado como movimento de abertura na data de corte. A carga passa por staging, dry run, relatório de aceitos/rejeitados e reconciliação; supervisor do armazém e representante autorizado do depositante aprovam o relatório antes do go-live. Não há transformação ou descarte silencioso. SaaS não é capacidade prometida para o MVP.

## Integração fiscal

A FocusNFe é o fornecedor selecionado para prova técnica da integração fiscal. Está aprovado iniciar pelo escopo de **consulta de CT-e emitido** usando a referência do documento; emissão e cancelamento ficam fora do primeiro escopo. A integração não está implementada ou homologada. O estado fiscal retornado será normalizado no domínio e armazenado com o status original, `status_sefaz` e `mensagem_sefaz` quando disponíveis. Falhas técnicas de consulta (por exemplo, autenticação, conectividade ou recurso não encontrado) são estado da integração, não situação fiscal do CT-e. O estado fiscal permanece separado do aval operacional e da baixa física; por padrão, não bloqueia expedição até que uma regra específica seja validada. Mapeamento, tentativas e reconciliação permanecem pendentes em [[Implementação técnica]].

## Evidência e mercado

Mercado, ROI, adoção, disposição a pagar e escalabilidade comercial continuam **A validar**. Dados nacionais servem como contexto, não como benchmark automático para pequenos 3PLs de Contagem e Betim. O caminho de validação permanece o piloto mensurável descrito em [[Tese de Negócio e Validação Comercial]].