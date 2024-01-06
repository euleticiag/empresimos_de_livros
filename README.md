Caso de Uso: Sistema de Gerenciamento de Biblioteca

Descrição:
Imagine que você está desenvolvendo um sistema de gerenciamento de biblioteca. O sistema precisa armazenar informações sobre livros, autores, empréstimos e usuários. Vamos focar em uma consulta específica relacionada aos empréstimos de livros.

Requisito:
Os usuários podem emprestar livros da biblioteca, e queremos saber quantos livros cada usuário tem atualmente emprestados.

Modelo de Dados Simplificado:

Tabela Usuarios: ID_Usuario, Nome
Tabela Livros: ID_Livro, Titulo, Autor_ID
Tabela Autores: ID_Autor, Nome
Tabela Emprestimos: ID_Emprestimo, Usuario_ID, Livro_ID, Data_Emprestimo, Data_Devolucao (pode ser NULL se o livro ainda não foi devolvido).
