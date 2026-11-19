---
tipo: preparacao-comercial
status: esboco-inicial
produto: Estoque Mais
fase: descoberta-comercial
---

# Pontos atacados e respostas

## Objetivo

Esta nota reúne respostas de apoio para conversas com clientes e investidores; não é fonte canônica de produto ou requisitos. Regras vigentes estão em [[Decisões vigentes]], escopo e pendências em [[Requisitos]] e [[Modelo lógico e conceitual]], e hipóteses comerciais em [[Tese de Negócio e Validação Comercial]]. Respostas sem evidência devem permanecer como hipóteses.

## 1. Problema real

**Objeção provável:** Por que não continuar usando Excel ou controles atuais?

**Resposta inicial:** O Estoque Mais precisa demonstrar valor onde planilhas e registros fragmentados geram divergências, retrabalho, demora ou falta de rastreabilidade. O ponto não é substituir uma ferramenta por outra, mas reduzir um custo operacional mensurável.

**Evidência necessária:** exemplos de divergências, horas de retrabalho, tempo de inventário e dificuldade para reconstruir movimentações.

**Status:** A validar.

## 2. Retorno financeiro

**Objeção provável:** Quanto eu economizo?

**Resposta inicial:** O ROI ainda é uma hipótese. Deve ser calculado a partir do custo atual de erros, retrabalho, perdas, expedições incorretas e tempo gasto em conferências e relatórios.

**Evidência necessária:** medição antes e depois em um piloto, com custo operacional e métricas acordadas.

**Status:** A validar.

## 3. Público-alvo

**Objeção provável:** Por que focar em galpões Classe C?

**Resposta inicial:** O foco inicial é uma hipótese de entrada baseada na necessidade de modernização com baixo investimento e infraestrutura heterogênea. A categoria Classe C não deve ser tratada como condição operacional única; cada operação precisa ser avaliada.

**Evidência necessária:** entrevistas, visitas e segmentação por tipo de operação, produto, volume, maturidade e restrição física.

**Status:** Hipótese estratégica.

## 4. Escopo do produto

**Objeção provável:** Isso é um aplicativo mobile ou um WMS?

**Resposta atual:** O Estoque Mais é um WMS mobile-first. O mobile integra o núcleo da execução, e o MVP cobre os fluxos essenciais de armazém sem prometer funcionalidades avançadas de um WMS corporativo.

**Evidência necessária:** protótipo validado, fronteira explícita do MVP e lista de capacidades posteriores.

**Status:** Decisão vigente; detalhe do escopo ainda em consolidação em [[Requisitos]].
## 5. Concorrência

**Objeção provável:** Por que não contratar um ERP ou WMS existente?

**Resposta inicial:** A hipótese de diferenciação está na simplicidade, no custo de implantação, no foco operacional e na aderência a operações menores. Isso precisa ser comparado com alternativas reais, não apenas afirmado.

**Evidência necessária:** matriz competitiva com preço, implantação, suporte, aderência, integrações e limitações.

**Status:** A validar.

## 6. Implantação

**Objeção provável:** Quanto tempo para começar?

**Resposta inicial:** O tempo deve ser demonstrado em um piloto com escopo, dados, responsáveis e ambiente definidos. Não prometer prazo sem conhecer cadastros, infraestrutura e processos do cliente.

**Evidência necessária:** roteiro de implantação, checklist de dados, treinamento e critérios de entrada em operação.

**Status:** A validar.

## 7. Migração de dados

**Objeção provável:** Como meus produtos e saldos serão importados?

**Resposta inicial:** A implantação precisa prever saneamento, mapeamento e importação controlada. A qualidade do cadastro de origem é uma dependência do resultado.

**Evidência necessária:** modelo de importação, amostra de planilha e procedimento de reconciliação.

**Status:** Proposta.

## 8. Adoção pelos operadores

**Objeção provável:** Meus operadores vão usar o sistema?

**Resposta inicial:** A proposta prioriza telas objetivas, operação mobile e leitura de código de barras. A aceitação precisa ser observada com operadores reais, não presumida pela equipe do produto.

**Evidência necessária:** teste de usabilidade, tempo de treinamento, taxa de conclusão e feedback dos operadores.

**Status:** A validar.

## 9. Conectividade

**Objeção provável:** O que acontece se o galpão ficar sem internet?

**Resposta inicial:** O comportamento offline ainda deve ser definido e validado. Não prometer operação offline completa sem arquitetura, teste e reconciliação de conflitos.

**Evidência necessária:** mapa de conectividade, requisito de disponibilidade e ensaio em condição degradada.

**Status:** A decidir.

## 10. Confiabilidade do saldo

**Objeção provável:** Posso confiar no saldo apresentado?

**Resposta inicial:** A confiança deve vir de operações transacionais, permissões, rastreabilidade, controle de divergências e auditoria. O sistema não corrige automaticamente um cadastro ou processo de origem ruim.

**Evidência necessária:** testes de concorrência, saldo negativo, reserva, ajuste, inventário e reconstrução de eventos.

**Status:** Proposta técnica a validar.

## 11. Integrações

**Objeção provável:** Funciona com meu ERP, CT-e ou transportadora?

**Resposta inicial:** CT-e e outras integrações estão no horizonte, mas cada integração exige contrato, credenciais, prova técnica e casos representativos. Não apresentar integração futura como já disponível.

**Evidência necessária:** API definida, ambiente de teste, dados autorizados e relatório de integração.

**Status:** A validar.

## 12. Segurança e governança

**Objeção provável:** Quem pode alterar ou apagar informações?

**Resposta atual:** A matriz de permissões por perfil e depositante foi aprovada e está em [[Modelo lógico e conceitual#Depositantes, clientes e acesso]]. O acesso é negado por padrão, a segregação é verificada por depositante e quem executa não aprova a própria exceção.

**A validar:** lista de eventos auditados, retenção, proteção contra alteração administrativa, configuração efetiva das permissões e teste de restauração.

**Status:** política de permissões definida; implementação, auditoria e recuperação ainda precisam de evidência no piloto.

## 13. Modelo comercial

**Objeção provável:** Vou pagar por usuário, armazém, movimentação ou módulo?

**Resposta inicial:** O modelo comercial ainda é uma hipótese. As alternativas incluem implantação, licença local, suporte recorrente e futura modalidade SaaS. A unidade de cobrança deve ser testada com compradores reais.

**Evidência necessária:** entrevistas de disposição a pagar, propostas comparáveis e cálculo de custo de servir.

**Status:** A validar.

## 14. Dependência do fornecedor

**Objeção provável:** E se a equipe do produto deixar de atender?

**Resposta inicial:** O projeto deve reduzir dependência por meio de documentação, backups, exportação de dados, procedimentos de recuperação e arquitetura sustentável. Esse compromisso precisa ser demonstrado contratual e tecnicamente.

**Evidência necessária:** plano de continuidade, procedimento de backup, restauração e exportação.

**Status:** A validar.

## 15. Escalabilidade

**Objeção provável:** Serve para mais de um armazém ou vários depositantes?

**Resposta atual:** Depositante participa do modelo mínimo do MVP, com separação de dados, permissões e saldos. Portal, faturamento específico, configurações avançadas e escala multiempresa permanecem posteriores. Múltiplos armazéns devem ser suportados apenas dentro dos limites homologados.

**Evidência necessária:** modelo de dados, testes de isolamento, limites de volume e piloto representativo.

**Status:** Entidade mínima definida; escala e recursos avançados **A validar**.
## 16. Perguntas mais críticas

As três perguntas que devem orientar a reunião são:

1. Qual é o custo atual de uma divergência ou de uma expedição incorreta?
2. Por que a operação não resolve o problema com Excel, ERP ou WMS existente?
3. Qual resultado mínimo faria o empresário continuar usando ou pagar pelo produto?

## 17. Postura recomendada na reunião

- distinguir fato, hipótese, proposta e pendência;
- pedir exemplos concretos da operação do empresário;
- não defender funcionalidades sem evidência de valor;
- converter objeções em perguntas de descoberta;
- propor piloto com escopo limitado e métricas antes/depois;
- registrar compromissos, responsáveis e critérios de decisão;
- evitar prometer CT-e, offline, SaaS ou WMS completo antes da validação.

## Fontes relacionadas

- [[Fontes pendentes#Especificação de requisitos original]]
- [[Fontes pendentes#Requisitos refinados]]
- [[Fontes pendentes#Relatório BTG]]
## 18. Perguntas de investidores e respostas recomendadas

Esta seção complementa a preparação comercial com perguntas que podem ser feitas sobre a justificativa revisada em [[Justificativa]] e a tese registrada em [[Tese de Negócio e Validação Comercial]]. As respostas devem distinguir fatos, hipóteses e evidências ainda necessárias.

### Qual problema concreto o produto resolve?

**Resposta recomendada:** O Estoque Mais busca melhorar a confiabilidade e a agilidade do registro de movimentações em operações que dependem de planilhas, controles paralelos ou lançamentos posteriores. A hipótese é que registrar a operação no local, com histórico e reconciliação, melhore a visibilidade do estoque. Isso ainda será medido em piloto.

**Ponto ainda a validar:** frequência, custo e impacto financeiro do problema.

### Por que o cliente não usa Excel?

**Resposta recomendada:** Excel pode funcionar em operações simples, mas tende a depender de disciplina manual, atualização posterior e controles paralelos. O Estoque Mais pretende atuar quando a operação precisa de permissões, histórico, movimentação no local, inventário e rastreabilidade. Ainda é necessário confirmar em quais segmentos essa limitação justifica a compra.

### Por que não usar um ERP ou WMS?

**Resposta recomendada:** O posicionamento inicial não é substituir todo ERP ou WMS. A hipótese é atender operações que precisam de mais controle do que uma planilha oferece, mas ainda não estão prontas para o custo e a complexidade de uma plataforma completa.

**Ponto ainda a validar:** se existe espaço comercial sustentável entre planilhas, ERP e WMS.

### Quem é o cliente e quem paga?

**Resposta recomendada:** A hipótese inicial inclui pequenos e médios depósitos, distribuidores regionais e operadores logísticos com baixa ou média maturidade sistêmica. O usuário diário tende a ser o operador de estoque, enquanto o comprador pode ser o responsável pela operação ou pelo negócio. Essa separação precisa ser confirmada em entrevistas.

### Qual é o diferencial?

**Resposta recomendada:** O diferencial pretendido é combinar entrada simples, uso mobile no local da operação e evolução gradual para controle mais estruturado. Essa combinação ainda não deve ser apresentada como vantagem competitiva comprovada. É necessário compará-la com planilhas, ERPs, WMS e aplicativos de inventário.

### Qual é o retorno financeiro?

**Resposta recomendada:** Ainda não há um ROI fechado. O piloto deverá medir divergências de inventário, tempo de registro, retrabalho, erros de separação, tempo de implantação e adoção. A partir da linha de base será possível estimar valor econômico e disposição a pagar.

### Como provarão que funciona?

**Resposta recomendada:** O piloto terá uma linha de base anterior à implantação e medirá recebimento, movimentação, inventário, picking e expedição antes e depois da solução. Os resultados serão avaliados por acuracidade, tempo, erros, retrabalho, uso e aceitação dos operadores.

### A migração não será um problema?

**Resposta recomendada:** Sim, a migração é um risco central. Por isso, está prevista em etapas: inventário da origem, mapeamento, saneamento, staging, dry run, aprovação, migração, reconciliação e rollback, conforme [[Requisitos]]. O piloto deve começar com cadastros e estoque inicial antes de assumir históricos completos.

### Como escalar sem transformar cada cliente em um projeto personalizado?

**Resposta recomendada:** O produto deve começar com um núcleo comum de cadastro, movimentação, inventário, auditoria e relatórios. Customizações específicas só devem ser incorporadas ao produto se aparecerem repetidamente em clientes do mesmo segmento.

### O produto será um aplicativo ou um WMS?

**Resposta recomendada:** O Estoque Mais é um WMS mobile-first. O MVP não replica toda a complexidade de um WMS corporativo, mas cobre o núcleo operacional definido em [[Requisitos]]. Essa definição deve permanecer consistente na comunicação comercial.

## 19. Pontos sem resposta suficiente e mudanças necessárias

Algumas objeções não são resolvidas apenas com uma resposta verbal. Elas exigem mudança no projeto, geração de evidência ou decisão de escopo.

### Cliente prioritário

“Pequenos depósitos”, “galpões Classe C” e “operadores logísticos” podem ter dores, compradores e orçamentos diferentes. É necessário escolher um segmento inicial, definir seu perfil operacional e identificar o comprador principal.

### Diferenciação competitiva

“Mobile, simples e acessível” é uma hipótese de posicionamento, não uma barreira competitiva. É necessário mapear concorrentes, comparar preço, implantação, mobilidade, offline, rastreabilidade e integração, e identificar uma capacidade realmente valorizada.

### Disposição a pagar

A existência de uma dor não prova que alguém pagará para resolvê-la. Devem ser testadas faixas de preço, unidade de cobrança, proposta de piloto e modelo de implantação com compradores reais.

### ROI

Os indicadores definidos em [[Justificativa]] ainda não possuem linha de base. É necessário medir uma operação real, registrar custo de retrabalho e divergências e estimar quais ganhos podem ser atribuídos ao produto.

### Escalabilidade da implantação

A migração controlada é tecnicamente plausível, mas pode ser manual e cara. Devem ser medidos templates de importação, regras de saneamento, horas por cliente, custo de suporte e oportunidades de automação.

### Escopo do produto

A oscilação histórica entre aplicativo e WMS foi encerrada por [[Decisões vigentes]]. O trabalho pendente é detalhar a fronteira do MVP: recursos avançados de depositantes, offline completo, automação física e integrações extensas permanecem posteriores.

### Retenção e receita recorrente

Uma taxa de implantação não explica por que o cliente continuará pagando. É necessário identificar o valor recorrente, as tarefas usadas diariamente e os indicadores de uso após o piloto.

### Capacidade de execução

A documentação descreve mais o produto do que a equipe necessária para vender, implantar, dar suporte e evoluir a solução. O pitch deve apresentar competências, lacunas, parceiros, uso do investimento e marcos de execução.

## 20. Síntese para o investidor

Temos uma hipótese clara de problema, uma proposta de solução e um plano de validação operacional. Ainda não temos prova suficiente de mercado, ROI, disposição a pagar ou escalabilidade comercial. O investimento inicial deve ser apresentado como capital para reduzir essas incertezas por meio de um MVP e de pilotos mensuráveis.
## 21. Objeção: o problema é falta de pessoal e estrutura, não software

**Objeção provável:** Se o operador não tem profissionais qualificados e possui uma estrutura ruim, um sistema não resolverá o problema.

**Resposta recomendada:** O Estoque Mais não pretende corrigir a infraestrutura física nem substituir a equipe. A hipótese é reduzir o impacto dessas limitações ao transformar conhecimento informal em workflows guiados, validações, tarefas e registros rastreáveis. O piloto deve medir treinamento, erros, retrabalho, horas extras e divergências antes de afirmar resultado.

**Condição mínima:** o armazém precisa ter endereços identificáveis, produtos cadastráveis, responsável operacional e rotina básica de recebimento e expedição.

**Evidência necessária:** comparação antes/depois do tempo de treinamento, erros por tarefa, retrabalho, recontagens, ajustes e devoluções.
## 22. Pergunta técnica: WMS completo ou camada operacional?

**Pergunta provável:** O Estoque Mais está construindo um WMS completo ou uma camada mobile de execução, qualidade de dados e rastreabilidade?

**Resposta recomendada:** O Estoque Mais será um WMS para pequenos e médios operadores logísticos, com a experiência mobile como parte central do núcleo. O MVP terá escopo menor que um WMS corporativo avançado, mas cobrirá recebimento, armazenagem, movimentação, inventário, picking, expedição, divergências, auditoria e relatórios. Poderá integrar-se a ERP e outros sistemas, sem ser reduzido a uma camada complementar.

## 23. Fronteira técnica do WMS no MVP

### Dentro do MVP

- execução mobile;
- workflows guiados;
- validação de movimentações;
- recebimento, inventário, picking e expedição;
- controle de divergências;
- auditoria;
- migração por arquivo;
- relatórios operacionais básicos;
- operação prioritariamente online;
- arquitetura preparada para integração futura.

### Fora do MVP

- funcionalidades avançadas de WMS corporativo;
- TMS e roteirização;
- automação física de armazém;
- RFID e sensores avançados;
- machine learning;
- offline completo;
- integrações específicas ainda não validadas;
- customizações profundas para cada depositante.

## 24. Respostas técnicas parciais

### Complementa ou substitui WMS?

O Estoque Mais é um WMS. Pode operar como sistema principal de uma operação menor ou coexistir com ERP e sistemas legados. A decisão por cliente é de integração e migração, não de identidade do produto.

### Funcionará online ou offline?

O MVP deve priorizar operação online, com comportamento explícito para conectividade degradada. O offline completo só deve ser priorizado depois de validar sua necessidade no piloto.

### Quais integrações serão suportadas?

O MVP deve começar com importação e exportação de arquivos estruturados e uma API simples. As integrações prioritárias serão escolhidas após identificar os sistemas mais frequentes nos pilotos.

### Como será calculado o saldo?

O saldo deverá ser derivado de movimentações transacionais auditáveis, com regras para impedir duplicidade, saldo negativo indevido e alterações sem justificativa. Ainda faltam decisões sobre concorrência, idempotência, eventos atrasados e comportamento offline.

## 25. Decisões técnicas ainda sem resposta suficiente

- framework e organização do back-end Node.js;
- ORM ou query builder e estratégia de migrações do MySQL;
- modelo de entidades, eventos e concorrência de estoque;
- idempotência e prevenção de movimentações duplicadas;
- isolamento entre empresa, armazém e depositante;
- sincronização e comportamento em conectividade degradada;
- autenticação, autorização e sessões;
- instalação local, atualização e observabilidade;
- backup, restauração, RPO e RTO;
- dispositivos e leitores oficialmente suportados;
- documentos, endpoints e máquina de estados da FocusNFe;
- custo de implantação por cliente;
- limite aceitável de customização;
- critérios técnicos de sucesso do piloto.

> [!warning] Limite da resposta
> A definição do produto e da stack está vigente, mas segurança, disponibilidade, integração fiscal, desempenho e escalabilidade ainda dependem de implementação e testes.
## 26. Objeções sobre a proposta de valor

Esta seção incorpora a proposta registrada em [[Proposta de valor]] e deve ser usada para preparar conversas com operadores, patrocinadores e investidores.

### “Isso é apenas mais um WMS?”

**Resposta recomendada:** O Estoque Mais será um WMS, mas dimensionado para pequenos e médios 3PLs. O diferencial pretendido está na combinação de núcleo WMS, mobile como capacidade central, implantação assistida, migração controlada e workflows adequados a equipes com menor maturidade operacional.

**Ponto a validar:** se essa combinação é percebida como superior às alternativas existentes.

### “Por que não comprar um WMS corporativo?”

**Resposta recomendada:** WMS corporativos podem atender operações maiores, mas podem exigir mais investimento, tempo de implantação, equipe especializada e customização. O Estoque Mais pretende atender operações que precisam de um WMS real, mas possuem porte, orçamento e maturidade diferentes.

**Ponto a validar:** custo total e tempo de implantação das alternativas comparáveis.

### “O mobile é apenas uma interface?”

**Resposta recomendada:** Não. O mobile é parte central do núcleo do produto porque o recebimento, a movimentação, o inventário, o picking e a expedição acontecem no local da operação. A experiência deve guiar tarefas, validar endereço, produto e quantidade e registrar exceções.

### “Como o produto reduz custos?”

**Resposta recomendada:** A hipótese é reduzir horas de retrabalho, recontagens, erros de picking, devoluções, reentregas, treinamento repetido e relatórios manuais. O benefício deve ser medido com uma linha de base antes do piloto e comparado depois da implantação.

### “Como será demonstrado o ROI?”

**Resposta recomendada:** O piloto medirá o custo influenciável da operação, incluindo retrabalho, ajustes, erros, horas extras, devoluções e tempo de inventário. O ROI será calculado subtraindo implantação, migração, assinatura e suporte do benefício operacional observado.

### “A falta de pessoal qualificado não é um problema de gestão, e não de sistema?”

**Resposta recomendada:** O sistema não substitui gestão, treinamento ou infraestrutura. Ele pode reduzir a dependência de conhecimento informal por meio de workflows guiados, validações, permissões, tarefas e registros auditáveis.

**Condição mínima:** endereços identificáveis, produtos cadastráveis, responsável operacional e rotina básica de recebimento e expedição.

### “O escopo não está grande demais?”

**Resposta recomendada:** O produto terá um núcleo WMS, mas o MVP será limitado aos fluxos essenciais: recebimento, armazenagem, movimentação, inventário, picking, expedição, divergências e auditoria. TMS, roteirização, automação física, RFID, machine learning e integrações extensas ficam fora da primeira versão.

### “Como evitar que cada implantação vire um projeto customizado?”

**Resposta recomendada:** A implantação será baseada em templates, regras configuráveis, migração padronizada, treinamento reutilizável e um núcleo comum. Customizações profundas só serão aceitas quando forem repetidas em clientes do mesmo segmento.

### “Qual é a principal barreira de adoção?”

**Resposta recomendada:** A principal barreira pode ser a mudança de hábito no chão do armazém. Por isso, o produto deve priorizar poucos passos, linguagem simples, tarefas guiadas, validação imediata e treinamento contextual.

### “O que precisa ser comprovado antes de escalar?”

**Resposta recomendada:** É necessário comprovar problema recorrente, adoção pelos operadores, redução em pelo menos dois indicadores, implantação repetível, custo de suporte controlado e disposição do cliente para pagar pela continuidade.

## 27. Síntese atual da proposta

> Pequenos e médios 3PLs precisam de um WMS real, mas muitas vezes não conseguem absorver a complexidade, o custo ou o tempo de implantação de soluções corporativas. O Estoque Mais combina WMS mobile, execução guiada, migração assistida e rastreabilidade para transformar processos informais em operações mais confiáveis e mensuráveis.

> [!warning] Limite da proposta
> A proposta de valor organiza uma hipótese estratégica. Ainda não comprova mercado, ROI, disposição a pagar, superioridade competitiva ou escalabilidade comercial.


## 28. Integração com a FocusNFe

A prova técnica aprovada limita-se à consulta de **CT-e emitido pela FocusNFe usando a referência do documento**. Consulta de CT-e recebido, emissão, cancelamento, NF-e, NFC-e e outros documentos estão fora do primeiro escopo. A integração ainda não foi implementada ou homologada; ver [[Implementação técnica]] e [[Requisitos]].

O estado fiscal permanece separado do aval operacional e da baixa física; por padrão, não bloqueia a expedição nem cria, antecipa ou duplica movimento de estoque. Falhas técnicas de consulta são registradas separadamente da situação fiscal.

**A validar na prova técnica:** mapeamento dos estados e preservação do retorno original, autenticação segura, idempotência/reprocessamento, reconciliação, ambiente de homologação e responsabilidades por fluxo.

## 29. Perguntas e respostas por perfil de usuário

As objeções variam conforme a pessoa que interage com o produto. As respostas abaixo devem distinguir decisão atual, hipótese e evidência ainda necessária.

### Usuário administrativo ou cliente

#### “Vou precisar trocar meu ERP?”

**Resposta recomendada:** Não necessariamente. O Estoque Mais será um WMS e poderá operar integrado ao ERP. No MVP, a entrada e a saída de dados poderão ocorrer por arquivos estruturados, enquanto integrações específicas serão desenvolvidas conforme prioridade.

#### “Quanto tempo leva para implantar?”

**Resposta recomendada:** O prazo dependerá da qualidade dos cadastros, processos e infraestrutura. A implantação deve incluir diagnóstico, saneamento, migração, treinamento e piloto. Um prazo definitivo só deve ser informado após avaliar esses fatores.

#### “O sistema funciona sem internet?”

**Resposta recomendada:** A operação prioritária será online. O comportamento em conectividade degradada precisa ser definido e testado antes de prometer funcionamento offline completo.

#### “Como meus dados serão migrados?”

**Resposta recomendada:** Por mapeamento, saneamento, ambiente de testes, validação, migração controlada, reconciliação e possibilidade de rollback, conforme [[Requisitos]].

#### “Como funciona a FocusNFe?”

**Resposta recomendada:** A FocusNFe é a API fiscal inicialmente definida. O WMS deverá controlar estados da operação e registrar solicitações, retornos, rejeições e reprocessamentos. Os fluxos fiscais ainda precisam ser homologados.

#### “Quanto vou pagar?”

**Resposta recomendada:** O modelo comercial ainda está em validação e deverá considerar implantação, migração, suporte, usuários, armazéns e volume operacional.

### Gestor de operação

#### “Como saberei que o estoque está correto?”

**Resposta recomendada:** As movimentações deverão ser registradas de forma transacional, com operador, horário, origem, destino, produto e quantidade. A confiabilidade será demonstrada por testes de concorrência, inventário, ajustes e auditoria.

#### “Quais indicadores vou acompanhar?”

**Resposta recomendada:** O foco inicial será acuracidade, divergências, retrabalho, tempo de recebimento, inventário, erros de picking e expedições incorretas. Os dashboards ainda precisam ser definidos.

#### “O sistema realmente reduz custos?”

**Resposta recomendada:** Essa é uma hipótese. O piloto deverá comparar uma linha de base anterior com os resultados posteriores, medindo retrabalho, erros, horas extras, recontagens e devoluções.

#### “Como controlo vários clientes?”

**Resposta recomendada:** A arquitetura deverá separar clientes, armazéns e depositantes por dados e permissões. O modelo definitivo de multi-tenancy ainda precisa ser especificado e testado.

#### “Como evito depender de um funcionário experiente?”

**Resposta recomendada:** O sistema transforma procedimentos informais em workflows guiados, validações, permissões e registros auditáveis. Ele reduz a dependência de conhecimento informal, mas não substitui treinamento ou gestão.

#### “O que acontece se uma nota fiscal for rejeitada?”

**Resposta recomendada:** A operação ficará em estado controlado de rejeição, com o motivo registrado e possibilidade de correção e reenvio. A baixa definitiva do estoque dependerá da regra definida para aquele fluxo.

### Operador de estoque

#### “O sistema vai me dizer o que fazer?”

**Resposta recomendada:** Sim. O aplicativo deverá apresentar tarefas guiadas, indicando produto, endereço e quantidade, e validar cada etapa antes de confirmar a movimentação.

#### “E se eu encontrar uma divergência?”

**Resposta recomendada:** O operador poderá registrar a divergência com motivo e evidência definida pelo processo. A correção deverá passar por regra autorizada, sem apagar o histórico original.

#### “E se eu escanear o produto errado?”

**Resposta recomendada:** O sistema deverá bloquear a confirmação, informar o erro e indicar o produto ou endereço esperado.

#### “Vou precisar digitar tudo?”

**Resposta recomendada:** A proposta é reduzir digitação usando leitura de código de barras, listas e valores pré-configurados. Isso precisa ser validado em testes reais de usabilidade.

#### “Posso usar meu próprio celular?”

**Resposta recomendada:** O suporte oficial dependerá dos testes de dispositivos, câmera, sistema operacional e condições do galpão. Não se deve prometer compatibilidade universal.

#### “O que faço se ficar sem sinal?”

**Resposta recomendada:** O aplicativo deverá informar claramente a perda de conectividade e preservar o estado da tarefa conforme a estratégia definida. Offline completo ainda não está confirmado.

#### “O sistema será usado para me punir?”

**Resposta recomendada:** O objetivo é registrar o processo e reduzir erros, não criar punições automáticas. O acesso aos registros deverá seguir permissões e regras de governança da empresa.

### Pergunta transversal

> O sistema facilita o trabalho real sem comprometer a confiabilidade dos dados?

**Resposta recomendada:** Essa é a hipótese central de usabilidade e operação. Ela deve ser testada com usuários administrativos, gestores e operadores reais, usando tarefas representativas e métricas antes e depois do piloto.


## 30. Perguntas sobre OPEX e respostas

Os custos operacionais recorrentes precisam ser considerados no preço, na margem, no custo de servir e no ROI. A lista abaixo organiza as perguntas mais prováveis sem apresentar estimativas ainda não medidas como fatos.

### Perguntas de investidores

#### “Qual será o principal custo recorrente do produto?”

**Resposta recomendada:** Inicialmente, os maiores custos tendem a ser equipe técnica, cloud, suporte, manutenção do aplicativo e implantação de clientes. O peso de cada item ainda precisa ser medido por cliente ativo.

#### “A margem não será comprometida por implantações manuais?”

**Resposta recomendada:** Esse é um risco. A estratégia é padronizar templates de migração, treinamento, configuração e suporte. O custo por implantação deve ser acompanhado até que possa ser repetido com pouca customização.

#### “A FocusNFe gera custo variável?”

**Resposta recomendada:** Podem existir custos de assinatura, consumo, certificados ou serviços relacionados. Eles devem ser incorporados ao custo de servir ou repassados conforme o modelo comercial.

#### “O suporte crescerá proporcionalmente ao número de clientes?”

**Resposta recomendada:** Pode crescer se o produto depender de atendimento manual. Workflows guiados, documentação, monitoramento e diagnóstico remoto devem reduzir o suporte por cliente, mas isso precisa ser comprovado.

#### “O modelo SaaS reduz custos?”

**Resposta recomendada:** Pode reduzir infraestrutura local do cliente e facilitar atualizações, mas cria custos recorrentes de cloud, segurança, backup, monitoramento e suporte. O benefício depende da escala.

### Perguntas do cliente

#### “Além da mensalidade, que custos terei?”

**Resposta recomendada:** Podem existir custos de implantação, migração, treinamento, dispositivos, rede Wi-Fi, etiquetas, impressoras, conectividade e integração fiscal. Esses itens devem ser apresentados separadamente para evitar custos ocultos.

#### “Quem paga pela FocusNFe?”

**Resposta recomendada:** Isso dependerá do modelo comercial. O custo pode estar incluído na mensalidade, ser cobrado por uso ou ficar sob responsabilidade do cliente. Essa política ainda precisa ser definida.

#### “Terei de contratar uma equipe de TI?”

**Resposta recomendada:** A proposta é reduzir essa necessidade, especialmente no MVP. Porém, o cliente ainda precisará de um responsável operacional e de alguém para apoiar cadastros, permissões e decisões de processo.

#### “Quanto custa manter os dispositivos?”

**Resposta recomendada:** O custo inclui reposição, baterias, manutenção e eventual substituição. O valor depende do tipo de equipamento e da intensidade de uso.

### Perguntas do gestor

#### “Como vou controlar o custo operacional?”

**Resposta recomendada:** O sistema deve acompanhar horas de suporte, retrabalho, recontagens, erros, treinamento e tempo de implantação. Esses dados formarão o custo real de servir e ajudarão a demonstrar o ROI.

#### “O sistema reduz ou cria trabalho?”

**Resposta recomendada:** No início, pode criar trabalho de cadastro, treinamento e adaptação. A hipótese é que esse esforço seja compensado pela redução contínua de retrabalho, divergências e controles paralelos.

#### “Como evitar pagar por recursos que não uso?”

**Resposta recomendada:** O MVP deve ter escopo enxuto e modelo comercial compatível com o porte da operação. Módulos e integrações adicionais podem ser ativados conforme necessidade.

### Pontos ainda sem resposta definitiva

- custo mensal por cliente;
- custo médio de suporte;
- custo de cloud por armazém;
- custo da FocusNFe por operação;
- custo de implantação e migração;
- quantidade de clientes necessária para atingir margem;
- percentual de suporte automatizado;
- custo de manutenção dos dispositivos;
- preço mínimo sustentável;
- quais custos serão absorvidos pelo produto ou repassados ao cliente.

> [!warning] Limite da resposta
> Os custos recorrentes foram identificados, mas ainda não foram comprovados em operação real. O piloto deverá medir implantação, suporte, infraestrutura, integração e manutenção por cliente antes da definição definitiva de preço e margem.
