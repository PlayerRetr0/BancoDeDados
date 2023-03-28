CREATE TABLE public.usuario (
	usu_cd_id serial4 NOT NULL,
	usu_tx_senha varchar(50) NOT NULL,
	usu_tx_nome_usuario varchar(50) NOT NULL,
	CONSTRAINT usuario_pkey PRIMARY KEY (usu_cd_id),
	CONSTRAINT usuario_usu_tx_nome_usuario_key UNIQUE (usu_tx_nome_usuario)
);
CREATE TABLE public.cliente (
	cli_cd_id serial4 NOT NULL,
	cli_tx_nome_cli varchar(60) NOT NULL,
	cli_tx_email varchar(80) NOT NULL,
	cli_tx_cpf bpchar(14) NOT NULL,
	cli_tx_endereço varchar(80) NOT NULL,
	cli_dt_data_nasc date NOT NULL,
	cli_int_codigo_cli int4 NOT NULL,
	usu_tx_nome_usuario varchar(50) NOT NULL,
	end_cd_id serial not null,
	CONSTRAINT cliente_cli_tx_cpf_key UNIQUE (cli_tx_cpf),
	CONSTRAINT cliente_cli_tx_email_key UNIQUE (cli_tx_email),
	CONSTRAINT cliente_cli_tx_endereço_key UNIQUE ("cli_tx_endereço"),
	CONSTRAINT cliente_pkey PRIMARY KEY (cli_cd_id),
	CONSTRAINT cliente_usu_tx_nome_usuario_key UNIQUE (usu_tx_nome_usuario),
	CONSTRAINT "FK_usuario.usu_tx_nome_usuario" FOREIGN KEY (usu_tx_nome_usuario) REFERENCES public.usuario(usu_tx_nome_usuario)
);
CREATE TABLE public.funcionario (
	fun_cd_id serial4 NOT NULL,
	fun_tx_codigo varchar(256) NOT NULL,
	fun_tx_nome_fun varchar(60) NOT NULL,
	fun_tx_cpf varchar(11) NOT NULL,
	usu_cd_id serial4 NOT NULL,
	CONSTRAINT funcionario_fun_tx_cpf_key UNIQUE (fun_tx_cpf),
	CONSTRAINT funcionario_pkey PRIMARY KEY (fun_cd_id),
	CONSTRAINT "FK_usuario.usu_cd_id" FOREIGN KEY (usu_cd_id) REFERENCES public.usuario(usu_cd_id)
);
CREATE TABLE public.categoria (
	cat_cd_id serial4 NOT NULL,
	cat_tx_descrição_cat varchar(256) NOT NULL,
	cat_tx_nome_cat varchar(60) NOT NULL,
	cat_tx_codigo varchar(256) NOT NULL,
	CONSTRAINT categoria_cat_tx_codigo_key UNIQUE (cat_tx_codigo),
	CONSTRAINT categoria_cat_tx_nome_cat_key UNIQUE (cat_tx_nome_cat),
	CONSTRAINT categoria_pkey PRIMARY KEY (cat_cd_id)
);
CREATE TABLE public.produto (
	prod_cd_id serial4 NOT NULL,
	prod_tx_nome_prod varchar(60) NOT NULL,
	prod_tx_descricao_prod varchar(256) NOT NULL,
	prod_dt_data_fabri date NOT NULL,
	prod_int_valor_unitario int4 NOT NULL,
	prod_int_qtd_em_estoque int4 NOT NULL,
	prod_int_codigo_prod int4 NOT NULL,
	fun_cd_id serial4 NOT NULL,
	cat_cd_id serial4 NOT NULL,
	CONSTRAINT produto_pkey PRIMARY KEY (prod_cd_id),
	CONSTRAINT produto_prod_tx_descricao_prod_key UNIQUE (prod_tx_descricao_prod),
	CONSTRAINT produto_prod_tx_nome_prod_key UNIQUE (prod_tx_nome_prod),
	CONSTRAINT "FK_categoria.cat_cd_id" FOREIGN KEY (cat_cd_id) REFERENCES public.categoria(cat_cd_id),
	CONSTRAINT "FK_funcionario.fun_cd_id" FOREIGN KEY (fun_cd_id) REFERENCES public.funcionario(fun_cd_id)
);
CREATE TABLE public.pedido (
	ped_cd_id serial4 NOT NULL,
	ped_dt_data_pedido date NULL,
	ped_tx_codigo_ped int4 NOT NULL,
	cli_cd_id serial4 NOT NULL,
	prod_cd_id serial4 NOT NULL,
	CONSTRAINT pedido_pkey PRIMARY KEY (ped_cd_id),
	CONSTRAINT "FK_cliente.cli_cd_id" FOREIGN KEY (cli_cd_id) REFERENCES public.cliente(cli_cd_id),
	CONSTRAINT "FK_produto.prod_cd_id" FOREIGN KEY (prod_cd_id) REFERENCES public.produto(prod_cd_id)
);
CREATE TABLE public.pedido_item (
	pedit_cd_id serial4 NOT NULL,
	prod_cd_id serial4 NOT NULL,
	ped_cd_id serial4 NOT NULL,
	CONSTRAINT pedido_item_pkey PRIMARY KEY (pedit_cd_id),
	CONSTRAINT "FK_pedido.ped_cd_id" FOREIGN KEY (ped_cd_id) REFERENCES public.pedido(ped_cd_id),
	CONSTRAINT "FK_produto.prod_cd_id" FOREIGN KEY (prod_cd_id) REFERENCES public.produto(prod_cd_id)
);
