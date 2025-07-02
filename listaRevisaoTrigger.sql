CREATE TABLE contas (
  conta_id serial PRIMARY KEY,
  saldo numeric
);

CREATE TABLE contas_audit (
  conta_id integer,
  old_saldo numeric,
  new_saldo numeric,
  data_modificacao timestamp
);

create or replace function monitora_saldo() returns trigger as
$$
	begin
		if old.conta_id is null then
			return null;
		end if;

		if new.saldo is distinct from old.saldo then
			insert into contas_audit(conta_id, old_saldo, new_saldo, data_modificacao)
			values(old.conta_id, old.saldo, new.saldo, now());
		end if;
		return new;
	end;
$$ language plpgsql;

create trigger monitora_saldo after update or insert on contas
	for each row execute function monitora_saldo();

DROP TRIGGER IF EXISTS monitora_saldo
  ON contas;

DROP FUNCTION IF EXISTS monitora_saldo() CASCADE;


select c.saldo from contas c;
select * from contas_audit ca;

insert into contas(saldo) values(199000);

update contas c
	set saldo = 1500
where c.conta_id = 5



