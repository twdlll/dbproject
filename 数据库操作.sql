use Test;
go
create table managers
(����ԱId char(6) primary key,
����Ա���� char(10) not null,
����Ա���� char(20) not null)
go
create table customers
(���Id char(13) primary key,
������� char(10) not null,
����Ա� char(2) not null check(����Ա� in('��','Ů')),
��ҵ绰 char(11) not null,
������� char(20) not null,
��ҵ�ַ char(40) not null,
�Ƿ�ɼ� char(2) not null check(�Ƿ�ɼ� in('��','��')));
go
--drop trigger trigger_customer
go
create trigger trigger_���Id
on customers
for insert
as
begin
 declare @count varchar(20)
 set @count=(select ���Id from inserted) 
 if(len(@count)<>13 and left(@count,1)<>'c')
 rollback transaction
end
go
create view customers_view
as
select ���Id,�������,����Ա�,��ҵ绰,�������,��ҵ�ַ
from customers
where �Ƿ�ɼ�='��'
with check option
go
create table stores
(�̼�Id char(13) primary key,
�̼����� char(10) not null,
�̼��Ա� char(2) not null check(�̼��Ա� in('��','Ů')),
�̼ҵ绰 char(11) not null,
�̼����� char(20) not null,
�̼ҵ�ַ char(40) not null,
���� char(20) not null,
�Ƿ�ɼ� char(2) not null check(�Ƿ�ɼ� in('��','��')));
go
create view stores_view
as
select �̼�Id,�̼�����,�̼��Ա�,�̼ҵ绰,�̼�����,�̼ҵ�ַ,����
from stores
where �Ƿ�ɼ�='��'
with check option
go
create trigger trigger_�̼�Id
on stores
for insert
as
begin
 declare @count varchar(20)
 set @count=(select �̼�Id from inserted) 
 if(len(@count)<>13 and left(@count,1)<>'s')
 rollback transaction
end
go
create table food
(ʳƷ�� char(13) primary key,
ʳƷ�� char(20) not null,
�̼�Id char(13) not null,
ʳƷ���� char(4) not null check(ʳƷ���� in('��ʳ','��ʳ','С��','����')),
���� int not null,
ʳƷ���� char(50) not null,
�Ƿ�ɼ� char(2) not null check(�Ƿ�ɼ� in('��','��')));
go
alter table food
add
constraint fk_�̼�Id_food
foreign key(�̼�Id) references stores(�̼�Id)
go
create trigger trigger_ʳƷ��
on food
for insert
as
begin
 declare @count varchar(20)
 set @count=(select ʳƷ�� from inserted) 
 if(len(@count)<>13 and left(@count,1)<>'f')
 rollback transaction
end
go
create view food_view
as
select ʳƷ��,ʳƷ��,�̼�Id,ʳƷ����,����,ʳƷ����
from food
where �Ƿ�ɼ�='��'
with check option
go
create table orders
(������ char(16) primary key,
���Id char(13) not null,
�̼�Id char(13) not null,
ʳƷ�� char(13) not null,
�������� int not null,
����ʱ�� char(16) not null,
�ܼ� int not null,
�Ƿ����� char(2) not null check(�Ƿ����� in('��','��')),
�Ƿ���� char(2) not null check(�Ƿ���� in('��','��')));
go
create trigger trigger_������
on orders
for insert
as
begin
 declare @count varchar(20)
 set @count=(select ������ from inserted) 
 if(len(@count)<>16 and left(@count,1)<>'o')
 rollback transaction
end
go
alter table orders
add
constraint fk_�̼�Id_orders
foreign key(�̼�Id) references stores(�̼�Id)
go
alter table orders
add
constraint fk_ʳƷ��_orders
foreign key(ʳƷ��) references food(ʳƷ��)
go
alter table orders
add
constraint fk_���Id_orders
foreign key(���Id) references customers(���Id)
go
--create unique nonclustered index Idx_customer_orders
--on orders(���Id)
--with
--fillfactor=30;
go
create view create_orders_view
as
select ������,���Id,�̼�Id,ʳƷ��,��������,����ʱ��,�ܼ�
from orders
with check option
go
create default default_order_state as '��'
go
exec sp_bindefault default_order_state,'orders.�Ƿ�����'
go
exec sp_bindefault default_order_state,'orders.�Ƿ����'
go
create default default_other_state as '��'
go
exec sp_bindefault default_other_state,'stores.�Ƿ�ɼ�'
go
exec sp_bindefault default_other_state,'customers.�Ƿ�ɼ�'
go
exec sp_bindefault default_other_state,'food.�Ƿ�ɼ�'
go

--**************************************************











--*************************************************************
select * from managers
go
select * from stores;
go
select * from food;
go
select * from food_view
go
select * from customers;
go
select * from customers_view
go
select * from stores_view
go
select * from orders;
go
