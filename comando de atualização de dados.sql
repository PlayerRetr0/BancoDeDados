select * from usuario u 
--comandos da troca do nome e a senha de usuario--
update usuario 
set usu_tx_senha ='123456',usu_tx_nome_usuario = 'Amity Blight'
where usu_cd_id = 1;

select * from endereco e 
--usuario deseja mudar de endereço--
update endereco  
set end_int_cep= '25660345',end_int_num= '23',end_itx_rua='owl house',end_tx_comp='boiling isles',end_tx_bairro='wartwood'
where end_cd_id = 3;

--para o caso do id comer um numero acidentalmente e possivel alteralo manualmente--
update endereco 
set end_cd_id ='1'
where end_cd_id =6