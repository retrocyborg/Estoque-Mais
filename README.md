# Estoque Mais (WMS Mobile-First)

Projeto Estoque Mais — WMS com experiência mobile no núcleo da operação, desenhado para pequenos e médios operadores logísticos (3PLs).

---

### 👥 5 Perfis de Usuário Integrados

1. **Administrador:**
   - Escopo de empresa (concessão e governança).
   - Gestão completa de Usuários com status Ativo/Inativo em tempo real.
   - Gestão de Catálogo de Produtos integrada à estrutura de `bd_01.sql`.
   - Consulta de armazéns, docas e relatórios.
2. **Supervisor:**
   - Fila de aprovações (bloqueios de lotes, ajustes de inventário, desativação de vínculos).
   - **Regra dos Dois Olhares (Governança):** O supervisor é impedido de aprovar a própria solicitação.
   - Distribuição e atribuição de tarefas operacionais para a equipe de chão de fábrica.
3. **Operador:**
   - **Painel do Turno:** Contadores operacionais (a receber, a expedir, produtos abaixo do estoque mínimo).
   - **Minhas Tarefas:** Ciclo de vida operacional (*Pendente* $\rightarrow$ *Em andamento* $\rightarrow$ *Concluída*).
   - **Leitor de Código Ótico/QR:** Validação e leitura de produtos, gôndolas e paletes.
   - **Movimentação Interna:** Transferência de estoque entre endereços do armazém.
   - Solicitação de bloqueio de lote por avaria e registro de ocorrências.
4. **Conferente:**
   - Apontamento de divergências de recebimento físico vs nota/pedido.
   - **Registro do Aval do Cliente:** Formalização da decisão do representante autorizado (com evidência em e-mail, assinatura ou documento).
5. **Auditor:**
   - Acesso em modo somente leitura (sem permissão de movimentação).
   - Desdobramento e fórmula de saldo de estoque:
     $$\text{Disponível} = \text{Físico} - \text{Reservado} - \text{Bloqueado}$$
   - Trilha viva de auditoria e conformidade fiscal/física.

---

## 🗄️ Banco de Dados

* **Arquivo de Schema:** `bd_01.sql` (tabela de produtos, especificações métricas, preços e estoques).
* **Script de Execução:** `./scripts/setup_db.sh`

---

## 🛠️ Como Gerar o APK (Build Bash Script)

Para empacotar, alinhar e assinar o APK unificado:

```bash
./scripts/build_apk.sh
```

O executável final será gerado em:
* `EstoqueMais-beta-0.5.apk` (na raiz do projeto e copiado para a pasta `~/Downloads`)
