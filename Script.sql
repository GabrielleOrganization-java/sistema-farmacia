
CREATE TABLE public.armazenamento (
	id serial4 NOT NULL,
	refrigeracao varchar(50) NOT NULL,
	temperatura_controlada int4 NOT NULL,
	CONSTRAINT armazenamento_pkey PRIMARY KEY (id)
);


CREATE TABLE public.controle_movimentacao (
	id serial4 NOT NULL,
	medicamento_id int4 NULL,
	responsavel varchar(100) NOT NULL,
	data_entrada date NOT NULL,
	data_retirada date NOT NULL,
	CONSTRAINT controle_movimentacao_pkey PRIMARY KEY (id),
	CONSTRAINT controle_movimentacao_medicamento_id_fkey FOREIGN KEY (medicamento_id) REFERENCES public.armazenamento(id)
);


CREATE TABLE public.medicamento (
	id serial4 NOT NULL,
	dosagem varchar(30) NOT NULL,
	forma_administracao varchar(30) NOT NULL,
	validade int4 NOT NULL,
	lote varchar(30) NOT NULL,
	armazenamento_id int4 NULL,
	CONSTRAINT medicamento_pkey PRIMARY KEY (id),
	CONSTRAINT medicamento_armazenamento_id_fkey FOREIGN KEY (armazenamento_id) REFERENCES public.armazenamento(id)
);