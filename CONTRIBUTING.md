# Contribuindo com o Estoque Mais

## Fluxo de trabalho
1. Leia `AGENTS.md`, `docs/estoque mais/README.md`, `Decisões vigentes.md` e os requisitos relacionados ao cartão.
2. Abra uma issue ou vincule a mudança a uma tarefa existente; descreva resultado e critérios de aceite.
3. Crie uma branch curta a partir de `main`, por exemplo `feat/recebimento-mobile`, `fix/reserva-concorrente` ou `docs/regras-inventario`.
4. Faça uma mudança pequena, com commits objetivos.
5. Atualize documentação e migrações quando necessário.
6. Abra PR usando o modelo do repositório. Aguarde revisão antes de integrar.

## Antes de abrir PR
- [ ] O escopo corresponde à issue/requisito.
- [ ] Regras do domínio e decisões vigentes foram conferidas.
- [ ] Não há segredo, dado real de cliente, dump ou artefato compilado.
- [ ] Migrações e impacto em dados foram descritos.
- [ ] Validações foram executadas e seus resultados informados; se não foram, isso está explícito.
- [ ] Documentação afetada foi atualizada.

## Dados e segurança
Use dados sintéticos em desenvolvimento e exemplos. Nunca copie dados pessoais, credenciais de cliente ou dados de estoque reais para issues, logs ou fixtures. Se um segredo for publicado, considere-o comprometido: revogue/roteie-o e remova-o do histórico conforme o procedimento de segurança do GitHub.
