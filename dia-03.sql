use leleserv;

/*
Projeto : Biblioteca
Autor : Letícia Nascimento
Data : 06/01/2024*/

CREATE TABLE usuarios (
    ID_usuario INT PRIMARY KEY,
    nome VARCHAR(50)
);

INSERT INTO usuarios (ID_usuario, nome) VALUES
(1, 'Alicia'),
(2, 'Maria'),
(3, 'Anderson'),
(4, 'Natalie'),
(5, 'Alda'),
(6, 'Clyde'),
(7, 'Bonette');

CREATE TABLE autores (
    ID_autor INT PRIMARY KEY,
    Nome VARCHAR(50)
);

INSERT INTO Autores (ID_autor, nome) VALUES
(1, 'Stephen King'),
(2, 'J.K. Rowling'),
(3, 'George Orwell'),
(4, 'Agatha Christie'),
(5, 'Suzanne Collins');

CREATE TABLE livros (
    ID_livro INT PRIMARY KEY,
    titulo VARCHAR(100),
    autor_ID INT,
    FOREIGN KEY (autor_ID) REFERENCES autores(ID_autor)
);

INSERT INTO livros (ID_livro, titulo, autor_ID) VALUES
(1, 'It', 1),
(2, 'Harry Potter and the Philosopher''s Stone', 2),
(3, '1984', 3),
(4, 'Murder on the Orient Express', 4),
(5, 'The Shining', 1),
(6, 'Harry Potter and the Chamber of Secrets', 2),
(7, 'Animal Farm', 3),
(8, 'The Murder of Roger Ackroyd', 4),
(9, 'Carrie', 1),
(10, 'Harry Potter and the Prisoner of Azkaban', 2),
(11, 'Harry Potter and the Chamber of Secrets', 2),
(12, 'The Hunger Games', 5),
(13, 'Pet Sematary', 2),
(14, 'The Ballad of Songbirds & Snakes', 5);

CREATE TABLE emprestimos (
    ID_emprestimo INT PRIMARY KEY,
    usuario_ID INT,
    livro_ID INT,
    data_emprestimo DATE,
    data_devolucao DATE,
    FOREIGN KEY (usuario_ID) REFERENCES usuarios(ID_usuario),
    FOREIGN KEY (livro_ID) REFERENCES livros(ID_livro)
);

INSERT INTO emprestimos (ID_emprestimo, usuario_ID, livro_ID, data_Emprestimo, data_devolucao) VALUES
(1, 1, 1, '2023-01-01', NULL),
(2, 2, 3, '2023-02-15', '2023-03-01'),
(3, 3, 5, '2023-03-10', NULL),
(4, 4, 7, '2023-04-05', '2023-04-20'),
(5, 1, 9, '2023-05-01', NULL);

SELECT 
    U.nome AS nome_usuario,
    COUNT(E.ID_emprestimo) AS livros_emprestados
FROM 
    usuarios U
    JOIN emprestimos E ON U.ID_usuario = E.usuario_ID
WHERE 
    E.data_devolucao IS NULL
GROUP BY 
    U.nome;

