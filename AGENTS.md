# Regras do repositório Estoque Mais

## Princípios gerais
- Preserve as decisões vigentes e os requisitos documentados em `docs/estoque mais`; se houver conflito, registre a divergência e peça decisão antes de mudar comportamento de negócio.
- Mantenha a conferência de expedição sempre junto do cliente. Registre participante, representante autorizado, decisão e evidência conforme os requisitos.
- Não afirme que uma funcionalidade, teste, integração ou homologação existe sem evidência no código ou em registro verificável.
- Diferencie decisão aprovada, proposta e pendência nos documentos.
- Prefira mudanças pequenas, rastreáveis e reversíveis. Evite alterações não relacionadas no mesmo commit.

## Código e arquitetura
- Não introduza framework, serviço, dependência ou padrão arquitetural novo sem registrar motivação, impacto, versão e forma de manutenção.
- Separe interface mobile, API, persistência, scripts de implantação e documentação.
- Regras de estoque devem preservar integridade transacional, rastreabilidade e idempotência; operações concluídas não devem ser apagadas para corrigir erros. Use eventos compensatórios quando a regra de domínio exigir.
- Valide autorização no servidor e aplique negação por padrão; não confie apenas em controles de interface.
- Mantenha configuração e credenciais fora do código. Use variáveis de ambiente e arquivos de exemplo sem valores reais.
- Não versionar APKs, chaves de assinatura, tokens, senhas, certificados privados, dumps de produção ou dados pessoais/operacionais reais.

## Requisitos para mudanças
- Relacione alterações funcionais aos RF/RN/RNF ou registre quando forem infraestrutura/documentação.
- Toda mudança deve explicar comportamento esperado, erros e impacto sobre dados existentes.
- Alterações de banco devem incluir migração versionada e estratégia de rollback quando aplicável; não reescrever silenciosamente o histórico de migrações.
- Atualize documentação, exemplos e diagramas afetados.
- Não adicionar testes automatizados falsos ou marcadores que pareçam testes executáveis.

## Revisão
- Cada PR deve informar escopo, requisitos relacionados, riscos, migrações e evidência de validação.
- Revisão por outra pessoa é recomendada para mudanças de domínio, autorização, estoque, migração e segurança.
- Se a validação não foi executada, declarar explicitamente; não marcar como aprovada.
- Não fazer merge direto em `main enquanto não houver revisão e proteção de branch acordadas pela equipe.

## Estrutura de código proposta
Consulte `docs/estoque mais/Preparação para código.md`. A estrutura é proposta e pode ser ajustada pelo time antes do primeiro scaffold executável.
