-- Estoque Mais | DDL lógico inicial v0.1
-- Dialeto: MySQL 8.0.17+
-- Status: proposta derivada do modelo conceitual; revisar antes de uso.
-- Não contém dados reais, usuários ou credenciais.

CREATE DATABASE IF NOT EXISTS estoque_mais
  CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE estoque_mais;

CREATE TABLE empresa (
  id_empresa BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  razao_social VARCHAR(180) NOT NULL,
  nome_fantasia VARCHAR(180) NULL,
  cnpj CHAR(14) NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'ativo',
  criado_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  atualizado_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id_empresa),
  UNIQUE KEY uk_empresa_cnpj (cnpj)
) ENGINE=InnoDB;

CREATE TABLE usuario (
  id_usuario BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  empresa_id BIGINT UNSIGNED NOT NULL,
  nome VARCHAR(160) NOT NULL,
  email VARCHAR(254) NOT NULL,
  senha_hash VARCHAR(255) NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'ativo',
  criado_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  atualizado_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id_usuario),
  UNIQUE KEY uk_usuario_empresa_email (empresa_id, email),
  CONSTRAINT fk_usuario_empresa FOREIGN KEY (empresa_id) REFERENCES empresa (id_empresa)
) ENGINE=InnoDB;

CREATE TABLE perfil (
  id_perfil BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  empresa_id BIGINT UNSIGNED NOT NULL,
  nome VARCHAR(80) NOT NULL,
  descricao VARCHAR(255) NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'ativo',
  PRIMARY KEY (id_perfil),
  UNIQUE KEY uk_perfil_empresa_nome (empresa_id, nome),
  CONSTRAINT fk_perfil_empresa FOREIGN KEY (empresa_id) REFERENCES empresa (id_empresa)
) ENGINE=InnoDB;

CREATE TABLE permissao (
  id_permissao BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  codigo VARCHAR(100) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_permissao),
  UNIQUE KEY uk_permissao_codigo (codigo)
) ENGINE=InnoDB;

CREATE TABLE usuario_perfil (
  usuario_id BIGINT UNSIGNED NOT NULL,
  perfil_id BIGINT UNSIGNED NOT NULL,
  concedido_por BIGINT UNSIGNED NULL,
  concedido_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (usuario_id, perfil_id),
  CONSTRAINT fk_usuario_perfil_usuario FOREIGN KEY (usuario_id) REFERENCES usuario (id_usuario),
  CONSTRAINT fk_usuario_perfil_perfil FOREIGN KEY (perfil_id) REFERENCES perfil (id_perfil),
  CONSTRAINT fk_usuario_perfil_concedente FOREIGN KEY (concedido_por) REFERENCES usuario (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE perfil_permissao (
  perfil_id BIGINT UNSIGNED NOT NULL,
  permissao_id BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (perfil_id, permissao_id),
  CONSTRAINT fk_perfil_permissao_perfil FOREIGN KEY (perfil_id) REFERENCES perfil (id_perfil),
  CONSTRAINT fk_perfil_permissao_permissao FOREIGN KEY (permissao_id) REFERENCES permissao (id_permissao)
) ENGINE=InnoDB;

CREATE TABLE depositante (
  id_depositante BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  empresa_id BIGINT UNSIGNED NOT NULL,
  razao_social VARCHAR(180) NOT NULL,
  nome_fantasia VARCHAR(180) NULL,
  documento VARCHAR(20) NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'ativo',
  criado_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id_depositante),
  UNIQUE KEY uk_depositante_empresa_doc (empresa_id, documento),
  UNIQUE KEY uk_depositante_empresa_id (empresa_id, id_depositante),
  CONSTRAINT fk_depositante_empresa FOREIGN KEY (empresa_id) REFERENCES empresa (id_empresa)
) ENGINE=InnoDB;

CREATE TABLE cliente (
  id_cliente BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  empresa_id BIGINT UNSIGNED NOT NULL,
  razao_social VARCHAR(180) NOT NULL,
  nome_fantasia VARCHAR(180) NULL,
  documento VARCHAR(20) NULL,
  endereco VARCHAR(500) NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'ativo',
  criado_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id_cliente),
  UNIQUE KEY uk_cliente_empresa_doc (empresa_id, documento),
  UNIQUE KEY uk_cliente_empresa_id (empresa_id, id_cliente),
  CONSTRAINT fk_cliente_empresa FOREIGN KEY (empresa_id) REFERENCES empresa (id_empresa)
) ENGINE=InnoDB;

CREATE TABLE depositante_cliente (
  depositante_id BIGINT UNSIGNED NOT NULL,
  cliente_id BIGINT UNSIGNED NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'ativo',
  iniciado_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  encerrado_em DATETIME(3) NULL,
  PRIMARY KEY (depositante_id, cliente_id),
  CONSTRAINT fk_dep_cliente_depositante FOREIGN KEY (depositante_id) REFERENCES depositante (id_depositante),
  CONSTRAINT fk_dep_cliente_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (id_cliente)
) ENGINE=InnoDB;

CREATE TABLE usuario_depositante (
  usuario_id BIGINT UNSIGNED NOT NULL,
  depositante_id BIGINT UNSIGNED NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'ativo',
  concedido_por BIGINT UNSIGNED NULL,
  concedido_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  revogado_em DATETIME(3) NULL,
  PRIMARY KEY (usuario_id, depositante_id),
  CONSTRAINT fk_usuario_dep_usuario FOREIGN KEY (usuario_id) REFERENCES usuario (id_usuario),
  CONSTRAINT fk_usuario_dep_depositante FOREIGN KEY (depositante_id) REFERENCES depositante (id_depositante),
  CONSTRAINT fk_usuario_dep_concedente FOREIGN KEY (concedido_por) REFERENCES usuario (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE representante_cliente (
  id_representante BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  cliente_id BIGINT UNSIGNED NOT NULL,
  nome VARCHAR(160) NOT NULL,
  documento VARCHAR(20) NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'ativo',
  valido_desde DATE NULL,
  valido_ate DATE NULL,
  cadastrado_por BIGINT UNSIGNED NULL,
  criado_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id_representante),
  CONSTRAINT fk_representante_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (id_cliente),
  CONSTRAINT fk_representante_cadastrador FOREIGN KEY (cadastrado_por) REFERENCES usuario (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE armazem (
  id_armazem BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  empresa_id BIGINT UNSIGNED NOT NULL,
  codigo VARCHAR(50) NOT NULL,
  nome VARCHAR(160) NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'ativo',
  PRIMARY KEY (id_armazem),
  UNIQUE KEY uk_armazem_empresa_codigo (empresa_id, codigo),
  UNIQUE KEY uk_armazem_empresa_id (empresa_id, id_armazem),
  CONSTRAINT fk_armazem_empresa FOREIGN KEY (empresa_id) REFERENCES empresa (id_empresa)
) ENGINE=InnoDB;

CREATE TABLE depositante_armazem (
  depositante_id BIGINT UNSIGNED NOT NULL,
  armazem_id BIGINT UNSIGNED NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'ativo',
  inicio_operacao DATE NULL,
  fim_operacao DATE NULL,
  PRIMARY KEY (depositante_id, armazem_id),
  CONSTRAINT fk_dep_armazem_depositante FOREIGN KEY (depositante_id) REFERENCES depositante (id_depositante),
  CONSTRAINT fk_dep_armazem_armazem FOREIGN KEY (armazem_id) REFERENCES armazem (id_armazem)
) ENGINE=InnoDB;

CREATE TABLE area (
  id_area BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  armazem_id BIGINT UNSIGNED NOT NULL,
  codigo VARCHAR(50) NOT NULL,
  nome VARCHAR(120) NOT NULL,
  tipo VARCHAR(40) NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'ativo',
  PRIMARY KEY (id_area),
  UNIQUE KEY uk_area_armazem_codigo (armazem_id, codigo),
  UNIQUE KEY uk_area_armazem_id (armazem_id, id_area),
  CONSTRAINT fk_area_armazem FOREIGN KEY (armazem_id) REFERENCES armazem (id_armazem)
) ENGINE=InnoDB;

CREATE TABLE endereco_armazenagem (
  id_endereco BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  armazem_id BIGINT UNSIGNED NOT NULL,
  area_id BIGINT UNSIGNED NOT NULL,
  codigo VARCHAR(80) NOT NULL,
  tipo VARCHAR(40) NOT NULL,
  capacidade DECIMAL(18,3) NULL,
  unidade_capacidade VARCHAR(20) NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'ativo',
  PRIMARY KEY (id_endereco),
  UNIQUE KEY uk_endereco_armazem_codigo (armazem_id, codigo),
  UNIQUE KEY uk_endereco_armazem_id (armazem_id, id_endereco),
  CONSTRAINT fk_endereco_area_armazem FOREIGN KEY (armazem_id, area_id)
    REFERENCES area (armazem_id, id_area),
  CONSTRAINT ck_endereco_capacidade CHECK (capacidade IS NULL OR capacidade >= 0)
) ENGINE=InnoDB;

CREATE TABLE produto (
  id_produto BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  empresa_id BIGINT UNSIGNED NOT NULL,
  depositante_id BIGINT UNSIGNED NOT NULL,
  sku VARCHAR(100) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  unidade_medida VARCHAR(20) NOT NULL,
  lote_obrigatorio BOOLEAN NOT NULL DEFAULT TRUE,
  regra_excecao_lote VARCHAR(500) NULL,
  controla_serie BOOLEAN NOT NULL DEFAULT FALSE,
  status VARCHAR(20) NOT NULL DEFAULT 'ativo',
  PRIMARY KEY (id_produto),
  UNIQUE KEY uk_produto_depositante_sku (depositante_id, sku),
  UNIQUE KEY uk_produto_depositante_id (depositante_id, id_produto),
  CONSTRAINT fk_produto_empresa FOREIGN KEY (empresa_id) REFERENCES empresa (id_empresa),
  CONSTRAINT fk_produto_depositante_empresa FOREIGN KEY (empresa_id, depositante_id)
    REFERENCES depositante (empresa_id, id_depositante),
  CONSTRAINT ck_produto_serie_lote CHECK (controla_serie = FALSE OR lote_obrigatorio = TRUE)
) ENGINE=InnoDB;

CREATE TABLE codigo_barras (
  id_codigo_barras BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  depositante_id BIGINT UNSIGNED NOT NULL,
  produto_id BIGINT UNSIGNED NOT NULL,
  codigo VARCHAR(128) NOT NULL,
  tipo VARCHAR(40) NOT NULL,
  principal BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (id_codigo_barras),
  UNIQUE KEY uk_codigo_barras_depositante_codigo (depositante_id, codigo),
  CONSTRAINT fk_codigo_produto_depositante FOREIGN KEY (depositante_id, produto_id)
    REFERENCES produto (depositante_id, id_produto)
) ENGINE=InnoDB;

CREATE TABLE lote (
  id_lote BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  depositante_id BIGINT UNSIGNED NOT NULL,
  produto_id BIGINT UNSIGNED NOT NULL,
  codigo VARCHAR(100) NOT NULL,
  fabricado_em DATE NULL,
  valido_ate DATE NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'ativo',
  PRIMARY KEY (id_lote),
  UNIQUE KEY uk_lote_produto_codigo (produto_id, codigo),
  UNIQUE KEY uk_lote_dep_id (depositante_id, id_lote),
  CONSTRAINT fk_lote_produto_depositante FOREIGN KEY (depositante_id, produto_id)
    REFERENCES produto (depositante_id, id_produto),
  CONSTRAINT ck_lote_validade CHECK (valido_ate IS NULL OR fabricado_em IS NULL OR valido_ate >= fabricado_em)
) ENGINE=InnoDB;

CREATE TABLE numero_serie (
  id_numero_serie BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  depositante_id BIGINT UNSIGNED NOT NULL,
  produto_id BIGINT UNSIGNED NOT NULL,
  lote_id BIGINT UNSIGNED NOT NULL,
  codigo VARCHAR(120) NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'ativo',
  PRIMARY KEY (id_numero_serie),
  UNIQUE KEY uk_serie_produto_codigo (produto_id, codigo),
  UNIQUE KEY uk_serie_dep_id (depositante_id, id_numero_serie),
  CONSTRAINT fk_serie_produto_lote FOREIGN KEY (depositante_id, produto_id)
    REFERENCES produto (depositante_id, id_produto),
  CONSTRAINT fk_serie_lote_depositante FOREIGN KEY (depositante_id, lote_id)
    REFERENCES lote (depositante_id, id_lote)
) ENGINE=InnoDB;

CREATE TABLE recebimento (
  id_recebimento BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  empresa_id BIGINT UNSIGNED NOT NULL,
  depositante_id BIGINT UNSIGNED NOT NULL,
  armazem_id BIGINT UNSIGNED NOT NULL,
  referencia_externa VARCHAR(120) NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'rascunho',
  previsto_em DATETIME(3) NULL,
  iniciado_em DATETIME(3) NULL,
  concluido_em DATETIME(3) NULL,
  criado_por BIGINT UNSIGNED NULL,
  PRIMARY KEY (id_recebimento),
  UNIQUE KEY uk_recebimento_dep_ref (depositante_id, referencia_externa),
  CONSTRAINT fk_recebimento_dep_empresa FOREIGN KEY (empresa_id, depositante_id)
    REFERENCES depositante (empresa_id, id_depositante),
  CONSTRAINT fk_recebimento_dep_armazem FOREIGN KEY (depositante_id, armazem_id)
    REFERENCES depositante_armazem (depositante_id, armazem_id),
  CONSTRAINT fk_recebimento_usuario FOREIGN KEY (criado_por) REFERENCES usuario (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE item_recebimento (
  id_item_recebimento BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  recebimento_id BIGINT UNSIGNED NOT NULL,
  produto_id BIGINT UNSIGNED NOT NULL,
  quantidade_prevista DECIMAL(18,3) NOT NULL,
  quantidade_recebida DECIMAL(18,3) NULL,
  lote_id BIGINT UNSIGNED NULL,
  validade DATE NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'aguardando',
  PRIMARY KEY (id_item_recebimento),
  CONSTRAINT fk_item_recebimento FOREIGN KEY (recebimento_id) REFERENCES recebimento (id_recebimento),
  CONSTRAINT fk_item_recebimento_produto FOREIGN KEY (produto_id) REFERENCES produto (id_produto),
  CONSTRAINT fk_item_recebimento_lote FOREIGN KEY (lote_id) REFERENCES lote (id_lote),
  CONSTRAINT ck_item_recebimento_qtd CHECK (quantidade_prevista >= 0 AND (quantidade_recebida IS NULL OR quantidade_recebida >= 0))
) ENGINE=InnoDB;

CREATE TABLE conferencia_recebimento (
  id_conferencia_recebimento BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  item_recebimento_id BIGINT UNSIGNED NOT NULL,
  usuario_id BIGINT UNSIGNED NOT NULL,
  quantidade DECIMAL(18,3) NOT NULL,
  resultado VARCHAR(30) NOT NULL,
  observacao VARCHAR(500) NULL,
  conferido_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id_conferencia_recebimento),
  CONSTRAINT fk_conf_rec_item FOREIGN KEY (item_recebimento_id) REFERENCES item_recebimento (id_item_recebimento),
  CONSTRAINT fk_conf_rec_usuario FOREIGN KEY (usuario_id) REFERENCES usuario (id_usuario),
  CONSTRAINT ck_conf_rec_qtd CHECK (quantidade >= 0)
) ENGINE=InnoDB;

CREATE TABLE pedido_saida (
  id_pedido_saida BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  empresa_id BIGINT UNSIGNED NOT NULL,
  depositante_id BIGINT UNSIGNED NOT NULL,
  cliente_id BIGINT UNSIGNED NOT NULL,
  armazem_id BIGINT UNSIGNED NOT NULL,
  referencia_externa VARCHAR(120) NULL,
  status VARCHAR(40) NOT NULL DEFAULT 'rascunho',
  prioridade VARCHAR(20) NOT NULL DEFAULT 'normal',
  criado_por BIGINT UNSIGNED NULL,
  criado_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  concluido_em DATETIME(3) NULL,
  PRIMARY KEY (id_pedido_saida),
  UNIQUE KEY uk_pedido_empresa_id (empresa_id, id_pedido_saida),
  CONSTRAINT fk_pedido_dep_empresa FOREIGN KEY (empresa_id, depositante_id)
    REFERENCES depositante (empresa_id, id_depositante),
  CONSTRAINT fk_pedido_dep_cliente FOREIGN KEY (depositante_id, cliente_id)
    REFERENCES depositante_cliente (depositante_id, cliente_id),
  CONSTRAINT fk_pedido_dep_armazem FOREIGN KEY (depositante_id, armazem_id)
    REFERENCES depositante_armazem (depositante_id, armazem_id),
  CONSTRAINT fk_pedido_usuario FOREIGN KEY (criado_por) REFERENCES usuario (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE item_pedido_saida (
  id_item_pedido BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  pedido_saida_id BIGINT UNSIGNED NOT NULL,
  produto_id BIGINT UNSIGNED NOT NULL,
  quantidade_solicitada DECIMAL(18,3) NOT NULL,
  quantidade_expedida DECIMAL(18,3) NULL,
  PRIMARY KEY (id_item_pedido),
  CONSTRAINT fk_item_pedido FOREIGN KEY (pedido_saida_id) REFERENCES pedido_saida (id_pedido_saida),
  CONSTRAINT fk_item_pedido_produto FOREIGN KEY (produto_id) REFERENCES produto (id_produto),
  CONSTRAINT ck_item_pedido_qtd CHECK (quantidade_solicitada > 0 AND (quantidade_expedida IS NULL OR quantidade_expedida >= 0))
) ENGINE=InnoDB;

CREATE TABLE saldo_estoque (
  id_saldo BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  empresa_id BIGINT UNSIGNED NOT NULL,
  depositante_id BIGINT UNSIGNED NOT NULL,
  armazem_id BIGINT UNSIGNED NOT NULL,
  endereco_id BIGINT UNSIGNED NOT NULL,
  produto_id BIGINT UNSIGNED NOT NULL,
  lote_id BIGINT UNSIGNED NULL,
  numero_serie_id BIGINT UNSIGNED NULL,
  condicao VARCHAR(30) NOT NULL DEFAULT 'disponivel',
  quantidade_fisica DECIMAL(18,3) NOT NULL DEFAULT 0,
  versao BIGINT UNSIGNED NOT NULL DEFAULT 0,
  lote_key BIGINT UNSIGNED GENERATED ALWAYS AS (IFNULL(lote_id, 0)) STORED,
  serie_key BIGINT UNSIGNED GENERATED ALWAYS AS (IFNULL(numero_serie_id, 0)) STORED,
  atualizado_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id_saldo),
  UNIQUE KEY uk_saldo_posicao (empresa_id, depositante_id, armazem_id, endereco_id, produto_id, lote_key, serie_key, condicao),
  CONSTRAINT fk_saldo_dep_empresa FOREIGN KEY (empresa_id, depositante_id)
    REFERENCES depositante (empresa_id, id_depositante),
  CONSTRAINT fk_saldo_dep_armazem FOREIGN KEY (depositante_id, armazem_id)
    REFERENCES depositante_armazem (depositante_id, armazem_id),
  CONSTRAINT fk_saldo_endereco_armazem FOREIGN KEY (armazem_id, endereco_id)
    REFERENCES endereco_armazenagem (armazem_id, id_endereco),
  CONSTRAINT fk_saldo_produto_dep FOREIGN KEY (depositante_id, produto_id)
    REFERENCES produto (depositante_id, id_produto),
  CONSTRAINT fk_saldo_lote_dep FOREIGN KEY (depositante_id, lote_id)
    REFERENCES lote (depositante_id, id_lote),
  CONSTRAINT fk_saldo_serie_dep FOREIGN KEY (depositante_id, numero_serie_id)
    REFERENCES numero_serie (depositante_id, id_numero_serie),
  CONSTRAINT ck_saldo_qtd CHECK (quantidade_fisica >= 0)
) ENGINE=InnoDB;

CREATE TABLE reserva_estoque (
  id_reserva BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  saldo_id BIGINT UNSIGNED NOT NULL,
  item_pedido_id BIGINT UNSIGNED NOT NULL,
  quantidade DECIMAL(18,3) NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'ativa',
  criado_por BIGINT UNSIGNED NULL,
  criado_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  encerrado_em DATETIME(3) NULL,
  chave_idempotencia VARCHAR(100) NULL,
  PRIMARY KEY (id_reserva),
  UNIQUE KEY uk_reserva_idempotencia (chave_idempotencia),
  CONSTRAINT fk_reserva_saldo FOREIGN KEY (saldo_id) REFERENCES saldo_estoque (id_saldo),
  CONSTRAINT fk_reserva_item_pedido FOREIGN KEY (item_pedido_id) REFERENCES item_pedido_saida (id_item_pedido),
  CONSTRAINT fk_reserva_usuario FOREIGN KEY (criado_por) REFERENCES usuario (id_usuario),
  CONSTRAINT ck_reserva_qtd CHECK (quantidade > 0)
) ENGINE=InnoDB;

CREATE TABLE bloqueio_estoque (
  id_bloqueio BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  saldo_id BIGINT UNSIGNED NOT NULL,
  quantidade DECIMAL(18,3) NOT NULL,
  motivo VARCHAR(100) NOT NULL,
  descricao VARCHAR(500) NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'solicitado',
  solicitado_por BIGINT UNSIGNED NOT NULL,
  aprovado_por BIGINT UNSIGNED NULL,
  solicitado_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  aprovado_em DATETIME(3) NULL,
  liberado_em DATETIME(3) NULL,
  PRIMARY KEY (id_bloqueio),
  CONSTRAINT fk_bloqueio_saldo FOREIGN KEY (saldo_id) REFERENCES saldo_estoque (id_saldo),
  CONSTRAINT fk_bloqueio_solicitante FOREIGN KEY (solicitado_por) REFERENCES usuario (id_usuario),
  CONSTRAINT fk_bloqueio_aprovador FOREIGN KEY (aprovado_por) REFERENCES usuario (id_usuario),
  CONSTRAINT ck_bloqueio_qtd CHECK (quantidade > 0)
) ENGINE=InnoDB;

CREATE TABLE separacao (
  id_separacao BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  pedido_saida_id BIGINT UNSIGNED NOT NULL,
  responsavel_id BIGINT UNSIGNED NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'pendente',
  iniciado_em DATETIME(3) NULL,
  concluido_em DATETIME(3) NULL,
  PRIMARY KEY (id_separacao),
  CONSTRAINT fk_separacao_pedido FOREIGN KEY (pedido_saida_id) REFERENCES pedido_saida (id_pedido_saida),
  CONSTRAINT fk_separacao_usuario FOREIGN KEY (responsavel_id) REFERENCES usuario (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE item_separacao (
  id_item_separacao BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  separacao_id BIGINT UNSIGNED NOT NULL,
  reserva_id BIGINT UNSIGNED NOT NULL,
  endereco_origem_id BIGINT UNSIGNED NOT NULL,
  endereco_destino_id BIGINT UNSIGNED NULL,
  numero_serie_id BIGINT UNSIGNED NULL,
  quantidade DECIMAL(18,3) NOT NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'pendente',
  separado_em DATETIME(3) NULL,
  PRIMARY KEY (id_item_separacao),
  CONSTRAINT fk_item_separacao_separacao FOREIGN KEY (separacao_id) REFERENCES separacao (id_separacao),
  CONSTRAINT fk_item_separacao_reserva FOREIGN KEY (reserva_id) REFERENCES reserva_estoque (id_reserva),
  CONSTRAINT fk_item_sep_end_origem FOREIGN KEY (endereco_origem_id) REFERENCES endereco_armazenagem (id_endereco),
  CONSTRAINT fk_item_sep_end_destino FOREIGN KEY (endereco_destino_id) REFERENCES endereco_armazenagem (id_endereco),
  CONSTRAINT fk_item_sep_serie FOREIGN KEY (numero_serie_id) REFERENCES numero_serie (id_numero_serie),
  CONSTRAINT ck_item_separacao_qtd CHECK (quantidade > 0)
) ENGINE=InnoDB;

CREATE TABLE conferencia_saida (
  id_conferencia_saida BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  pedido_saida_id BIGINT UNSIGNED NOT NULL,
  separacao_id BIGINT UNSIGNED NULL,
  conferente_id BIGINT UNSIGNED NOT NULL,
  resultado VARCHAR(30) NOT NULL,
  observacao VARCHAR(500) NULL,
  conferido_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id_conferencia_saida),
  CONSTRAINT fk_conferencia_saida_pedido FOREIGN KEY (pedido_saida_id) REFERENCES pedido_saida (id_pedido_saida),
  CONSTRAINT fk_conferencia_saida_separacao FOREIGN KEY (separacao_id) REFERENCES separacao (id_separacao),
  CONSTRAINT fk_conferencia_saida_usuario FOREIGN KEY (conferente_id) REFERENCES usuario (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE aval_cliente (
  id_aval BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  conferencia_saida_id BIGINT UNSIGNED NOT NULL,
  cliente_id BIGINT UNSIGNED NOT NULL,
  representante_id BIGINT UNSIGNED NULL,
  decisao VARCHAR(30) NOT NULL,
  evidencia_referencia VARCHAR(500) NULL,
  registrado_por BIGINT UNSIGNED NOT NULL,
  decidido_em DATETIME(3) NOT NULL,
  registrado_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id_aval),
  CONSTRAINT fk_aval_conferencia FOREIGN KEY (conferencia_saida_id) REFERENCES conferencia_saida (id_conferencia_saida),
  CONSTRAINT fk_aval_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (id_cliente),
  CONSTRAINT fk_aval_representante FOREIGN KEY (representante_id) REFERENCES representante_cliente (id_representante),
  CONSTRAINT fk_aval_usuario FOREIGN KEY (registrado_por) REFERENCES usuario (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE expedicao (
  id_expedicao BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  pedido_saida_id BIGINT UNSIGNED NOT NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'pendente',
  concluida_por BIGINT UNSIGNED NULL,
  concluida_em DATETIME(3) NULL,
  chave_idempotencia VARCHAR(100) NULL,
  PRIMARY KEY (id_expedicao),
  UNIQUE KEY uk_expedicao_pedido (pedido_saida_id),
  UNIQUE KEY uk_expedicao_idempotencia (chave_idempotencia),
  CONSTRAINT fk_expedicao_pedido FOREIGN KEY (pedido_saida_id) REFERENCES pedido_saida (id_pedido_saida),
  CONSTRAINT fk_expedicao_usuario FOREIGN KEY (concluida_por) REFERENCES usuario (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE inventario (
  id_inventario BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  empresa_id BIGINT UNSIGNED NOT NULL,
  armazem_id BIGINT UNSIGNED NOT NULL,
  depositante_id BIGINT UNSIGNED NULL,
  tipo VARCHAR(30) NOT NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'aberto',
  aberto_por BIGINT UNSIGNED NULL,
  aberto_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  encerrado_em DATETIME(3) NULL,
  PRIMARY KEY (id_inventario),
  CONSTRAINT fk_inventario_empresa FOREIGN KEY (empresa_id) REFERENCES empresa (id_empresa),
  CONSTRAINT fk_inventario_armazem FOREIGN KEY (armazem_id) REFERENCES armazem (id_armazem),
  CONSTRAINT fk_inventario_depositante FOREIGN KEY (depositante_id) REFERENCES depositante (id_depositante),
  CONSTRAINT fk_inventario_usuario FOREIGN KEY (aberto_por) REFERENCES usuario (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE contagem_inventario (
  id_contagem BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  inventario_id BIGINT UNSIGNED NOT NULL,
  saldo_id BIGINT UNSIGNED NOT NULL,
  numero_contagem SMALLINT UNSIGNED NOT NULL DEFAULT 1,
  quantidade_sistema DECIMAL(18,3) NOT NULL,
  quantidade_contada DECIMAL(18,3) NOT NULL,
  contado_por BIGINT UNSIGNED NOT NULL,
  contado_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id_contagem),
  UNIQUE KEY uk_contagem_ordem (inventario_id, saldo_id, numero_contagem),
  CONSTRAINT fk_contagem_inventario FOREIGN KEY (inventario_id) REFERENCES inventario (id_inventario),
  CONSTRAINT fk_contagem_saldo FOREIGN KEY (saldo_id) REFERENCES saldo_estoque (id_saldo),
  CONSTRAINT fk_contagem_usuario FOREIGN KEY (contado_por) REFERENCES usuario (id_usuario),
  CONSTRAINT ck_contagem_qtd CHECK (quantidade_sistema >= 0 AND quantidade_contada >= 0)
) ENGINE=InnoDB;

CREATE TABLE divergencia_inventario (
  id_divergencia BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  contagem_id BIGINT UNSIGNED NOT NULL,
  diferenca DECIMAL(18,3) NOT NULL,
  motivo VARCHAR(500) NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'pendente',
  registrada_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id_divergencia),
  CONSTRAINT fk_divergencia_contagem FOREIGN KEY (contagem_id) REFERENCES contagem_inventario (id_contagem)
) ENGINE=InnoDB;

CREATE TABLE aprovacao_ajuste (
  id_aprovacao BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  divergencia_id BIGINT UNSIGNED NOT NULL,
  aprovador_id BIGINT UNSIGNED NOT NULL,
  decisao VARCHAR(30) NOT NULL,
  justificativa VARCHAR(500) NOT NULL,
  decidido_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id_aprovacao),
  UNIQUE KEY uk_aprovacao_divergencia (divergencia_id),
  CONSTRAINT fk_aprovacao_divergencia FOREIGN KEY (divergencia_id) REFERENCES divergencia_inventario (id_divergencia),
  CONSTRAINT fk_aprovacao_usuario FOREIGN KEY (aprovador_id) REFERENCES usuario (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE movimento_estoque (
  id_movimento BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  empresa_id BIGINT UNSIGNED NOT NULL,
  depositante_id BIGINT UNSIGNED NOT NULL,
  produto_id BIGINT UNSIGNED NOT NULL,
  lote_id BIGINT UNSIGNED NULL,
  numero_serie_id BIGINT UNSIGNED NULL,
  saldo_origem_id BIGINT UNSIGNED NULL,
  saldo_destino_id BIGINT UNSIGNED NULL,
  tipo VARCHAR(30) NOT NULL,
  quantidade DECIMAL(18,3) NOT NULL,
  origem_tipo VARCHAR(40) NOT NULL,
  origem_id BIGINT UNSIGNED NOT NULL,
  chave_idempotencia VARCHAR(100) NOT NULL,
  motivo VARCHAR(500) NULL,
  executado_por BIGINT UNSIGNED NOT NULL,
  ocorrido_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id_movimento),
  UNIQUE KEY uk_movimento_idempotencia (empresa_id, chave_idempotencia),
  CONSTRAINT fk_movimento_dep_empresa FOREIGN KEY (empresa_id, depositante_id)
    REFERENCES depositante (empresa_id, id_depositante),
  CONSTRAINT fk_movimento_produto_dep FOREIGN KEY (depositante_id, produto_id)
    REFERENCES produto (depositante_id, id_produto),
  CONSTRAINT fk_movimento_lote_dep FOREIGN KEY (depositante_id, lote_id)
    REFERENCES lote (depositante_id, id_lote),
  CONSTRAINT fk_movimento_serie_dep FOREIGN KEY (depositante_id, numero_serie_id)
    REFERENCES numero_serie (depositante_id, id_numero_serie),
  CONSTRAINT fk_movimento_saldo_origem FOREIGN KEY (saldo_origem_id) REFERENCES saldo_estoque (id_saldo),
  CONSTRAINT fk_movimento_saldo_destino FOREIGN KEY (saldo_destino_id) REFERENCES saldo_estoque (id_saldo),
  CONSTRAINT fk_movimento_usuario FOREIGN KEY (executado_por) REFERENCES usuario (id_usuario),
  CONSTRAINT ck_movimento_qtd CHECK (quantidade > 0)
) ENGINE=InnoDB;

CREATE TABLE evento_auditoria (
  id_evento_auditoria BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  empresa_id BIGINT UNSIGNED NOT NULL,
  usuario_id BIGINT UNSIGNED NULL,
  acao VARCHAR(100) NOT NULL,
  entidade VARCHAR(100) NOT NULL,
  entidade_id VARCHAR(100) NOT NULL,
  motivo VARCHAR(500) NULL,
  dados_anteriores JSON NULL,
  dados_novos JSON NULL,
  ocorrido_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id_evento_auditoria),
  KEY ix_auditoria_entidade (empresa_id, entidade, entidade_id, ocorrido_em),
  CONSTRAINT fk_auditoria_empresa FOREIGN KEY (empresa_id) REFERENCES empresa (id_empresa),
  CONSTRAINT fk_auditoria_usuario FOREIGN KEY (usuario_id) REFERENCES usuario (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE documento_fiscal (
  id_documento_fiscal BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  empresa_id BIGINT UNSIGNED NOT NULL,
  depositante_id BIGINT UNSIGNED NOT NULL,
  cliente_id BIGINT UNSIGNED NULL,
  tipo VARCHAR(30) NOT NULL,
  chave_acesso VARCHAR(60) NULL,
  numero VARCHAR(30) NULL,
  serie VARCHAR(20) NULL,
  estado_fiscal VARCHAR(40) NULL,
  operacao_tipo VARCHAR(40) NULL,
  operacao_id BIGINT UNSIGNED NULL,
  criado_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id_documento_fiscal),
  UNIQUE KEY uk_documento_empresa_chave (empresa_id, chave_acesso),
  CONSTRAINT fk_doc_fiscal_empresa FOREIGN KEY (empresa_id) REFERENCES empresa (id_empresa),
  CONSTRAINT fk_doc_fiscal_depositante FOREIGN KEY (depositante_id) REFERENCES depositante (id_depositante),
  CONSTRAINT fk_doc_fiscal_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (id_cliente)
) ENGINE=InnoDB;

CREATE TABLE requisicao_integracao (
  id_requisicao BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  documento_fiscal_id BIGINT UNSIGNED NOT NULL,
  provedor VARCHAR(60) NOT NULL,
  operacao VARCHAR(80) NOT NULL,
  chave_idempotencia VARCHAR(100) NOT NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'pendente',
  tentativas SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  criada_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  atualizada_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id_requisicao),
  UNIQUE KEY uk_integracao_idempotencia (provedor, chave_idempotencia),
  CONSTRAINT fk_integracao_documento FOREIGN KEY (documento_fiscal_id) REFERENCES documento_fiscal (id_documento_fiscal)
) ENGINE=InnoDB;

CREATE TABLE evento_integracao (
  id_evento_integracao BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  requisicao_id BIGINT UNSIGNED NOT NULL,
  tipo VARCHAR(30) NOT NULL,
  codigo_resposta VARCHAR(60) NULL,
  mensagem_segura VARCHAR(1000) NULL,
  payload_referencia VARCHAR(500) NULL,
  ocorrido_em DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id_evento_integracao),
  CONSTRAINT fk_evento_integracao_requisicao FOREIGN KEY (requisicao_id) REFERENCES requisicao_integracao (id_requisicao)
) ENGINE=InnoDB;

-- Regras transacionais que o DDL sozinho não garante:
-- * autorizar cada acesso pelo vínculo ativo usuario_depositante (ou escopo explícito de empresa);
-- * validar status ativo em depositante_cliente e depositante_armazem;
-- * alocar reserva/bloqueio sob transação e impedir sobre-reserva;
-- * tratar recebimento, inventário, compensação e expedição como operações idempotentes;
-- * validar que aval e conferência ocorreram junto do cliente; e que o representante é autorizado;
-- * concluir expedição integral e gravar movimento/atualizar saldo atomicamente;
-- * manter movimento_estoque e evento_auditoria sem edição/exclusão comum;
-- * compatibilizar todas as chaves de empresa/depositante/produto/armazém nas referências tipadas.
