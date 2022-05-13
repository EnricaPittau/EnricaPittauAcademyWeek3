create database PizzeriaDaLuigi

--CREATE TABLE
Create table Pizza(
CodicePizza int Identity(1,1) not null,
Nome varchar(30) not null,
Prezzo decimal (6,2) not null,
constraint PK_Pizza primary key (CodicePizza),
constraint CHK_PrezzoPizza CHECK (Prezzo > 0), 
)
Create table Ingrediente(
CodiceIngrediente int Identity(1,1) not null,
Nome varchar(30) not null,
Costo decimal (6,2) not null,
ScorteMagazzino int not null,
constraint PK_Ingrediente primary key (CodiceIngrediente),
constraint CHK_CostoIngrediente CHECK (Costo > 0), 
constraint CHK_ScorteMagazzino CHECK (ScorteMagazzino >= 0), 
)
Create table PizzaIngrediente(
CodicePizza int not null,
CodiceIngrediente int not null,
constraint PK_PizzaIngrediente PRIMARY KEY (CodicePizza, CodiceIngrediente),
constraint FK_PizzaIngrediente1 FOREIGN KEY (CodicePizza) REFERENCES Pizza(CodicePizza),
constraint FK_PizzaIngrediente2 FOREIGN KEY (CodiceIngrediente) REFERENCES Ingrediente(CodiceIngrediente),
)

--INSERT INTO
insert into Pizza values ('Margherita', 5)
insert into Pizza values ('Bufala', 7)
insert into Pizza values ('Diavola', 6)
insert into Pizza values ('Quattro stagioni', 6.50)
insert into Pizza values ('Porcini', 7)
insert into Pizza values ('Dionisio', 8)
insert into Pizza values ('Ortolana', 8)
insert into Pizza values ('Patate e salsiccia', 6)
insert into Pizza values ('Pomodorini', 6)
insert into Pizza values ('Quattro formaggi', 7.50)
insert into Pizza values ('Caprese', 7.50)
insert into Pizza values ('Zeus', 7.50)

select * from Pizza

insert into Ingrediente values ('Pomodoro', 1, 50)
insert into Ingrediente values ('Mozzarella', 1, 20)
insert into Ingrediente values ('Mozzarella di bufala', 3, 15)
insert into Ingrediente values ('Spianta piccante', 2, 10)
insert into Ingrediente values ('Funghi', 1, 60)
insert into Ingrediente values ('Carciofi', 5, 10)
insert into Ingrediente values ('Cotto', 3, 16)
insert into Ingrediente values ('Funghi porcini', 4, 50)
insert into Ingrediente values ('Stracchino', 4, 10)
insert into Ingrediente values ('Speck', 1, 9)
insert into Ingrediente values ('Rucola', 1, 6)
insert into Ingrediente values ('Grana', 2, 5)
insert into Ingrediente values ('Verdure stagione', 1, 50)
insert into Ingrediente values ('Patate', 2, 10)
insert into Ingrediente values ('Salsiccia', 1, 8)
insert into Ingrediente values ('Pomodorini', 0.5, 20)
insert into Ingrediente values ('Ricotta', 1, 7)
insert into Ingrediente values ('Provola', 3, 15)
insert into Ingrediente values ('Gorgonzola', 1, 12)
insert into Ingrediente values ('Pomodoro fresco', 1, 7)
insert into Ingrediente values ('Basilico', 1, 8)
insert into Ingrediente values ('Bresaola', 1, 9)

select * from Ingrediente

--Procedure
--1. Inserimento di una nuova pizza(Parametri nome e prezzo)
create procedure AggiungiPizza
@nomePizza varchar(30),
@PrezzoPizza decimal (6,2)
as
insert into Pizza values (@nomePizza, @PrezzoPizza)
go
Execute AggiungiPizza 'Pizza della casa', 10
select * from Pizza

--2. Assegnazione di un ingrediente ad una pizza (parametri: nome pizza, nome ingrediente)
create procedure AggiungiIngredienteInPizza
@nomePizza varchar(30),
@nomeIngrediente varchar(30)
as
declare @idPizza int
select @idPizza=p.CodicePizza
from Pizza p
where p.Nome=@nomePizza

declare @idIngrediente int
select @idIngrediente=i.CodiceIngrediente
from Ingrediente i
where i.Nome=@nomeIngrediente

insert into PizzaIngrediente values (@idPizza, @idIngrediente )
go

select*from PizzaIngrediente
select*from Pizza
select*from Ingrediente

execute AggiungiIngredienteInPizza 'Margherita','Pomodoro'
execute AggiungiIngredienteInPizza 'Margherita','Mozzarella'
execute AggiungiIngredienteInPizza 'Bufala','Pomodoro'
execute AggiungiIngredienteInPizza 'Bufala','Mozzarella di bufala'
execute AggiungiIngredienteInPizza 'Diavola','Pomodoro'
execute AggiungiIngredienteInPizza 'Diavola','Mozzarella'
execute AggiungiIngredienteInPizza 'Diavola','Spianata piccante'
execute AggiungiIngredienteInPizza 'Quattro stagioni','Pomodoro'
execute AggiungiIngredienteInPizza 'Quattro stagioni','Mozzarella'
execute AggiungiIngredienteInPizza 'Quattro stagioni','Funghi'
execute AggiungiIngredienteInPizza 'Quattro stagioni', 'Carciofo'
execute AggiungiIngredienteInPizza'Quattro stagioni','Cotto'
execute AggiungiIngredienteInPizza 'Quattro stagioni','Oliva'
execute AggiungiIngredienteInPizza 'Porcini','Mozzarella'
execute AggiungiIngredienteInPizza 'Porcini', 'Funghi porcini'
execute AggiungiIngredienteInPizza 'Porcini','Pomodoro'
execute AggiungiIngredienteInPizza 'Dioniso','Pomodoro'
execute AggiungiIngredienteInPizza 'Dioniso','Mozzarella'
execute AggiungiIngredienteInPizza 'Dioniso','Stracchino'
execute AggiungiIngredienteInPizza 'Dioniso','Speck'
execute AggiungiIngredienteInPizza 'Dioniso','Rucola'
execute AggiungiIngredienteInPizza 'Dioniso','Grana'
execute AggiungiIngredienteInPizza 'Ortolana','Pomodoro'
execute AggiungiIngredienteInPizza 'Ortolana','Mozzarella'
execute AggiungiIngredienteInPizza 'Ortolana','Verdure di stagione'
execute AggiungiIngredienteInPizza 'Patate e salsiccia','Mozzarella'
execute AggiungiIngredienteInPizza 'Patate e salsiccia','Patate'
execute AggiungiIngredienteInPizza 'Patate e salsiccia','Salsiccia'
execute AggiungiIngredienteInPizza 'Pomodorini','Mozzarella'
execute AggiungiIngredienteInPizza 'Pomodorini','Pomodorini'
execute AggiungiIngredienteInPizza 'Pomodorini','Ricotta'
execute AggiungiIngredienteInPizza 'Quattro formaggi','Mozzarella'
execute AggiungiIngredienteInPizza 'Quattro formaggi','Provola'
execute AggiungiIngredienteInPizza 'Quattro formaggi','Gorgonzola'
execute AggiungiIngredienteInPizza 'Quattro formaggi','Grana'
execute AggiungiIngredienteInPizza 'Caprese','Mozzarella'
execute AggiungiIngredienteInPizza 'Caprese','Pomodoro fresco'
execute AggiungiIngredienteInPizza 'Caprese','Basilico'
execute AggiungiIngredienteInPizza 'Zeus','Mozzarella'
execute AggiungiIngredienteInPizza 'Zeus','Bresaola'
execute AggiungiIngredienteInPizza 'Zeus', 'Rucola'

--Aggiornamento del prezzo di una pizza(parametri:nomepizza, nuovo prezzo)
select*from PizzaIngrediente
select*from Pizza
select*from Ingrediente

create procedure AggiornamentoPrezzoPizza
@nomePizza varchar(30),
@nuovoPrezzo decimal (6,2)
as
declare @idPizza int
select @idPizza=p.CodicePizza
from Pizza p
where p.Nome=@nomePizza

update Pizza set Prezzo=@nuovoPrezzo where CodicePizza=@idPizza
go
execute AggiornamentoPrezzoPizza 'Porcini', 9

--Eliminazine ingrediente da pizza (nome pizza , nome ingrediente)
create procedure EliminaIngredientePizza
@nomePizza varchar(30),
@nomeIngrediente varchar(30)
as
declare @idPizza int
select @idPizza=p.CodicePizza
from Pizza p
where p.Nome=@nomePizza

declare @idIngrediente int
select @idIngrediente=i.CodiceIngrediente
from Ingrediente i
where i.Nome=@nomeIngrediente

delete from PizzaIngrediente 
where CodicePizza=@idPizza and CodiceIngrediente=@idIngrediente
go
execute EliminaIngredientePizza 'Margherita', 'Mozzarella'

--Incremento 10% prezzo pizza con quell'ingrediente ingrediente (paramentro nome ingrediente)
create procedure IncrementoPrezzoPizzaConIngredienteSpecifico
@nomeIngrediente varchar (30)
as
declare @idIngrediente int
select @idIngrediente=i.CodiceIngrediente
from Ingrediente i
where i.Nome=@nomeIngrediente

declare @idPizza int
select @idPizza=pizing.CodicePizza
from PizzaIngrediente pizing
where pizing.CodiceIngrediente=@idIngrediente

update Pizza set Prezzo+=(Prezzo/100*10)
from Pizza p join PizzaIngrediente pizing on p.CodicePizza=pizing.CodicePizza
where pizing.CodiceIngrediente=@idIngrediente

execute IncrementoPrezzoPizzaConIngredienteSpecifico 'Mozzarella'

--FUNCTION
--1. Tabella listino pizze (nome,prezzo) (parametri nessuno)
create function ListinoPizza ()
returns table
as 
return
select p.CodicePizza, p.Nome, p.Prezzo
from Pizza p

select * from ListinoPizza()

--2. ListinoPizza (nome prezzo) contenenti un ingrediente(parametri: nome ingrediente)
create function ListinoPizzaIngrediente (@nomeIngrediente varchar(30))
returns table
as 
return
select p.CodicePizza, p.Nome, p.Prezzo
from Pizza p join PizzaIngrediente pizing on p.CodicePizza=pizing.CodicePizza
where pizing.CodiceIngrediente=(select i.CodiceIngrediente
                                from Ingrediente i 
                                where i.nome=@nomeIngrediente)

select * from ListinoPizzaIngrediente ('Cotto')

--3. ListinoPizza (nome prezzo) che non contengono un certo ingrediente(parametri: nome ingrediente)
create function ListinoPizzaSenzaIngrediente (@nomeIngrediente varchar(30))
returns table 
as 
return
select p.Nome, p.Prezzo
from Pizza p
where p.CodicePizza not in (select p.CodicePizza
                            from Pizza p join PizzaIngrediente pizing on p.CodicePizza=pizing.CodicePizza
							join Ingrediente i on pizing.CodiceIngrediente=i.CodiceIngrediente
					        where i.Nome=@nomeIngrediente)

select * from ListinoPizzaSenzaIngrediente ('Porcini')			 
					
--4. Calcola numero pizze contenenti un ingrediente (parametri: nome pizza)
create function CalcoloNumPizzeConIngrediente(@nomePizza varchar(30))
returns int
as 
begin
declare @numeroPizze intselect @numeroPizze = count(*)from Pizza p join PizzaIngrediente pizing on p.CodicePizza=pizing.CodicePizza
where pizing.CodiceIngrediente = (select i.CodiceIngrediente
                               from Ingrediente i
                               where i.Nome =@nomePizza)
return @numeroPizzeend
