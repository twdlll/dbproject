use Test;
go
create table managers
(管理员Id char(6) primary key,
管理员姓名 char(10) not null,
管理员密码 char(20) not null)
go
create table customers
(买家Id char(13) primary key,
买家姓名 char(10) not null,
买家性别 char(2) not null check(买家性别 in('男','女')),
买家电话 char(11) not null,
买家密码 char(20) not null,
买家地址 char(40) not null,
是否可见 char(2) not null check(是否可见 in('是','否')));
go
--drop trigger trigger_customer
go
create trigger trigger_买家Id
on customers
for insert
as
begin
 declare @count varchar(20)
 set @count=(select 买家Id from inserted) 
 if(len(@count)<>13 and left(@count,1)<>'c')
 rollback transaction
end
go
create view customers_view
as
select 买家Id,买家姓名,买家性别,买家电话,买家密码,买家地址
from customers
where 是否可见='是'
with check option
go
create table stores
(商家Id char(13) primary key,
商家姓名 char(10) not null,
商家性别 char(2) not null check(商家性别 in('男','女')),
商家电话 char(11) not null,
商家密码 char(20) not null,
商家地址 char(40) not null,
店名 char(20) not null,
是否可见 char(2) not null check(是否可见 in('是','否')));
go
create view stores_view
as
select 商家Id,商家姓名,商家性别,商家电话,商家密码,商家地址,店名
from stores
where 是否可见='是'
with check option
go
create trigger trigger_商家Id
on stores
for insert
as
begin
 declare @count varchar(20)
 set @count=(select 商家Id from inserted) 
 if(len(@count)<>13 and left(@count,1)<>'s')
 rollback transaction
end
go
create table food
(食品号 char(13) primary key,
食品名 char(20) not null,
商家Id char(13) not null,
食品分类 char(4) not null check(食品分类 in('面食','饭食','小吃','其他')),
单价 int not null,
食品介绍 char(50) not null,
是否可见 char(2) not null check(是否可见 in('是','否')));
go
alter table food
add
constraint fk_商家Id_food
foreign key(商家Id) references stores(商家Id)
go
create trigger trigger_食品号
on food
for insert
as
begin
 declare @count varchar(20)
 set @count=(select 食品号 from inserted) 
 if(len(@count)<>13 and left(@count,1)<>'f')
 rollback transaction
end
go
create view food_view
as
select 食品号,食品名,商家Id,食品分类,单价,食品介绍
from food
where 是否可见='是'
with check option
go
create table orders
(订单号 char(16) primary key,
买家Id char(13) not null,
商家Id char(13) not null,
食品号 char(13) not null,
订购数量 int not null,
生成时间 char(16) not null,
总价 int not null,
是否派送 char(2) not null check(是否派送 in('是','否')),
是否完成 char(2) not null check(是否完成 in('是','否')));
go
create trigger trigger_订单号
on orders
for insert
as
begin
 declare @count varchar(20)
 set @count=(select 订单号 from inserted) 
 if(len(@count)<>16 and left(@count,1)<>'o')
 rollback transaction
end
go
alter table orders
add
constraint fk_商家Id_orders
foreign key(商家Id) references stores(商家Id)
go
alter table orders
add
constraint fk_食品号_orders
foreign key(食品号) references food(食品号)
go
alter table orders
add
constraint fk_买家Id_orders
foreign key(买家Id) references customers(买家Id)
go
--create unique nonclustered index Idx_customer_orders
--on orders(买家Id)
--with
--fillfactor=30;
go
create view create_orders_view
as
select 订单号,买家Id,商家Id,食品号,订购数量,生成时间,总价
from orders
with check option
go
create default default_order_state as '否'
go
exec sp_bindefault default_order_state,'orders.是否派送'
go
exec sp_bindefault default_order_state,'orders.是否完成'
go
create default default_other_state as '是'
go
exec sp_bindefault default_other_state,'stores.是否可见'
go
exec sp_bindefault default_other_state,'customers.是否可见'
go
exec sp_bindefault default_other_state,'food.是否可见'
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
