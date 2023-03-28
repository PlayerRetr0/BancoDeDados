CREATE TABLE "usuario" (
  "usu_cd_id" serial not null,
  "usu_tx_senha" varchar(50) not null,
  "usu_tx_nome_usuario" varchar(50) not null unique,
  PRIMARY KEY ("usu_cd_id")
);

CREATE TABLE "endereco" (
  "end_cd_id" serial not null,
  "end_tx_cep" varchar(20) not null,
  "end_int_numero" integer,
  "end_tx_complemento" varchar(100) not null unique,
  PRIMARY KEY ("end_cd_id")
);

CREATE TABLE "cliente" (
  "cli_cd_id" serial not null,
  "cli_tx_nome_cli" varchar(60) not null,
  "cli_tx_email" varchar(80) not null unique,
  "cli_tx_cpf" char(14) not null unique,
  "cli_tx_endereço" varchar(80) not null unique,
  "cli_dt_data_nasc" date not null,
  "cli_int_codigo_cli" integer not null,
  "usu_tx_nome_usuario" varchar(50) not null unique,
  "end_cd_id" serial not null,
  PRIMARY KEY ("cli_cd_id"),
    CONSTRAINT "FK_usuario.usu_tx_nome_usuario"
    FOREIGN KEY ("usu_tx_nome_usuario")
      REFERENCES "usuario"("usu_tx_nome_usuario"),
	  CONSTRAINT "FK_endereco.end_cd_id"
    FOREIGN KEY ("end_cd_id")
      REFERENCES "endereco"("end_cd_id")
);



CREATE TABLE "funcionario" (
  "fun_cd_id" serial not null,
  "fun_tx_codigo" varchar(256) not null,
  "fun_tx_nome_fun" varchar(60) not null,
  "fun_tx_cpf" varchar(11) not null unique,
  "usu_cd_id" serial not null,
  PRIMARY KEY ("fun_cd_id"),
    CONSTRAINT "FK_usuario.usu_cd_id"
    FOREIGN KEY ("usu_cd_id")
      REFERENCES "usuario"("usu_cd_id")
);

CREATE TABLE "categoria" (
  "cat_cd_id" serial not null,
  "cat_tx_descrição_cat" varchar(256) not null,
  "cat_tx_nome_cat" varchar(60) not null unique,
  "cat_tx_codigo" varchar(256) not null unique,
  PRIMARY KEY ("cat_cd_id")
);

CREATE TABLE "produto" (
  "prod_cd_id" serial not null,
  "prod_tx_nome_prod" varchar(60) not null unique,
  "prod_tx_descricao_prod" varchar(256) not null unique,
  "prod_dt_data_fabri" date not null,
  "prod_int_valor_unitario" integer not null,
  "prod_int_qtd_em_estoque" integer not null ,
  "prod_int_codigo_prod" integer not null,
  "fun_cd_id" serial not null,
  "cat_cd_id" serial not null,
  PRIMARY KEY ("prod_cd_id"),
  CONSTRAINT "FK_funcionario.fun_cd_id"
    FOREIGN KEY ("fun_cd_id")
      REFERENCES "funcionario"("fun_cd_id"),
    CONSTRAINT "FK_categoria.cat_cd_id"
    FOREIGN KEY ("cat_cd_id")
      REFERENCES "categoria"("cat_cd_id")
);

CREATE TABLE "pedido" (
  "ped_cd_id" serial not null,
  "ped_dt_data_pedido" date,
  "ped_tx_codigo_ped" integer not null,
  "cli_cd_id" serial not null,
  "prod_cd_id" serial not null,
  PRIMARY KEY ("ped_cd_id"),
  CONSTRAINT "FK_produto.prod_cd_id"
    FOREIGN KEY ("prod_cd_id")
      REFERENCES "produto"("prod_cd_id"),
    CONSTRAINT "FK_cliente.cli_cd_id"
    FOREIGN KEY ("cli_cd_id")
      REFERENCES "cliente"("cli_cd_id")
);

CREATE TABLE "pedido_item" (
  "pedit_cd_id" serial not null,
  "prod_cd_id" serial not null,
  "ped_cd_id" serial not null,
  PRIMARY KEY ("pedit_cd_id"),
  CONSTRAINT "FK_pedido.ped_cd_id"
    FOREIGN KEY ("ped_cd_id")
      REFERENCES "pedido"("ped_cd_id"),
    CONSTRAINT "FK_produto.prod_cd_id"
    FOREIGN KEY ("prod_cd_id")
      REFERENCES "produto"("prod_cd_id")
);