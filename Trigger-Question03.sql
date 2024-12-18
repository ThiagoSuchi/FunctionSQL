-- 03:
describe produto;

create table historico_preco_produto(
id int not null primary key auto_increment,
data_modificacao datetime,
id_produto int not null,
valor_anterior float,
valor_novo float
);

DELIMITER //
create trigger comparar_Preco after update
on produto
for each row
begin
	if new.preco_Normal <> old.preco_Normal then
		insert into historico_preco_produto
		values (null, now(), new.idProduto, old.preco_Normal, new.preco_Normal);
	end if;
end //
DELIMITER ;

select*from produto;
select*from historico_preco_produto;

show triggers;
