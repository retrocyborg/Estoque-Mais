# Preparação do repositório para receber código

**Estado:** proposta de organização; scaffold e toolchain ainda não homologados.

## Situação observada
A raiz contém `app_src` com arquivos de pacote Android e assets, `bd_01.sql`, scripts shell e documentação. Não há, nesta configuração, manifestos de dependências que confirmem a toolchain atual para cada componente. Portanto, os diretórios abaixo são convenção sugerida, não evidência de implementação funcional.

## Estrutura sugerida

```text
apps/
  mobile/                 aplicativo e interface operacional
  api/                    serviços, autenticação e regras de domínio
database/
  migrations/             migrações ordenadas e versionadas
  seeds/                  dados sintéticos para desenvolvimento
  schema/                 esquema e documentação do banco
packages/
  shared/                 tipos/contratos compartilhados, se necessário
tests/
  integration/            cenários entre componentes
  acceptance/             critérios operacionais verificáveis
docs/
  estoque mais/           requisitos, decisões, arquitetura e operação
scripts/                  instalação e tarefas locais sem segredos
```

A equipe deve decidir antes do primeiro scaffold: versões suportadas de Node.js, React Native/Android, MySQL, gerenciador de pacotes, ferramenta de build, estratégia de configuração e execução local. O documento de Kanban sugere React Native, Node.js e MySQL; confirme compatibilidade e versões em ADR antes de fixar arquivos de dependência.

## Regras para receber código
- Cada componente novo deve incluir instruções de instalação, execução e configuração local.
- Incluir `.env.example` com nomes e valores demonstrativos não secretos; adicionar `.env` ao ignore.
- Não incluir APK, AAB, keystore, certificados privados, credenciais, exportações de banco ou dados reais.
- Toda mudança de esquema deve vir em migração numerada, reversível quando possível, e acompanhada de impacto/rollback.
- Manter contrato de API versionado ou documentado; validar autorização e escopo no servidor.
- Utilizar fixtures sintéticas e documentar a origem/licença de dependências e assets externos.
- Código sem instruções reproduzíveis ou sem dependências declaradas não está pronto para integração.

## Sequência de onboarding sugerida
1. A equipe aprova a estrutura e as versões da toolchain.
2. Criar scaffold mínimo para mobile e API, sem regra de estoque ainda.
3. Documentar configuração local e comando de execução.
4. Definir pipeline de validação após escolher ferramentas; não declarar CI como configurado até haver workflow executável.
5. Implementar primeiro fluxo vertical em branch e PR, incluindo persistência, autorização, auditoria e critérios de aceite pertinentes.
6. Homologar instalação e backup no ambiente alvo antes de piloto.

## Segurança: keystore versionado
A árvore atual do repositório inclui `estoquemais-release.keystore`. Uma chave de assinatura versionada em repositório público deve ser tratada como potencialmente exposta. A equipe responsável deve avaliar se a chave é real/ativa; se for, revogá-la/rotacioná-la e revisar o processo de release. Remover o arquivo do rastreamento e adicioná-lo ao `.gitignore` não apaga cópias do histórico. Não inserir senhas da chave em issues ou commits.
