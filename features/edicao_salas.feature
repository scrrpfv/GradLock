Feature: Edição de salas

Scenario: Edição de sala com sucesso
Given o administrador "Pedro Dias" 
And ele está na página de edição de salas da sala "GRAD 04"
And os campos estão preenchidos com as informações atuais da sala
When ele edita o campo "Descrição" para "Laboratório renovado"
And ele deixa os campos "Nome da sala", "Capacidade", "Tem computadores" e "Tem projetores" sem alteração
And seleciona "Editar"
Then o sistema edita as informações armazenadas
And a mensagem "Sala atualizada com sucesso" é exibida.

Scenario: Edição de sala mal sucedida por falta de dados
Given o administrador "Pedro Dias" 
And ele está na página de edição de salas da sala "GRAD 04"
And os campos estão preenchidos com as informações atuais da sala
When ele não altera nenhum campo do formulário
And seleciona "Editar"
Then o sistema reconhece que nenhum dado foi fornecido para atualização
And a mensagem "Nenhum dado fornecido para atualização" é exibida.

Scenario: Erro na edição de sala por nome indisponível
Given o administrador "Pedro Dias" 
And ele está na página de edição de salas da sala "GRAD 04"
When ele edita o campo "Nome da sala" para "GRAD 05"
And ele deixa os campos "Descrição", "Capacidade", "Tem computadores" e "Tem projetores" sem alteração
And seleciona "Editar"
Then o sistema identifica que já existe uma sala com esse nome
And a mensagem "Falha na edição. Esse nome está indisponível" é exibida.

Scenario: Erro na edição de sala por capacidade negativa
Given o administrador "Pedro Dias" 
And ele está na página de edição de salas da sala "GRAD 04"
When ele edita o campo "Capacidade" para "-15"
And ele deixa os campos "Nome da sala", "Descrição", "Tem computadores" e "Tem projetores" sem alteração
And seleciona "Editar"
Then o sistema reconhece que a capacidade é um valor inválido
And a mensagem "Falha na edição. A capacidade deve ser um número positivo!" é exibida.

Scenario: Erro na edição de sala por ID inexistente
Given o administrador "Pedro Dias" 
And ele tenta editar uma sala com ID "999"
When ele edita o campo "Nome da sala" para "GRAD 10"
And seleciona "Editar"
Then o sistema reconhece que a sala não existe
And a mensagem "Sala não encontrada" é exibida.

Scenario: Erro na edição de sala por ID inválido
Given o administrador "Pedro Dias" 
And ele tenta editar uma sala com ID "abc"
When ele edita o campo "Nome da sala" para "GRAD 10"
And seleciona "Editar"
Then o sistema reconhece que o ID é inválido
And a mensagem "ID da sala deve ser um número válido" é exibida.
