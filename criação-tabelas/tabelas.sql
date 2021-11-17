CREATE TABLE Pessoa (
    CPF CHAR (3),
    Nome VARCHAR (255) NOT NULL,
    Email VARCHAR (255) NOT NULL,
    Data_Nascimento DATE,
    CEP CHAR (8),
    CONSTRAINT pessoa_pkey PRIMARY KEY (CPF)
);

CREATE TABLE Cliente (
    CPF CHAR (3),
    CONSTRAINT cliente_pkey PRIMARY KEY (CPF),
    CONSTRAINT Cliente_fkey FOREIGN KEY (CPF) REFERENCES Pessoa(CPF)
);

CREATE TABLE Produto 
( 
    Codigo INTEGER NOT NULL, 
    Preco NUMBER, 
    Lote CHAR (4), 
    Estoque NUMBER, 
    Fabricacao DATE, 
    Validade DATE, 
    Marca VARCHAR (255) NOT NULL, 
    Nome VARCHAR (255) NOT NULL, 
    CONSTRAINT produto_pkey PRIMARY KEY (Codigo), 
    CONSTRAINT produto_checkPreco CHECK (Preco > 0), 
    CONSTRAINT produto_checkEstoque CHECK (Estoque >= 0) 
 
);

CREATE TABLE Compra 
( 
    CPF_Cliente CHAR (3), 
    Codigo_Produto INTEGER NOT NULL, 
    Data_Compra DATE, 
    Hora_Compra VARCHAR (255), 
    CONSTRAINT compra_pkey PRIMARY KEY (CPF_Cliente, Codigo_Produto), 
    CONSTRAINT compra_fkey1 FOREIGN KEY (CPF_Cliente) REFERENCES Cliente(CPF), 
    CONSTRAINT compre_fkey2 FOREIGN KEY (Codigo_Produto) REFERENCES Produto(Codigo) 
 
);

CREATE TABLE Pet ( 
    CPF_Cliente CHAR (3), 
    Nome VARCHAR (255), 
    Espécie VARCHAR (255), 
    Raça VARCHAR (255), 
    Cor VARCHAR (255), 
    Data_de_nascimento DATE, 
    CONSTRAINT cpfcliente_fkey FOREIGN KEY (CPF_Cliente) REFERENCES Cliente(CPF),
    CONSTRAINT nome_pkey PRIMARY KEY (CPF_Cliente, Nome)
 
);

CREATE TABLE Funcionario ( 
 CPF char(3), 
 Matricula varchar(255) NOT NULL, 
 Salario int NOT NULL, 
 Cargo varchar(255) NOT NULL, 
 Data_de_admissao date, 
 CPF_Supervisor char(3), 
 CONSTRAINT funcionario_pkey PRIMARY KEY (CPF), 
 CONSTRAINT cpffuncionario_fkey FOREIGN KEY (CPF) REFERENCES Pessoa(CPF), 
 CONSTRAINT cpfsupervisor_fkey FOREIGN KEY (CPF_Supervisor) REFERENCES Funcionario(CPF), 
 CONSTRAINT salario_check CHECK (Salario >= 1100) 
);

CREATE TABLE Veterinario ( 
 CPF char(3),  
 Numero_CRMV varchar(255) NOT NULL, 
 CONSTRAINT veterinario_pkey PRIMARY KEY(CPF), 
 CONSTRAINT veterinario_fkey FOREIGN KEY(CPF) REFERENCES Pessoa(CPF) 
);

CREATE TABLE Consulta ( 
    CPF_Vet CHAR (3), 
    Nome_Pet VARCHAR (255), 
    CPF_Cliente CHAR (3), 
    Data_Consulta DATE, 
    Hora_Consulta VARCHAR (255), 
    Cod_Produto INTEGER, 
    CONSTRAINT cpfvet_fkey FOREIGN KEY (CPF_Vet) REFERENCES Veterinario(CPF), 
    CONSTRAINT nomecpf_fkey FOREIGN KEY (CPF_Cliente, Nome_Pet) REFERENCES Pet(CPF_Cliente, Nome), 
    CONSTRAINT codproduto_fkey FOREIGN KEY (Cod_Produto) REFERENCES Produto(Codigo)
);

