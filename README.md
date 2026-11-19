# Estoque Mais (WMS Mobile-First & Desktop)

Projeto Estoque Mais — WMS multiplataforma desenhado para pequenos e médios operadores logísticos (3PLs). Funciona tanto em dispositivos móveis Android (via APK nativo) quanto em computadores (Web / Desktop PWA).

---

## 💻 Como Rodar no Computador (Desktop / Web)

Na branch `feature/desktop`, você pode rodar o sistema diretamente no computador (Mac, Windows ou Linux) sem precisar de emulador Android:

### Opção 1: Via Script Bash
```bash
./scripts/run_desktop.sh
```
O script iniciará um servidor local e abrirá automaticamente o app no navegador padrão em `http://localhost:3000`.

### Opção 2: Via npm
```bash
npm run desktop
# ou
npm start
```

### 💡 Instalação como Aplicativo de Desktop (PWA)
Ao abrir no Google Chrome, Microsoft Edge, Brave ou Safari, clique no ícone **Instalar** na barra de endereços para criar um atalho e rodar o Estoque Mais em uma janela independente de aplicativo de desktop.

---

## 📱 Como Gerar o APK para Android

Para empacotar, alinhar e assinar o APK para celulares ou coletores Android:

```bash
./scripts/build_apk.sh
# ou via npm:
npm run build:apk
```

O arquivo gerado é:
* `EstoqueMais-beta-0.5.apk` (na raiz do repositório e na pasta `~/Downloads`)

---

## 👥 5 Perfis de Usuário Integrados

1. **Administrador:** Gestão de usuários (com auditoria em tempo real), catálogo de produtos baseado em `bd_01.sql`, armazéns e visão geral.
2. **Supervisor:** Fila de aprovações com a **regra dos dois olhares** (bloqueio para aprovar a própria solicitação) e distribuição de tarefas para a equipe.
3. **Operador:** Painel do turno, execução de tarefas (Receber, Picking, Armazenar, Expedir), simulador de leitor ótico/QR de código de barras e movimentação física de estoques.
4. **Conferente:** Apontamento de divergências físicas e registro formal do **aval do cliente** com comprovação documental.
5. **Auditor:** Acesso somente leitura com a fórmula canônica do WMS:
   $$\text{Disponível} = \text{Físico} - \text{Reservado} - \text{Bloqueado}$$

---

## 🗄️ Banco de Dados

* **Arquivo de Schema:** `bd_01.sql` (tabela de produtos, custos, preços e saldos).
* **Script de Execução:** `./scripts/setup_db.sh` (ou `npm run setup:db`)
