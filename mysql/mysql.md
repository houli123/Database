 Mysql

[toc]

#   sql基础书写规则和种类

## 种类

1. DDL：数据定义语言（针对数据库和表的操作）
   1. create
   2. drop
   3. alter--只针对表
2. DML：数据操作语言（针对于表内部）
   1. select
   2. insert
   3. update
   4. delete
3. DCL：数据控制语言（针对用户和数据进行的更改）
   1. commit
   2. rollback
   3. grant
   4. revoke

## 书写规则

1. 以分号（;）结尾

2. 且不区分大小写，但为了规范化，须用大小写

3. 单词用空格分隔

   > 一个;叫做一行，这一条用于查询错误

## 注释规则

1. 行注释：'-- '，**两个'-'加个空格' '**

   eg：代码--注释内容

2. 多行注释：/* 内容 */

## 启动

1. 直接在网址输入http://localhost:8080 或 http://localhost:8080/phpMyAdmin/

   > 要求用的是phpMyAdmin的mysql图形化管理工具

2. 打开“MySQL Command Line Client”

3. cmd中输入mysql -uroot -p

> exit、quit用于退出mysql
>
> 启动|停止mysql服务器：net start|stop mysql

- mysql图形化管理工具
  - *A、*[phpMyAdmin](javascript:void(0))
  - *B、*[SQLyog](javascript:void(0))
  - *C、*[MySQL Workbench](javascript:void(0))
  - *D、*[Navicat](javascript:void(0))

# DDL

**(create,drop alter)**

## 数据类型

- Mysql 的数据类型一般分为以下 5 种，分别是整数类型、浮点数类型和定点数类型、日期和时间类型、字符串类型、二进制类型等，整数类型和浮点数类型可以统称为数值数据类 型

- 整型类型：tinyint,smallint,mediumint,**int**(integhr),bigint

- 浮点和定点数类型：**float**,double,decimal(m,d),dec

- 日期时间型：year,time,**date**,datetime,timestamp

  > date数据的形式会是'2022-04-23'的形式

- 字符串类型：**char(),varchar()----var指vary**

  tinytext,text,mediumtext,longtext,enum,set

  > 没有var类型
  >
  > **oracle里是varchar2**
  >
  > text适合存储文章内容或评论

- 二进制类型：bit(),binary(),varbinary(),varbinary(),tinyblob(),blob(),mediumblob(),longblob()

- 布尔类型：

  boolean

  > 实际是tinyint（1），用0表示false，1表示true

## 数据库的操作

###  use

- 进入某个表中：**use <表名>;**

  ``` mysql
  use lib;
  ```
  
  > 与oracle不同 的是，要先进入表中才能查看访问表

###  show

- 显示数据库或表：show <**表名、数据库名**(两者都要复数形式)>;

  ``` sql 
  show tables/databases;
  ```
  
  > **oralce不能这样做，查看所有表是select * from cat|tab;**

###  create

- 创建数据库

  1. **命名规则：**

     1. **必须以英文字母开头**
     2. **只能使用英文字母，数字，下划线（_)**
     3. **不能重复名称**

  2. 语法：

     ​	CREATE { DATABASE | SCHEMA} [ IF NOT EXISTS ] db_name

     [ [ DEFAULT ] CHARACTER SET [ = ] charset_name ]
     
     [ [ DEFAULT ] COLLATE [ = ] collation_name ];
     
     ``` mysql
     create database if not exists xk
     default character set=utf-8
     default collate = utf8_general_ci;
     ```
###  drop

- 删除数据库：drop database [if exists] <数据库名>;

  ``` mysql
  drop database if exists lib;
  ```


## 表的操作

###  use

- 进入某个表中：use <表名>

  ``` mysql
  use lib;
  ```


###  show

- 显示表或数据库

  1. show <表名、数据库名(两者都要复数形式)>

     ``` sql 
     show tables|databases;
     ```

  2. show create table <表名> [\g或\g];

     - **\g和\g：改变展示形式**

     ``` sql 
     show create table book;
     show create table book \g;
     show create table book \g;
     ```

  3. describe/desc <表名>

     ``` sql 
     describe book;
     desc book;
     ```


###  create

#### 创建表

1. **命名规则：**

   - **必须以英文字母开头**
   - **只能使用英文字母，数字，下划线（_)**
   - **不能重复名称**
   - **创建表必须要给表设置结构**

2. 语法项：

   create table [if not exists] 表名(

   列名1 数据类型1 [是否为空] [完整性约束条件1] [索引]，

   列名2 数据类型2 [是否为空] [完整性约束条件2] [索引]，

   列名3 数据类型3 [是否为空] [完整性约束条件3] [索引]

   [key] [key的名字] (key的标识符)    -- 若要指定的话

   [index] 

   [constraint] (选填key名) foreign key 本表中要设置外键的列

   references 父表名(父表的主键)

   [on delete {restrict | cascade | set null | no action}]

   [on update {restrict | cascade | set null | no action}]

   )[表引擎 表字符集];

   > 创建表的所有的集合，情况
   
   ``` mysql
   use lib;
   create table book_bk (
   --  列名1 数据类型1 [not null] [default] [primary key] [unique] [auto_increment]，
   	...
   --  [primary key (bookno),]	                   主键约束
   --  [unique (bookno),]                         唯一约束
   --  [check(gender in ('男','女')),]             检查约束
   --  [unique/fulltext] 
   --  [index id_name(字符1(短索引的大小),字符2...  ,]           创建普通、唯组合、全文、短索引
   --  [key fk_book_bookclass (classno),]    定义表的关键字
                                        
   /*	constraint 随便名字 unique (bookno),     创建唯一约束
   	constraint fk_book_bookclass foreign key (classno) references bookclass (classno)       定义外键
       [on delete/update cascade/no action/set null/default/set default/restrict]   实现部分触发器的功能
   */
   )engine=innodb default charset=utf8 auto_increment=500;	           -- 定义表的存储引擎和字符集
   ```

#### 复制表

- create table [if not exists] 新表名 

- [ like 参照表名 ] | [as (select 语句)];

  > 其中创建视图也是用的as

1. 使用 **like 关键字创建一个与已有的表相同结构的新表**，列名、数据类型、空指定和索引也将复制，但是表的内容不会复制，因此创建的新表是一个空表。

2. 使用 as 关键字可以复制表的内容，**但索引和完整性约束是不会复制的**。

   ``` mysql
   create table book_bk1 like book;
   create table book_bk2 as select * from book;
   ```

###  drop

- 删除表：删除表分两种情况

  1. 删除没有被关联的普通表

     - 直接使用 drop table 语句可以删除一个或多个数据表

     - 语法格式如下： drop table [if exists] 表名1 [ ,表名 2, 表名 3 ...] 

       ``` mysql
       drop table if exists book_bk;
       ```

     - 注意： 1用户必须拥有执行 drop table 命令的权限，否则数据表不会被删除。2表被删除时，用户在该表上的权限不会自动删除。

  2. 删除与其他表关联的表。 

     1. 先删除与它关联的子表，再删除父表；但是这样会同时删除两个表中的数据。

        - 不需要保留表的数据，则先删除 book 表，然后再删除 bookclass 表，在命令行窗口 中输入如下命令。 

          ```  mysql 
          drop table book; drop table bookclass;
          ```

     2. 将关联表的外键约束取消，再删除父表；适用于需要保留子表的数据，只删除父表 的情况。

        - 需要保留子表的数据，则先删除 book 表中的外键，然后再删除 bookclass 表。请注 意，在 Mysql 中删除外键其实是两个操作，一是删除外键，二是删除该外键所建的索引。 

        ```mysql
        alter table book drop foreign key fk_book_bookclass; -- 删外键
        alter table book drop index fk_book_bookclass; -- 删索引
        drop table bookclass;
        ```

### alter

在 Mysql 中可以使用 alter table 语句来改变原有表的结构，例如增加或删减列、更改原有列类型、重新命名列或表等。

- 语法格式如下： 

  ```mysql
  alter table <表名> [修改选项] 
  修改选项的语法格式如下：
  {add {[column] <列名> <类型> [after column|first]  |  [constraint con_name] [foreign key() references col_name() [on delete cascade|set null]] [primary key]...}
  change [column] <旧列名> <新列名> <新列类型> [约束]-- 必须指定数据类型
  -- 相当于换一个新的字段
  alter [column] <列名> { set default <默认值> | drop default } 
  modify [column] <列名> <类型> 
  drop [column] <列名> 
  rename to|as <新表名> 
  character set <字符集名> 
  auto_increment [=n]} 
  engine={ innodb | myisam | memoery }
  ```

- 例子：

  **注：字段指的是表的列**
  
  ```mysql
  alter table book rename booknew;-- 修改表名
  -- 也可以直接
  rename table book to booknew;
  
  alter table reader character set gb2312;-- 修改表字符集
  
  -- 1.开头增加新字段
  alter table reader add email varchar(100) first;
  
  -- 2.中间增加新字段
  alter table reader add email varchar(100) after phonenumber;
  
  -- 3.末尾增加新字段
  alter table reader add email varchar(100);
  
  -- 修改字段名,约束（要求必须指定新字段的数据类型)
  alter table reader change phonenumber cellphone varchar(12);
  alter table book_bk change column price price float not null;  -- column可以省略
  
  -- 修改字段数据类型）
  alter table reader modify readername varchar(20);
  
  -- 删除字段
  alter table reader drop email;
  
  -- 修改表的存储引擎（必须先将相关外键约束删除）
  alter table book drop foreign key fk_book_bookclass;
  alter table book drop index fk_book_bookclass;
  alter table borrow drop foreign key fk_borrow_book;
  alter table borrow drop index fk_borrow_book;
  alter table book engine=innodb;
  alter table book charset=utf8;
  ```
  

## Mysql的存储引擎

有：memory、myIsam、InnoDb、Mysql

> 知道myisam和innodb就好了

> 其中myisam不支持外键
>
> **InnoDb才支持外键和事务和全文检索**



# DML

**（select,insert,update,delete）**

##  select

###  select语句

- 语法格式（书写顺序）：

```mysql
select [all | distinct] 输出列表达式, ...   /*加distinct去重*/
/*select 聚合函数*/
[from <表名 1> [ , <表名 2>] …]/*as改变列名，可以放from或select里*/                                          /*from 子句*/
[where 条件]                                  /*where 子句*/
[group by {列名/表达式/列编号}[asc/desc]     /*group by 子句*/
[having 条件]                               /*having 子句*/
[order by {列名/表达式/列编号} desc] , ...] /*order by 子句*/
[limit {[偏移量,] 行数|行数 offset 偏移量}] /*limit 子句*/
select…是语句必须的，方括号里的子句是根据应用需要。
```

- **select语句的执行顺序：**

  **from -- where -- group by -- having -- select -- order by**

###  like（谓词）

- **'_'：表示单个字符**

- '%'：表示多个或零个字符

  ```mysql
  where readerno like '%01'
  					'_005'
  ```

###  where

- 比较运算：<>+-+和**不等于'<>'**等

- 模式匹配（like）：like

- 范围比较：

  - between xxx and xxx
  - in (xxx)
  - 加not

- 空值比较：is [not] null

- 多种查询条件：and，or，in

  **注：and的优先级高于or**

###  聚合函数：

- 有sum，min，max，count，average等

- sum和average不能用于字符串类型的数据，而max/min可以

- 注意区分参数的不同：

  count(*):包含null

  count(列名):不包含null

  只有count(*)这样的聚合函数包含null

###  关于null

- null与任何数进行计算都是null

  eg：null / 0 = null

  ​		null + 3 = null

- 不能=null的操作，只能is null

- 对含有null的列排序时，null会在最底部

###  group by

- group by语句中不能使用as别名
- 结果无序
- 聚合键的条件写在where里,若设置的条件是聚合函数时，只能使用having
- 若聚合键包含null，则结果也有null
- group by时，select里必须要有括号里的列

###  exist谓词

- 用于判断一个子查询是否返回了任何结果。如果子查询返回了至少一行数据，exist返回true；如果子查询没有返回任何数据，exist返回false。

- 位于where子句中，通常带个子查询且查询的是*

- **注意：使用的时候是exists 三单形式，加了s**

  ```mysql
  select *
  from book
  where exists (select * from bookclass where bookclass.classno=book.classno);
  
  -- 显示从未借过书的读者信息，要求显示读者号和姓名。
  select readerno, readername
  from reader
  where not exists (select readerno from borrow where borrow.readerno=reader.readerno);
  ```

- 在where子句中，我们使用exist来判断子查询是否返回了任何数据，如果返回了，则文章会被包含在结果集中。

- 总之，exist是Mysql中用于判断子查询是否返回数据的关键字，可以用于过滤数据、查询是否存在等场景。

###  多表查询（联结）

#### 全连接（笛卡尔积）

- 一般没用

  ```mysql
  select *
  from reader,school;
  ```

#### 内连接

- 使用条件情况：两个表都包含相同的一列

- 连接方式1：在where 从句中进行连接条件

  > 主流

  ```mysql
  select readername,schoolname
  from reader,school
  where reader.schoolno=school.schoolno;
  -- 或
  select a.readername,b.schoolname
  from reader a,school b
  where a.schoolno=b.schoolno;
  ```

- 连接方式2：在**from 从句中进行join连接某表，条件设置为on**

  - 注：**on必须在from 和 where 之间**
  - from 某表 [inner] join 零一表 on 连接条件

  > 原始连接伐，和外连接相似，要记住
  
  ```mysql
  select readername,schoolname
  from reader 
  inner join school -- inner可以省略
  on reader.schoolno=school.schoolno
  where gender='男';
  -- 或连接两个表的情况，此时，把中间的表作为from的表
  select readername,schoolname,borrowno
  from reader 
  join school
  on reader.schoolno=school.schoolno
  join borrow
  on reader.readerno=borrow.readerno
  where gender='男';
  ```

#### 自连接

- 利用as，将一根表与它自身进行连接，成为自连接

  ```mysql
  select a.bookname, a.author, a.publishname
  from book as a, book as b  -- 来自两个一样的表，但是给它命两个名
  where a.author=b.author and a.publishname<>b.publishname;
  ```

#### 外连接

- 使用外连接里有主表和非主表，有左连接和右连接

  - 主表里一般会有非主表里没有的东西，也就是说，主表大于非主表，或非主表包含于主表
  - 使用左连接时，主表放左侧
  - 使用右连接时，主表放右侧
  - **使用外连接时，如有内连接，先内连接后外连接**
  
  > **外连接就是将非主表与主表相同的数据正常显示，然后再将主表的数据除掉非主表的数据加上去，这些数据全是null。**左外连接将左边的表格作为基础表格，并将右边的表格中没有匹配到的数据也包含在结果中；右外连接则是将右边的表格作为基础表格，并将左边的表格中没有匹配到的数据也包含在结果中。
  >
  > **左外连接：显示所有左表的记录和匹配的右表记录，未匹配的右表记录显示为null。右外连接：显示所有右表的记录和匹配的左表记录，未匹配的左表记录显示为null。**
  
  ```mysql
  select bookname,readerno
  from book left outer join borrow  
  -- 此时book表有borrow表中没有的数据，也就是book表中有没有借过书的数据，这些数据显示为null
  on book.bookno=borrow.bookno;
  或
  select bookname,readerno
  from borrow right outer join book
  on book.bookno=borrow.bookno;
  
  -- 和
  select reader.readerno,borrow.bookno
  from borrow right outer join reader on  
  -- 此时reader表有borrow表中没有的数据，也就是reader表中有没有借过书的读者，这些数据显示为null
  reader.readerno=borrow.readerno;
  
  -- 还可以，一个外连接，一个内连接
  select book.bookno,reader.readerno,bookname  
  -- select中要设置主表.   不要让非主表的.   不然可能会有数据没有的
  from borrow 
  inner join reader on
  reader.readerno=borrow.readerno
  right outer join book on  -- outer也可以省略
  book.bookno=borrow.bookno
  order by bookno;
  ```

#### union

**(并集，表的加法，其结果是第二个表的内容直接加到第一个表下面)**

- 自动去重

- 列数必须相同且列的类型要一致

- order by只能使用一次

  ```mysql
  select bookname
  from book
  union
  select readername
  from reader
  ```

- 不去重：union 后加个 all

  ```mysql
  select bookname
  from book
  union all
  select readername
  from reader
  ```

###  子查询

> 子查询的返回结果：
>
> - 一个表
> - 一个值
> - 一列数据

#### 普通子查询：

- 指的是返回多行数据的查询

- 把where的条件换成一个select查询语句

```mysql
select bookname, price
from book
where price > (select avg(price) from book);-- 这里用了子查询
```

- 注意：此种情况下不能用=和<>，只能用in，否则会报错：

  ```mysql
  subquery returns more than 1 row
  子查询返回多于一行
  ```

#### 标量子查询

- 指的是只能返回一行一列的数据
- 如何做到？
  - 用聚合函数，这样返回的结果只有一行
- 有什么用？
  - **在此等此种情况下它的返回值可以用=或者<>**

### 10. 流程控制函数

1. if 判断，流程控制，语法结构如下：

   **注：这个是写在select的列里，对其中一个列进行相应的判断**

   ```mysql
   if(expr,v1,v2)-- 当expr为真是返回v1的值，否则返回v2。
   select readername 姓名,if(gender='女',0,1) 性别 from reader limit 10;  -- 在第三列性别中进行判断，把他的值边为后面的结果
   
   ifnull(字符v1,v2);
   -- 其中：如果 字符v1 不为 null，则 ifnull 函数返回 字符v1; 否则返回 v2 的结果。
   ```
   
2. case 搜索判断语句，语法如下：

   **Mysql不允许在 then 或 else 子句中使用空的命令。**

   case和if都会写在设置条件的列上

   ```mysql
   case
       when <条件1> then <命令>
       else <命令>
   end case;
   -------------------------------------
   select bookno 书号,bookname 书名,
     case 
       when number=0 then '零本'
       when number=1 then '孤本'
       when number>1 and number<6 then '少量' 
       else '大量'
     end as 数量
   from book limit 10;  
   ```

## insert

- 语法

列名 1~n 和值 1~n 的顺序要一一对应。

**注：value要用三单values**

**insert可以不带into，但delete要带from**

```mysql
insert into <表名> (列名 1, 列名 2,…, 列名 n) values (值 1, 值 2,…,值 n);
```

- 实例

```mysql
-- 插入多行数据
insert school_bk1 (schoolno, schoolname)
values
('s001', '人工智能学院'),
('s002', '电子通信学院'),
('s003', '机电工程学院'),
('s004', '计算机学院');

-- insert语句中不指定具体的字段名
insert into school
values ('s017','师范学院');

-- 为指定列插入数据
insert into school(schoolno, schoolname)
values ('s017','师范学院');

-- 插入null
insert into school(schoolno, schoolname)
values ('s017',null);  -- 要求schoolname不能设置not null

-- 通过显示方式插入默认值
insert into school(schoolno, schoolname)
values ('s017',default);-- 该默认值来自表结构的设置

-- 通过隐形方式插入默认值
insert into school(schoolno)
values ('s017'); -- 省略要使用默认值的行和列

-- 从其他表中复制数据
insert into school(schoolno, schoolname)
select *
from school
where schoolno='001';
```

## update

> update就是先delete后insert

- 语法

```mysql
update <表名> set 字段 1=值 1 [,字段 2=值 2… ] [where 子句 ]
[order by 子句]
[limit 子句]
```

- 实例

```mysql
-- 按本表中的条件修改表中数据
update school
set schoolname='化生学院'
where schoolno='s007';

--  按内连接修改表中数据
update reader, school
set effectdate='2019-04-28 00:00:00'
where reader.schoolno=school.schoolno
and schoolname='人工智能学院';
或
update reader
set losteffectdate='2022-04-27 00:00:00'
where schoolno=(select schoolno from school where schoolname='人工智能学院');

-- 使用null进行更新
update school
set schoolname=null  -- 不能not null
where schoolno='s007';

-- 多列更新
update book
set bookname='化生学院',
	onshelf='否'
where bookno='b001';
```

## delete

- 语法


```mysql
delete from <表名> [where 子句] [order by 子句]
[limit子句]
truncate [table] table_name;
```

> **from不能省去**

- drop和delete区别

```mysql
drop table 语句可以将表完全删除
delete 语句会留下表（容器），而删除表中的全部数据
```

delete 语句的删除对象并不是表或者列，而是记录（行）

- 实例

```mysql
 -- 按本表中的条件删除表中数据
delete from school
where schoolname='人工智能学院';
-- 注：如果删除表的内容涉及和其他表关联，那必须要先删除子表才能删除父表

-- 按其他表中条件删除表中数据
删除读者表中属于“人工智能学院”的读者信息。
-- 1.须先删除子表
delete borrow
from reader,school,borrow
where reader.schoolno=school.schoolno
and reader.readerno=borrow.readerno 
and schoolname='人工智能学院';
-- 1.须先删除子表
delete from borrow
where readerno in  -- 用in因为这不是标量子查询，返回的是多行结果
(select readerno 
 from school ,reader
where schoolname='人工智能学院'
and school.schoolno=reader.schoolno);
-- 1.须先删除子表
delete from borrow
where readerno in 
(select readerno 
from reader
where schoolno = (select schoolno from school where schoolname='人工智能学院')
);


-- 2.再删除父表
delete reader
from reader, school
where reader.schoolno=school.schoolno
and schoolname='人工智能学院';
```

## 注意区分DDL和DML的语法规则

1. DDL（show,create,drop alter)

   基本结构都是

   ```mysql
   (DDL的语句) table/database <表名/数据库名> -- [若是alter，才有这之后的内容]
   -- 注：中间就是table和database，不是名字
   ```

2. DML(select,insert,updatedelete)

   基本结构就是

   ```mysql
   (DML语句) <表名> [相应的操作]
   insert (into) <表名> (列名1,2) values (值1，值2),(值3,值4)
   update <表名> set 列名='' [where条件]
   delete from <表名> [where条件]
   ```



# 数据建模

## 概念

###  数据建模概念

- 数据建模是指根据用户的实体模型需求，**设计出概念模型**，此阶段为逻辑结构设计阶段。 e-r 模型表示的概念结构模型独立于任何一种数据模型，并独立于任何一个具体的数据库管理系统。 概念结构设计阶段设计的 e-r 模型将转换为关系数据模型二维表结构。
- 数据建模后，就 可以在某一具体的数据库管理系统上，设计出数据库以及表的结构和建立真实可用的数据库和表。

![01](img/01.png)

> 数据库设计过程：需求收集和分析、概念设计、逻辑设计、物理设计

###  关系模型概述

- 关系模型是目前数据库系统普遍采用的数据模型，也是应用最广泛的数据模型。**关系模型通过二维表表示实体以及实体之间的联系**。**二维表并不一定是关系模型**，只有具备下列特 点的二维表才是关系模型： 
- （1）表格中的**每一列都是不可再分**的基本数据项； 
- （2）**列和列之间的名字不同**，每一列的数据类型相同或者兼容
- （3）行和行的**顺序无关**，列和列的顺序也无关
- （4）**关系中不能存在完全相同的两行**

> 二维表来表示实体间的联系

###  实体模型

- 实体是现实世界中存在的并可相互区别的事物或概念。实体模型对应的是“现实世界”
-  实体可以是具体的人、事和物，也可以是抽象的概念或联系，其中的一个具体事物称为 实例。这些事物的集合称为事物类，是由具有相似类型的事物，具有共同的性质。如图书馆 管理系统中的“书籍”是一个事务类；“读者”也是一个事务类。除此之外，还有业务活动， 例如书籍和读者之间发生“借阅”现象
- 一个事物可以拥有多种特性来形容自己。如“书籍”，具有书名、作者、出版社等共同 的性质；“读者”，具有姓名、性别、电话等共同的性质 
- 此阶段是分析项目涉及的业务活动和数据的使用情况，弄清所用数据的种类、范围、数 量以及在业务活动中的存储情况，确定用户对数据库系统的使用要求和各种约束条件等

###  概念模型

- 概念模型是现实世界在人们头脑中的反映，是对客观事物及其联系的一种抽象描述，从 而产生概念模型。概念模型对应的是“信息世界”，是按用户的观点对数据库建模

- 概念模型是现实世界到数据世界必然经过的中间层次，使用相关信息化概念和技术对现 实世界进行抽象；抽象的结果可立即转化为相应的数据模型，在具体的计算机系统上进行实施部署。

  > 所谓概念模型，就是**现实世界到机器世界的一个中间层次，即信息世界**

- 在概念模型下，有如下术语： 
  - **实体**（entity）：是现实世界中的一个对象或概念，如图书馆管理系统中的书籍和读者 等。
  
  >  但是姓名不能称为实体？？
  
  - 属性（attribute）：是进一步描述实体的某个具体性质，例如书籍的书名、作者等。如 果某个属性或者属性组合的值能唯一地标识出实体集中一行，则可以选择该属性或者属性组 合作为实体标识符。 
  - 联系（relationship）：表示实体之间存在的相互作用，例如表示书籍实体与读者实体 之间读者借阅的联系。 
  - 具有相同属性的实体的集合称为实体集。在同一实体集中，每个实体的属性及其值域是 相同的，但可能取不同的值。

###  数据模型

- 数据模型是数据特征的抽象，描述了系统的静态特征、动态行为和约束条件，为数据库 系统的信息表示与操作提供了一个抽象的框架。
-  数据模型对应的是“数据世界”。数据模型，按计算机系统的观点对数据建模。常见的 数据模型种类有网状模型、层次模型、关系模型和面向对象数据模型。 
- 数据模型的文件、记录和数据项，是数据库系统真实保存数据的方式。分别对应着概念 模型的实体集、实体和属性。 
- 数据模型三要素：**数据结构、数据操作和完整性约束**。 
- 数据结构：用于描述系统的静态特征。 
- 数据操作：指对数据库中数据允许执行的操作的集合，用语言描述系统的动态特征。数 据模型必须定义操作的确切含义、操作符号、操作规则以及实现操作的方法。 
- 完整性约束：是完整性规则的集合，指给定的数据模型中数据及其联系所具有的制约和 依存规则

###  关系模型

- 关系模型是应用最广的数据模型，是用一组关系来描述数据库。通俗地说，关系就是一 张表格，用“二维表”来表示数据之间的联系。 

- 关系数据库是将数据表示为表的集合，通过建立简单表之间的联系来定义结构的一种数 据库。 

- 关系模型术语： 
  - 关系（relation），数据库可以由多个表组成，表与表之间可以以不同的方式相互关联。 
  
    > **在关系模型中，关系指的是矩形，即实体**
  
  - 元组（tuple），表中的行称为元组。一行是一个元组，对应存储文件中的一个记录值。 
  
  - 属性（attribute），表中的列称为属性，每一列有一个属性名。 
  
  - **域（domain），表中的垂直列**，也称为属性。属性的取值范围，即不同元组对同一属性 的取值所限定的范围,称为域的规格。 
  
  - 分量：元组的某个属性值。在一个关系数据库中，它是一个操作原子，即关系数据库在 做任何操作的时候，属性是“不可分的”。 
  
  - 码：表中可以唯一确定一个元组的某个属性（或者属性组），如果这样的码有不止一个， 都叫候选码，从候选码中挑一个出来做主属性，它就叫主码。 
  
  - 全码：如果一个码包含了所有的属性，这个码就是全码。 
  
  - 主属性：一个属性只要在任何一个候选码中出现过，这个属性就是主属性。 
  
  - 非主属性：与上面相反，没有在任何候选码中出现过，这个属性就是非主属性。 
  
  - 外码：一个属性（或属性组），它不是码，但是它别的表的码，它就是外码。 
  
  - 关系模式（relation schema）：对关系的描述，记为 r(a1，a2，...， an)，是由关系 名和一组属性构成。 
  
- 关系数据库术语：
  - 表（table），是一种按行与列排列的相关信息的逻辑组，类似于工作单表。
  - **字段（field），数据库表中的每一列称作一个字段。**表是由其包含的各种字段定义的， 每个字段描述了它所含有的数据。创建一个数据库时，须为每个字段分配一个数据类型、最 大长度和其它属性。字段可包含各种字符、数字甚至图形。
  - 记录（record），各个有关的信息存放在表的行，被称为记录。一般来说，数据库表创 建时任意两个记录都不能相同。
  - 数据库（database），多个相关联的数据表的集合

### 数据字典

​	数据字典（data dictionary）是描述数据的信息集合，是对系统中使用的所有数据元素的定义的集合。数据字典有利于将定义的数据结构等信息在程序员和其他需要参考的人之间共享。通过数据建模产生E-R图，对每个数据对象给出描述性名字，并对关系也进行描述，然后描述数据的类型（例如文本还是图像，或者是二进制数值），列出所有可能预先定义的数值，并提供简单的文字性描述。这样的集合被组织成特定的形式作为，就叫做数据字典。



​	数据字典通常包括：

- （l）[数据项](https://www.zhihu.com/search?q=数据项&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={"sourceType"%3A"answer"%2C"sourceId"%3A1344488826})；
- （2）[数据结构](https://www.zhihu.com/search?q=数据结构&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={"sourceType"%3A"answer"%2C"sourceId"%3A1344488826})；
- （3）[数据流](https://www.zhihu.com/search?q=数据流&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={"sourceType"%3A"answer"%2C"sourceId"%3A1344488826})；
- （4）数据存储；
- （5）处理过程五个部分。

其中数据项是数据的最小组成单位，若干个数据项可以组成一个数据结构。数据字典通过对数据项和数据结构的定义来描述数据流和数据存储的逻辑内容。

## 实体联系（e-r）图

- （1）<u>矩形</u>：表示**实体**，矩形内要标注实体的名称； 

  > **关系模型中，关系就是这里的矩形（实体）**

- （2）<u>菱形</u>：表示**实体之间的联系**，菱形内标注联系的名称； 

- （3）<u>椭圆</u>：表示实体和联系所具有的属性，椭圆内标注属性的名称。如果属性较多， 也可以将实体与其相应的属性另外单独用列表表示。 

- （4）<u>连线</u>：用来连接实体与实体所具有的属性、联系与联系所具有的属性，以及实体 与联系。连线上要标出联系类型。

## 依赖关系

###  函数依赖

指的是一个属性或属性组决定了另一个属性或属性组的取值，这个决定关系就是函数依赖。例如，如果关系模式r（a，b，c）中**a→b，那么b的值由a的值<!--唯一决定-->**。

###  函数传递依赖

指在一个关系模式中，如果存在非主属性与主属性之间的依赖，就称为函数传递依赖。简单来说，如果关系模式r（a，b，c）中**a→b，b→c**，**<!--那么c的值由a的值唯一决定-->**，就存在函数传递依赖。

## 范式定义

###  第一范式(1nf)

第一范式是指在关系模型中，数据库表的每一列都是不可分割的原子数据项。简而言之，第一范式就是无重复的原子域。

###  第二范式(2nf)

- **本质：一山不容二虎，只允许存在一个主键**

- 候选键：半个主键

- 候选键 >= 主键

- 候选键是指能够唯一标识表中每条记录的一个或多个属性组合，**每个表可以有多个候选键，但最终只能选择一个作为主键**。

- 第二范式在满足第一范式的基础上，要求关系中的**每个非主属性完全依赖于候选键**，即每个非主属性都必须完全依赖于候选键，而不能依赖于候选键的局部子集，此时第二范式中**<!--除去主键的候选键不能存在函数传递依赖，而主键可以存在函数传递依赖-->**。

  ```mysql
  /* 例如
  "订单”关系，包含:
  	1订单号、订单日期、
  	2客户编号、客户名称、客户地址、客户电话、
  	3产品编号、产品名称、产品单价、产品数量等属性 */
  -- 其中订单号是主键，客户编号和产品编号是候选键
  从2看客户编号 能决定 （客户名称、客户地址、客户电话）
  -- 这就是每个非主属性完全依赖于候选键
  从3看产品编号 能决定 （产品名称、产品单价、产品数量）
  -- 这就是内部的内部不能存在函数传递依赖
  从1看订单号 能决定 客户编号和产品编号
  而这两个又能决定其他的关系
  -- 这就是主键能存在函数传递依赖，而除去主键的候选键不能存在函数传递依赖
  ```

  ```mysql
  读者（读者编号，读者姓名，读者性别，联系电话，学院编号，学院名称，生效日期，失效日期，违规情况，累借次数）
  -- 也是属于第二范式
  因为有读者编号--学员编号--学院名称 这个函数传递依赖
  
  书籍（图书编号，分类编号，图书分类，图书名称，作者，出版社，出版时间，简介，是否在架，剩余册数，单价）
  -- 也是属于第二范式
  ```


###  第三范式(3nf)

第三范式进一步要求在满足第二范式的基础上，消除非主属性对于其它非主属性的传递依赖关系，**即一个非主属性不能依赖于另一个非主属性（候选键），连主键都没有函数传递依赖**

```mysql
读者（读者编号，读者姓名，读者性别，联系电话，学院编号，生效日期，失效日期，违规情况，累借次数）
学院（学院编号，学院名称）
书籍（图书编号，分类编号，图书名称，作者，出版社，出版时间，简介，是否在架，剩余册数，单价）
图书分类（分类编号，图书分类）
-- 就是把主键存在函数依赖关系的候选键给提出来，和上面好好对比下
```

###  总结

- 第一范式（1nf）要求所有属性都是原子属性，即属性的不可分割性；
- 第二范式（2nf）要求属性完全依赖于主关键字，即主关键字和非主关键字之间不存在部分依赖关系；
- 第三范式（3nf）要求任何一个非主属性都依赖于主关键字，而不是依赖于其他非主属性。
- 第二范式和第三范式的区别：
  - 第二范式中在主键上能存在函数传递依赖，而在非主键的候选键中不存在函数传递依赖
  - 第三范式中全体关系都不存在函数传递依赖关系，即每个非主属性只能通过主属性获得，且大多数不存在候选键

### 反范式化

​	所谓**反范式化，是一种对范式化设计的数据库的性能优化策略，通过在表中增加冗余或重复的数据来提供数据库的读取性能。**

​	没有冗余的数据库不一定是最好的数据库，**有时为了提高查询效率，就必须降低范式标准，适当保留冗余数据**。比较典型的操作是在一个表中增加另一个表的冗余字段，通过减少两个表查询时的关联，从而提高查询效率。还有一种常用方式是增加派生字段，该字段的值通过从其他表中的数据计算生成，其作用是在查询时减少计算量，从而加快查询速度，特别是把数据量大的表中的数据计算后放到数据量小的表中以供查询，对提升性能的作用更加明显。常见的反规范化技术还包括重新组表（如果许多用户需要查看两个表连接出来的结果数据，则把这两个表重新组成一个表来减少连接从而提高性能）、分割表（包括水平分割、垂直分割）等。

​	反范式化设计本质上就是用空间来换取时间，把数据冗余在多个表中，当查询时可以减少或者是避免表之间的关联或计算。RDBMS模型设计过程中，常常使用范式约束关系模型，但在NOSQL模型中则通常大量采用反范式。

- 1）反范式化的优点
  - l 可以避免关联查询
  
  - l 可以设计更有效的索引
  
  - l 可以提高查询速度
  
- 2）反范式的缺点

存在数据冗余和数据维护异常

##  将 e-r 图转换为关系模型

###  一对一

**1：1**

（1:1）联系的 e-r 图转换：

- 方法一：各实体的之间的**联系单独**成立一个**关系**

  将参与联系的各表/实体集中的主键拿出来成立一个关系模式，其中它的主键可以是参与联系的任何一方的主键

  - bj（<u>班级编号</u>，院系，专业名，人数） 
  - bz（<u>学号</u>，姓名） 
  - sy（<u>学号</u>，班级编号）或（学号，<u>班级编号</u>）

- 方法二：联系不单独构成关系模式

  不建立新的关系模式，而直接将一方的主键直接加入另一方实体集

  - bj（<u>班级编号</u>，院系，专业名，人数） 
  - bz（<u>学号</u>，姓名，班级编号） 
  - 或者 
  - bj（<u>班级编号</u>，院系，专业名，人数，学号） 
  - bz（<u>学号</u>，姓名）

###  一对多

**1：n**

（1:n）联系的 e-r 图转换：

- 方法一：各实体的之间的**联系单独**成立一个**关系**

  将参与联系的各表/实体集中的主键拿出来成立一个关系模式，其中它的主键只能是**n方的主键**

  - bj（<u>班级编号</u>，院系，专业名，人数） 
  - xs (<u>学号</u>，姓名，专业名，性别，出生时间，总学分，备注) -- n方
  - sy（<u>学号</u>，班级编号）

- 方法二：联系不单独构成关系模式

  不建立新的关系模式，而直接将1主键直接加入n中，且主码是n方

  - bj（<u>班级编号</u>，院系，专业名，人数） 
  - xs (<u>学号</u>，姓名，专业名，性别，出生时间，总学分，备注，班级编号)
  
  > 如：宿舍和学生的关系

###  多对多

**n：m**

（m:n）联系的 e-r 图转换：

- **必须**单独对应一个关系模式，<!--该关系模式包括联系的属性、参与联系的各实体集的主码属性，该关系模式的-->主码由各实体集的**主码属性共同组成**。
  - xs(<u>学号</u>，姓名，专业名，性别，出生时间，总学分，备注)， 
  - kc（<u>课程号</u>，课程名称，类别，开课学期，学时，学分）， 
  - xs_kc (<u>学号，课程号</u>，成绩)。

**总结就是：将 e-r 图转换为关系模型----> 关系规范化**



# 数据完整性

> **数据完整性是指数据库中的数据在逻辑上的：**
>
> - 一致性
> - 正确性
> - 有效性
> - 相容性

## 概念

**概念及分类**

在Mysql中，约束是指对表中数据的一种约束，使用约束来限定表中的数据范围是很有必要的。

| 数据完整性分类   | 数据完整性实现方式                                  |
| ---------------- | --------------------------------------------------- |
| 实体完整性       | **主键约束primary key**                             |
| 域（列）完整性   | **唯一约束unique  默认值约束default  非空约束NULL** |
| 参照完整性       | **外键约束references**                              |
| 用户自定义完整性 | **检查约束check**                                   |

> **注：主键约束和唯一约束的区别：相似的地方，就是它们都能够确保列的唯一性。不同的地方，唯一约束可以为空，并且唯一约束在一个表中可以有多个**
>
> **以上6种约束中，一个数据表中只能有一个主键约束，其它约束可以有多个。**
>
> - 1、实体完整性
>
>   实体完整性是指关系中的主属性值**不能为Null且不能有相同值**，即定义表中的所有行具有唯一标识，一般用主键。
>
> - 2、域完整性
>
>   域完整性是对数据表中字段属性的约束，通常指数据的有效性，它包括字段的值域、字段的类型及字段的有效规则等约束，它是由确定关系结构时所定义的字段的属性决定的。通过限制数据类型、缺省值、自定义规则、是否可以为空等，域完整性可以确保不会输入无效值。
>
> - 3、参照完整性
>
>   参照完整性是对建立关联关系的数据表间数据参照引用的约束，也就是对外键的约束。准确地说，**参照完整性是指关系中的外键必须是另一个关系的主键有效值，或者是NULL**。参考完整性维护表间数据的有效性、完整性，通常通过建立外键联系另一表的主键实现。

## 主键约束

**（实体完整性）**

**主键本质上是一个排序，即索引。**

- 使用主键应注意以下几点：

  - 每个表只能定义一个主键。

  - 主键值必须唯一标识表中的每一行，且不能为null，即表中不可能存在有相同主键值的两行数据。这是唯一性原则。

  - 一个字段名只能在联合主键字段表中出现一次。

  - 联合主键不能包含不必要的多余字段。当把联合主键的某一字段删除后，如果剩下的字段构成的主键仍然满足唯一性原则，那么这个联合主键是不正确的。这是最小化原则。


- 创表设置

```mysql
-- 1.
create table school_bk (
 ...
 primary key (schoolno,schoolname)
) 
-- 2.
create table school_bk (
 schoolno char(4) not null primary key;
)
```

- 添加/删除表

```mysql
alter table bookclass_bk add primary key(classno);

alter table bookclass_bk drop primary key;
```

1. **自增长主键**

在Mysql中，当主键定义为自增长后，这个主键的值就不再需要用户输入数据了，而由数据库系统根据定义自动赋值。每增加一条记录，主键会自动以相同的步长进行增长。

- auto_increment关键字，可以在添加一条记录时，自动为该行添加数值，而且是自动增长的，一般被作为主键。通过给字段添加 auto_increment 属性来实现主键自增长。语法格式如下：

  ```mysql
  字段名 数据类型 auto_increment;
  ```

- 默认情况下，**auto_increment 的初始值是1**，每新增一条记录，字段值自动加1。

- **一个表中只能有一个字段使用auto_increment 约束**，**且该字段必须有唯一索引**，以避免序号重复（即为主键或主键的一部分）。

- **auto_increment约束的字段必须具备 not null 属性。**

- auto_increment约束的字段只能是整数类型（tinyint、smallint、int、bigint 等）。

- auto_increment约束字段的最大值受该字段的数据类型约束，如果达到上限，auto_increment就会失效。

```mysql
create table borrow (
borrowno int(11) not null auto_increment
)auto_increment=500;  -- 设置了自增长的初始值为500
```

## 外键约束

> **（参照完整性）**
>
> **外键约束**定义了表之间的关系，**能够保证数据的完整性和一致性**
>
> 在关系数据库中，外键是：在一个关系中的**一个或一组属性是另一个关系的主码**
>
> 外键约束也可以通过触发器来做

- 概念

  - 外键约束用于建立主键所在的表（主表）和外键所在的表（从表）之间的数据联系。可以将表中主键值的一列或多列添加到另一个表中创建两个表之间的连接。


  - 注意：从表的外键列名必须是主表的主键列名，且在删除主表时必须删除外键约束或者先删除从表的数据（记录），再删除主表的数据（记录）。

  - 一个表可以有一个或多个外键，外键可以为空值，若不为空值，则每一个外键的值必须等于主表中主键的某个值。


- 创表设置

  - **[constraint <外键名>] foreign key 字段名 [，字段名2，…]**

  - **references <主表名> 主键列1 [，主键列2，…]**


  - **[on delete {restrict | cascade | set null | no action}]**


  - **[on update {restrict | cascade | set null | no action}]**

> “on delete”和“on update”可以为每个外键定义指定动作。指定动作包含两部分， 第一部分指定这个指定动作由什么触发，是update或是delfte语句；第二部分指定接下来采取什么行动，例如restrict、cascade、set null、no action和set default。

  - restrict：当要删除或更新父表中被参照列上在外键出现的时候，拒绝对父表的删除或更新操作。

    > 若啥都没指定，则默认项时restrict


  - **cascade：从父表删除或更新行时，自动删除或更新子表中匹配的行。**

    > 当设置了cascade时，默认的restrict也就没了，也就不需要先把子表删了在动父表了


  - set null：当从父表删除或更新时，设置子表中与之对于的外键列为null。如果外键列没有指定not null限定，这就是合法的。


  - no action：意味着不采取动作，即如果有一个相关的外键值在被参考的表里，删除或更新父表中该值将不被允许，应用和restrict一样。


  - set default：作用和set null一样，只不过set default是指定子表中的外键列为默认值。如果没有指定动作，两个参照动作就会默认地使用restrict命令。


Mysql参照完整性约束目前**只可以用在那些使用innodb存储引擎创建的表中**，对于其他类型的表。Mysql服务器能够解析create table语句中的foreign key语法，但不能使用或保存它。

注意：从表的外键关联的必须是主表的主键，且主键和外键的数据类型必须一致。例如，两者都是int类型，或者都是char类型。如果不满足这样的要求，在创建从表时，就会出现错误。

```mysql 
create table reader_bk (
...
key fk_reader_bk_school (schoolno), 
constraint fk_reader_bk_school
foreign key (schoolno) 
references school (schoolno)
on delete cascade
on update cascade
)engine=innodb default charset=utf8;
```

- 添加和删除

```mysql
-- 添加
alter table <数据表名> add constraint <外键名>
foreign key(<列名>) references <主表名> (<列名>);
-- eg
alter table borrow add constraint fk_book_bookclass 
foreign key (bookno) references book(bookno) 
on update cascade;

-- 删除
alter table <表名> drop foreign key <外键约束名>;
-- eg
alter table book drop foreign key fk_book_bookclass;
alter table book drop index fk_book_bookclass;
```

## 唯一约束

> **（域完整性）**
>
> **创建唯一约束会自动创建唯一索引**

- 概念

  - unique约束，是对列的限制。因为有时一张表需要多个列唯一，而一张表又只能由一个主键，所以可以设置唯一约束来实现，一张表可以设置多个唯一约束。

  - Mysql唯一约束（unique key）是指所有记录中字段的值不能重复出现。

  - 唯一约束与主键约束相似的是它们都可以确保列的唯一性。不同的是，唯一约束在一个表中可设多个列，并且设置唯一约束的列允许有空值，但是只能有一个空值。而主键约束在一个表中只能有一个，且不允许有空值。


**针对列而言的**

- 创表设置

```mysql
-- 语法格式如下：
<字段名> <数据类型> unique;
-- eg
create table school_bk (
...
schoolname varchar(20) unique not null,
)
```

- 添加和删除

```mysql
-- 添加
alter table <数据表名> add constraint <唯一约束名> unique(列名);
-- eg
alter table reader_bk add constraint uni_phone unique(phonenumber);

-- 删除
alter table <表名> drop index <唯一约束名>;
-- eg
alter table reader_bk drop index uni_phone;
```

## 检查约束

> **（用户自定义完整性）**

检查约束是用来检查数据表中，字段值是否有效的一个手段。例如，图书表中的价格字段是没有负数的，一般应该大于“0”。在设置字段的检查约束时要根据实际情况进行设置，这样能够减少无效数据的输入；在读者表中，性别字段，可以设置检查约束为“男”或“女”，输入其他的字符为无效。

```mysql
-- 创建
check <表达式>
-- eg
create table reader (
...
check(gender in (‘男’,‘女’)), -- 或check(gender='男‘ or gender='女')),
)

-- 添加
alter table <数据表名> add constraint <检查约束名> check(<检查约束>)
-- eg
alter table reader add constraint ck_gender check(gender in ('男','女'));

-- 删除
alter table <数据表名> drop constraint <检查约束名>;
-- eg
alter table reader drop constraint ck_gender;
```

## 默认值约束

**（域完整性）**

```mysql
-- 创建
publishname varchar(20) default null,
onshelf char(2) default '是',

-- 添加
alter table book change column onshelf char(2) default '是';

-- 删除
alter table book change column onshelf onshelf char(2) default null;
```

## 非空约束

**（域完整性）**

```mysql
-- 创建
publishname varchar(20) not null

-- 修改
alter table book_bk change column price price float not null;

-- 删除
alter table book_bk change column price price float null;
```



# 索引

## 概念

含义及特点：

- **本质：排序**
- 在关系数据库中，索引是为了加速对表中数据行的检索而对数据库表中一列或多列的值**进行排序的一种存储结构**，它是某个表中一列或若干列值的集合和相应的指向表中物理标识这些值的数据页的逻辑指针清单。
- 索引是针对表而建立的，它是由数据页面以外的索引页面组成的，每个索引页面中的行都会含有逻辑指针，以便加速检索物理数据。

索引的优点：

- 大大加快数据的检索速度;

- 创建唯一性索引，保证数据库表中每一行数据的唯一性;
- 加速表和表之间的连接;
- 在使用分组和排序子句进行数据检索时，可以显著减少查询中分组和排序的时间。

索引的缺点：

- 索引需要占物理空间。

- 每当对表中的数据进行增加、删除和修改的时候，索引也要动态的维护，降低了数据的维护速度。

  > **频繁更新的字段不适合创建索引**

索引的分类：

- 普通索引：是最基本的索引，它没有任何限制。

- 唯一索引：与普通索引类似，不同的就是：索引列的值必须唯一，但允许有空值。如果是组合索引，则列值的组合必须唯一。

- 主键索引：是一种特殊的唯一索引，一个表只能有一个主键，不允许有空值。一般是在建表的时候同时创建主键索引。

- 组合索引：指多个字段上创建的索引，**只有在查询条件中使用了创建索引时的第一个字段，索引才会被使用**。使用组合索引时遵循最左前缀集合，因此**组合索引的字段先后顺序十分关键，直接决定了sql在查询中是否能使用到该索引**。

- 全文索引：在前面的学习中，通过数值比较、范围过滤等方法就可以完成绝大多数的文本查询，但是，如果希望通过关键字的匹配来进行查询过滤，那么就需要基于相似度的查询，而不是原来的精确数值比较。

  > 全文索引对某些类型的字段，创建不了

- 空间索引：使用spatial参数，Mysql在7之后的版本支持了空间索引，主要支持opengis几何数据模型，初学者一般用不到。

## 各索引的实现

区分索引和约束：

- 索引是带有index 的要删除创建都得有它
-  约束是带有constraint 的，一般创立、添加时都有它   

```mysql
-- ------------------- 创表时创立
-- 普通索引
index id_schoolname(schoolname)
-- 唯一性索引
unique index id_schoolname(schoolname)
-- 组合索引
index id_book(bookname,author,publishname)
-- 全文索引
fulltext index id_introduction(introduction)
-- 短索引 (特征：里面有括号规定大小)
index id_introduction(introduction(10))

-- ------------------- 已存在的表上添加、删除索引
create [unique | fulltext | spatial] index [索引名] on 表名 (字段名1 [(长度)] [asc | desc])；
-- 删除索引
drop index id_schoolname on school_bk;
-- 普通索引
create index id_schoolname on school_bk(schoolname);-- 在某列上创建索引
-- 唯一性索引
create unique index id_schoolname on school_bk(schoolname);
-- 组合索引
create index id_book on book_bk(bookname,author,publishname);
-- 对于确认组合索引的使用效果
1. explain select * from book_bk where publishname=’aaa’ and author=’bbb’;  -- 上述查询没有使用到id_book的索引，仅仅使用了条件查询。
2. explain select * from book_bk where bookname=’aaa’ and author=’bbb’;  -- 上述查询正确使用了id_book的索引，可见只有在查询条件中使用了创建索引时的第一个字段，索引才会被使用。
3.explain select * from book_bk where bookname=’aaa’ and publishname=’bbb’;  -- 上述查询也使用了id_book的索引，但只用到了查询条件中的第一个字段，而查询条件中的第二个字段是使用了索引下推功能，可见查询条件中字段的先后顺序十分关键，直接决定了sql在查询中是否能使用到该索引。

-- 全文索引
create fulltext index id_introduction on book_bk(introduction);
-- 短索引
create index id_introduction on book_bk(introduction（10）);

-- ---------------------修改表结构的方式添加索引
alter table 表名 add [unique | fulltext] [index] [索引名] 列名[(长度)] [ asc | desc])；
-- eg
alter table school_bk add index ...  -- 同上，这里不在叙述
                      drop index id_xxx;
```



# 视图

## 概念

**视图是什么？**

从sql的角度来看视图就是一张表

**视图来自哪里？**

视图是一个虚拟表，是从数据库中一个或多个表中导出来的表，其内容由查询定义。所以一旦表数据变化，视图数据也会变

**视图和表有什么不同？**

是否保存了实际数据

**视图的优点**

1. 无需保存数据，可以节省存储设备的容量
2. 频繁使用可以调用，大大提高效率
3. 简单性、安全性、逻辑数据独立性

> 表中存储的是实际数据，而视图中保存的是从表中取出数据所使用的select语句
>
> 应该将经常使用的select语句做成视图

## 实现

- 语法格式如下：


create [or replace] view视图名[(属性清单)]

as 

select语句

**[with [cascaded | local] check option];**

> oracle里没有cascaded和local，但又with read only只读

> 语法说明如下。
>
> - 视图名：表示要创建的视图名称。
> - 属性清单：可选项，指定视图中各个属性的名词，默认情况下与select语句中的查询的属性相同。
> - select语句：表示一个单表或者多表的完整查询语句，将查询记录导入视图中。
> - with check option：可选项，表示更新视图数据时要保证在该视图的权限范围之内，即检查插入或修改的数据是否符合 where 设置的条件。

```mysql
-- 创建单表的视图
create or replace view v_book_language(书名,作者,类别)
--  v_book_language可以不进行改名，即直接v_book_language as...
as select bookname,author,classno from book
where classno='c005' 
with check option;  -- 默认会是cascade
select * from v_book_language;

update v_book_language set 作者='杨思琦' where 书名='新课标小学语文阅读丛书论语';  -- 同时原表也会更新相关数据

insert into v_book_language 
values ('Mysql的前世今生','张健','c006'); -- 没有插入原表的主键

-- 创建多表时的情况？
在where里加内外连接就好了
-- 但是注意：多表创建视图时，无法对该视图进行修改
```

> 由于with check option选项的限制，新增的数据如果不在v_book_language的范围内，那么插入数据不成功。

```mysql
-- 修改视图
alter view v_book_yuyan(书编号,书名,作者,出版社,图书类别) as 
... -- 和create一样

-- 只能删除视图的定义，不会删除数据。可以一次删除多个视图
drop view if exists v_book_yuyan;
```



# 数据库编程

## 基础知识

###  用户变量

> 用户可以使用 declare 关键字来定义变量，定义后可以为变量赋值。这些变量的作用范围是 begin...end 程序段中。

```mysql
-- 定义
declare var_name[,...] type [default value]
-- 不能同时定义多个变量;type 参数用来指定变量的类型;default value 子句将变量默认值设置为 value，没有使用 default 子句时，默认值为 null
declare v_num int default 10;
declare v_no char(10);

-- 赋值1
set var_name = 赋值表达式[,var_name = 赋值表达式]...
set v_num=20; -- 若在进程之外赋值，则要加@,即 set @v_num=20


-- 赋值2  select..into 语句为变量赋值
select col_name [...] into var_name[,...] from table_name where
select readername,phonenumber into v_name,v_phone from reader where readerno='r001'；
-- 返回结果只能唯一行。否则报错
```

###  函数

函数分类

- 数字函数
- 字符串函数
- 日期函数
- 转换函数
- 聚合函数
- **流程控制函数**

#### 数字函数

```sql
abs(数值)　-- 绝对值函数
mod(被除数, 除数)　-- 求余
sqrt（数)  -- 求二次方根，负数为null
round(对象数值, 保留小数的位数)　-- 四舍五入
ceil(数)和ceiling(数)  -- 返回不小于参数的最小整数
-- eg:
round(5.4, 4) -- 5.4
round(3.4, 3) -- 3.5
select ceil(-4.5),ceiling(4.5);
返回结果为-4和5。

----------------------------------------------------------
-- rand	生成一个0~1之间的随机数，传入整数参数是，用来产生重复序列；
select rand(),rand()*10,rand()*100;
-- floor	向下取整，返回值转化为一个bigint；
select floor(8),floor(8.66),floor(-8),floor(-8.66);

-- 产生一个1-100和1000的随机数
select floor(rand()*100)+1, floor(rand()*1000)+1;
```

注：绝大多数函数对于null都返回null

#### 字符串函数

- ||--拼接函数

  但：Mysql无法使用，所以只能：

  ```sql
  字符串1 + 字符串2
  ```

  ```sql
  len(字符串)-- 字符串长度函数
  lower(字符串)-- 小写转换函数
  upper(字符串)-- 大写转换函数
  replace(对象字符串, 替换前的字符串, 替换后的字符串)-- 字符串替换
  
  substring(对象字符串 [from] 截取的起始位置 [for] [个数])-- 字符串的截取
  substring('database',3) -- 结果为abase
  
  select concat('data','base') -- 合并字符串
  
  trim('   database   ')	-- 删除字符串左右两侧的空格；
  
  reverse	-- 字符串反转（逆序）函数，返回与原始字符串顺序相反的字符串;
  例如：select reverse('database');
  
  strcmp('abc','ab')-- 两字符串的比较
  >0 -- a大
  =0 -- 同大
  <0 -- b大
  ```

#### 流程控制函数

1. if 判断，流程控制，语法结构如下：

   **注：这个是写在select的列里，对其中一个列进行相应的判断**

   ```mysql
   if(expr,v1,v2)-- 当expr为真是返回v1的值，否则返回v2。
   select readername 姓名,if(gender='女',0,1) 性别 from reader limit 10;  -- 在第三列性别中进行判断，把他的值边为后面的结果
   
   ifnull(字符v1,v2);
   -- 其中：如果 字符v1 不为 null，则 ifnull 函数返回 字符v1; 否则返回 v2 的结果。
   
   ```

2. case 搜索判断语句，语法如下：

   **Mysql不允许在 then 或 else 子句中使用空的命令。**

   case和if都会写在设置条件的列上

   ```mysql
   case
       when <条件1> then <命令>
       when <条件2> then <命令>
       ...
       else <命令>
   end case;
   -------------------------------------
   select bookno 书号,bookname 书名,
     case 
       when number=0 then '零本'
       when number=1 then '孤本'
       when number>1 and number<6 then '少量' 
       else '大量'
     end as 数量
   from book limit 10;  
   ```

## 流程控制语句

有：if语句、case语句、loop语句、leave语句、iterate语句、repeat语句和while语句等。

###  if

- **if( )判断函数不同于这里的if语句。**

其语法的基本形式如下：

```mysql
if search_condition then statement_list
[elseif search_condition then statement_list]...
-- 此时elseif不能隔开，否则有多少个if就要多少个end if
[else statement_list]
end if;
```

> **mysql的是elseif连在一起，oracle是elsif连在一起，注意区别**

```mysql
if age<20 then set @count1=@count1+1;
	@count1=@count1+2；  -- 这里若是多条语句，则每一条用分号分隔，这是属于then内部的
    elseif age>=@count1=@count1+120 and age<=40 then set @count2=@count2+1;
    else set @count3=@count3+1;  -- else同理
end if;
```

###  case

> 相对于c的switch

case 语句的基本形式如下：
```mysql
case
  when search_condition then statement_list
  [when search_condition then statement_list] ...
  [else statement_list]
end case;
```
```mysql
case
when age<20 then set @count1=@count1+1;
    when age>=20 and age<=40 then set @count2=@count2+1;
    else set @count3=@count3+1;
end case;
```

###  loop leave 

> loop相当于c里的while(true)
>
> leave相当于c里的break

loop语句可以使某些特定的语句重复执行。loop只实现了一个简单的循环，并不进行条件判断。必须使用leave语句等才能停止循环，跳出循环过程。loop 语句的基本形式如下：

```mysql
[label:]loop  -- label参数表示这个循环的名字，可以省略
  statement_list
  leave label  -- 退出则要指定循环的名字
end loop [label]
```

```mysql
add_num:loop
    set @count=@count+1;
    if @count=100 then
        leave add_num;
end loop add_num;
```

###  iterate

> 相当于c的continue

```mysql
iterate label  -- 若要使用iterate则，loop中的label参数不能省略
iterate add_num;
```

###  repeat

> 相当于c的do-while -- 先做后判断条件

repeat语句是有条件控制的循环语句，基本语法形式如下：

```mysql
[label:] repeat
    statement_list
    until search_condition  -- 真则跳出循环
end repeat [label]

repeat
    set @count=@count+1;
    until @count=100
end repeat;
```

###  while

```mysql
[label:] while search_condition do
    statement list
end while [label]

while @count<100 do
    set @count=@count+1;
end while;
```

## 存储过程

> 存储过程是数据库中的一个重要功能，存储过程可以用来转换数据、数据迁移、制作报表，它类似于编程语言，一次执行成功，就可以随时被调用，完成指定的功能操作。

```mysql
-- 创建
create procedure <过程名> ( [过程参数[,…] ] ) <过程体>  -- 创建存储过程和存储函数不用加顿号，因为create以下的内容都是属于它本身的，所以不能加顿号。而在存储内部，即begin和end的内部，每条大语句都要加顿号
[过程参数[,…] ] 格式如下：
[ in | out | inout ] <参数名> <类型>
begin
end;

-- 调用
call p_name();


-- ----------------------------------eg
delimiter $$
create procedure pr_good(inout v_no char(10),out v_prize char(30),v_name char(30),v_schoolname char(40))
begin
	declare v_sum int;
	select count(*),readername,schoolname 
	into v_sum,v_name,v_schoolname 
	from borrow,reader,school 
	where reader.readerno=v_no 
	and borrow.readerno=reader.readerno 
	and reader.schoolno=school.schoolno;
	if v_sum > 25 then
		set v_prize='读者之星';
	elseif v_sum between 15 and 25 then
		set v_prize='希望之星';
	elseif v_sum<5 then
		set v_prize='加油';
	else
		set v_prize='好读者';
	end if;
	select v_no,v_name,v_schoolname,v_prize;
end$$
delimiter ;

-- 查看
show procedure status like '存储过程名' [\g];
show create procedure '存储过程名' [\g];

-- 调用
set @v_no='r066';
call pr_good(@v_no,@v_prize,@v_name,@v_schoolname);
-- 不能直接call pr_good('r066',@v_prize,@v_name);必须带@它本身

-- 删除
drop procedure [ if exists ] pr_good
```

> mysql里存储过程的调用是用call，oralce里是可以匿名块调用或exec调用

## 存储函数

> 存储函数可以通过return语句返回函数值，主要用于计算并返回一个值。而存储过程没有直接返回值，主要用于执行操作。

```mysql
-- 创建
create function fu_name(param1,param2,…)
returns datatype
begin
	return x  -- 必须要有返回值
end;
-- 存储函数与存储过程创建时最大的区别就是存储函数一定要有返回值，并指定返回类型
-- eg
delimiter $$
create function fu_query(v_name varchar(10))
returns int(4)
begin
	return (select count(*) from book where bookname like concat('%',v_name,'%'));
end$$
delimiter ;

-- 查看、删除同上

-- 调用
select 存储函数名([参数1], [参数2]…)

select fu_query('数据库');
-- 注意区别存储过程，存储过程是call，而存储函数是select查询
```

> mysql的调用存储函数不需要from dual，mysql也没有这个伪表

## 触发器

> 重要的是触发了“因”，然后执行“果”，不需要进行调用

```mysql
create trigger <触发器名> 
< before | after >  -- 触发之前还是之后
<insert | update | delete > -- 因，就是要进行表的操作，DML
on <表名> 
for each row   -- each row针对每行变更都进行操作
begin  -- 果
end;
```

- before和after的区别（注意区分）

  before和after，触发器被触发的时刻，表示触发器是在激活它的语句之前或之后触发。若**希望验证新数据是否满足条件（一般有条件判断，而且只对一个表），则使用 before** 选项；**若希望在激活触发器的语句执行之后完成几个或更多的改变（果里涉及到几个表），则通常使用 after** 选项。

- 在触发器主体（事件）中可以引用行变量

  1. 在监视事件上执行insert操作后会有一个新行，如果在触发事件中需要用到这个新行的变量，可以用new关键字表示。

  2. 在监视事件上执行delete操作后会有一个旧行，如果在触发事件中需要用到这个旧行的变量，可以用old关键字表示。

  3. 在监视事件上执行update操作后原纪录是旧行，新记录是新行，可以使用new和old关键字来分别操作。

     > 因为update其实是先delete后insert

- 当使用delete的注意事项

  当触发器涉及到对触发器**自身的表更新操作时，只能使用before**类型触发器，不可使用after 类型触发器。另外，如果更新的是同一行数据，须直接更新新行的变量，即**使用new关键字**。

```mysql
delimiter $$
create trigger tr_borrow_returndata before update 
    on borrow for each row
begin
    if new.returndate is not null then
        set new.re_turn='是';
end if;
end$$
delimiter ;
update borrow set returndate='2017-06-07'了 where borrowno=10;
-- 1.其中，会在update之前进行判断，而这时因为还没有update，而只有new关键字提前执行了update，即有更新后的数据：'2017-06-07'了。就算说，new既代表了更新后的数据
-- 2.因此时是对仅一个表进行的update操作，所以仅能使用before
```

- 例子

  ```mysql
  -- 查看
  show triggers \g;
  select * from information_schema.triggers where trigger_name='触发器名' \g;
  -- 删除
  drop trigger <名字>;
  
  --  eg
  delimiter $$
  create trigger tr_borrow_return after update 
      on borrow for each row
  begin
      if new.re_turn='是' then
  update book set number=number+1 where bookno=new.bookno;
  end if;
  end$$
  delimiter ; 
  -- -----------------------------------------
  delimiter $$
  create trigger tr_borrow_new after insert 
      on borrow for each row
  begin
      update book set number=number-1 where bookno=new.bookno;
  end$$
  delimiter ; 
  ----------------------------------------------
  delimiter $$
  create trigger tr_book_onshelf before update 
      on book for each row
  begin
      if new.number<=1 then set new.onshelf='否';
      else set new.onshelf='是';
  end if;
  end$$
  delimiter ;
  ```


## 游标

> 游标是一种能从包括多条数据记录的结果集中每次提取一条记录的机制。
>
> 尽管游标能遍历结果中的所有行，但一次只指向一行。
>
> 游标的作用就是用于对查询数据库所返回的记录进行遍历，以便进行相应的操作。

游标创建可以使用五步法：

```mysql
/*1.声明一个游标
使用declare关键字来声明游标，并定义相应的select语句。其语法的基本形式如下： */
declare cursor_name cursor for select_statement;
-- 还要设置一个变量来判断游标的查询结果是否结束了
declare done int default false; -- 0也行
declare continue handler for not found set done=true;  -- 0对应就是1

/*2.打开定义的游标
声明游标之后，要想从游标中提取数据，必须首先打开游标。其语法格式如下：  */
open cursor_name;
-- 需要注意的是，打开一个游标时，游标并不指向第一条记录，而是指向第一条记录的前边。

/*3.获得下一行数据
游标顺利打开后，可以使用fetch...into语句来读取数据，其语法形式如下：*/
fetch cursor_name into var_name [,var_name]...
/*上述语句中，将游标cursor_name中select语句的执行结果保存到变量参数var_name 中。当第一次使用游标时，此时游标指向结果集的第一条记录。
Mysql的游标是只读的，只能顺序地从开始往后读取结果集，不能从后往前，也不能直接跳到中间的记录。*/

/*4.需要执行的语句(增删改查)
这里视具体需求而定；*/

/*5.关闭游标
游标使用完毕后，要及时使用close关键字关闭游标，其语法格式如下：*/
close cursor_name;
-- 使用声明过的游标不需要再次声明，用open语句打开它就可以了。
```

> **注：mysql里游标的定义用的是for介词，而oracle里是is**
>
> **mysql里declare定义变量每个变量都要用declare且都要加分号；**

例子

```mysql
delimiter $$
create procedure pr_lovebook()
begin
	declare v_bookno char(4);
	declare v_sum int(4);
	declare done int default false;  -- 步骤一：游标所需的变量
	declare cu_lovebook cursor for   -- 步骤二：定义游标1
		select bookno,count(*) from borrow group by bookno order by count(*) desc limit 5;
	declare continue handler for not found set done=true;                                            -- 2设置何时结束
	open cu_lovebook;                -- 步骤三：打开游标
	read_loop:loop
		fetch cu_lovebook into v_bookno,v_sum;                                           -- 步骤四：用循环获取游标（含退出）
		if done then 
			leave read_loop;
		end if;
		select bookno,bookname,author,onshelf,v_sum from book where bookno= v_bookno;
	end loop;
	close cu_lovebook;            -- 步骤五：关闭游标
	end$$
delimiter ;

call pr_lovebook;
```

## 用户权限备份

###  数据库用户管理

> **用户会话变量以@开头**
>
> 可以用grant语句为指定数据库添加用户
>
> 修改服务器密码：set password

#### 查看用户

```mysql
-- 查看user表的用户信息
use Mysql;
select host,user,authentication_string from user;
```

> 说明：
> 1.host表示允许访问的主机，localhost为本机，%则表示一组主机,**%就代表了该用户允许远程连接**；
> 2.authentication_string表示密码，但是是经过加密过的，不能直接看出来。
>
> 
>
> **-- 创建好用户的登录方式：在cmd中输入：**
> **Mysql -u user_name -p**
> **Mysql -utest2 -p**

#### 新建用户

- 方法1.create

```mysql
create user 'user_name'@'host_name' [identified by ['password']];

create user 'test'@'%' identified by 'liujiejie';
```

> -- **@表示要定义主机名称，中间不能有空格，此时主机名为%**
> -- 定义密码是 identified by 密码为liujiejie（密码要有8位）
> **-- test是用户名称**

- 方法2.insert

```sql
insert into mysql.user(host,user,authentication_string) values('host_name','user_name',password('your_password'));
flush privileges;

insert into Mysql.user(host,user,authentication_string) values('%','test2',password('liujiejie'));
flush privileges;  -- 必须更新有才有效
```

> **必须拥有 mysql.user 表的 INSERT 权限**  
>
> -- 必须要password，否则可以创建，但你没法登陆

- 方法3.grant

```sql
grant priv_type on database.table to user[identified by [password] 'password']

grant select on *.* to 'test3'@'%' identified by 'liujiejie';   -- （select是权限的类型）（此时既创建了用户又赋予了权限）
```

> **该命令可以创建多个用户，其中priv_type参数表示新用户的权限(select,insert,delete,etc.)**
> databse.table参数表示新用户的权限范围(在哪个表里有效)
> user由用户名和主机构成

#### 用户的修改与删除

- 修改用户名

```mysql
rename user 'username'@'host' to 'new_username'@'host';
-- 如
rename user 'test2'@'%' to 'test02'@'%', 'test3'@'%' to 'test03'@'%';
```

- 删除用户

```sql
-- 删除用户
drop user user_name[,user_name2...];
drop user 'test02'@'%', 'test03'@'%'; -- 需包含用户名和主机名
```

- 修改用户密码

```mysql
-- 修改用户密码1：root来修改密码,必须在cmd中操作
mysqladmin -u user_name -p password new_password;
Mysqladmin -u root -p password liujiejie
Mysqladmin -u user1 -p password liujiejie

-- 2.update
update user set authentication_string = password('new_pd') where user='user_name';
update user set authentication_string = password('liujiejie') where user = 'test';

-- 3.set   登录哪个用户就是为哪个用户改密码
set password = password('new_pd');
set password = password('liujiejie');

-- 登录的是管理员账户，为用户改密码
set password for 'u_name'@'h_name'=password('new_pd');
set password for 
    'test'@'%'=password('liujiejie');
    
-- 4.grant,和创建时一样
grant select on *.* to 'test'@'%' identified by 'liujiejie';
flush privileges;
```

### 用户权限管理

#### 查看用户权限

> 主要的权限表有以下几个：user（用户全局权限表）,db,host,table_priv,columns_priv和procs_priv

```sql
-- 查看user表的各权限
desc user;

-- 查看用户权限
show grants for 'u_name'@'h_name';
show grants for 'test1'@'%';
show grants for 'root'@'localhost';
```

#### 授予权限

- Mysql的权限级别分为

  **全局级别（\*.\*）**的管理权限：作用于整个Mysql实例级别。

  **数据库级别（lib.*)**的权限：作用于某个指定的数据库上或者所有的数据库上。

  3**.数据库对象级别(lib.book)的权限**：作用于指定的数据库对象上（表、视图等）或者所有的数据库对象上。

  这三种级别的权限分别存储在Mysql库的user,db,tables_priv,columns_priv和procs_priv这几个系统表中，待Mysql实例启动后就加载到内存中。

- 赋予权限语法

```mysql
grant privilege[,...] on privilege_level 
to u_name@h_name [identified by password]
 [with [grant_option | resource_option]];
flush privilege;
```

> 用户不存在，则grant会创建
>
> privilege_level是授予的权限，主要有：
>
> | 权限           | 范围                 | 作用           |
> | -------------- | -------------------- | -------------- |
> | **all**        | **服务器**           | **所有权限**   |
> | **select**     | **表、列**           |                |
> | **insert**     |                      |                |
> | **update**     |                      |                |
> | delete         |                      |                |
> | create         | 数据库、表、索引     |                |
> | drop           |                      |                |
> | grant option   | 数据库、表、存储过程 | 授权           |
> | references     | 数据库、表           | 外键约束的父表 |
> | index          | 表                   | 创建删除索引   |
> | alter          |                      |                |
> | show databases | 服务器               | 查看数据库名称 |
> | execute        | 存储过程             | 执行           |
> | create view    | 视图                 | 创建           |
> | show view      |                      | 查看           |
> | create user    | 服务器               | 创建用户       |

- 全局层级**\*.\***

  ```sql
  grant select on *.* to user1@localhost;
  ```

- 数据库层级**lib.\***

  ```sql
  grant insert on lib.* to user1@localhost;
  ```

- 表层级**lib.book**

  ```sql
  grant update on lib.book to user1@localhost;
  ```

- 列层级**level(column1[,...])**

  ```sql
  grant update(borrowdate,returndate) on lib.borrow to 'user2'@'%';
  ```

- 子程序层级

  ```sql
  delimiter $$
  create procedure pr()
  begin
  	select 1;
  end$$
  delimiter ;
  grant execute on procedure lib.pr to 'user'@'%';
  ```

#### 权限的转移与限制

- 权限的转移

  ```sql
  -- 它将允许此用户授予其他用户或从其他用户删除被拥有的权限。
  grant insert on lib.* to user1@localhost with grant option;  -- 先设置允许授权
  -- 在登录user1，将其拥有的新增数据的权限传递给 user2。
  grant insert on lib.* to user2@localhost;

- 权限的限制

  ```sql
  grant privilege[,...] on privilege_level 
  to u_name@h_name [identified by password]
   [with [grant_option | resource_option]];
  flush privilege;
  ```
  
  > 可选的with resource_option子句可以来**分配Mysql数据库服务器的资源。**
  >
  > 1. max_user_connections：全局变量，一个用户可以在同一时间连接Mysql实例的数量，此参数无法对每个用户区别对待。
  > 2. **max_queries_per_hour**：一个用户在一个小时内可以执行查询的次数（基本包含所有语句）。**queries不止select，凡是返回值带select的都算**
  > 3. max_updates_per_hour：一个用户在一个小时内可以执行修改的次数（仅包含修改数据库或表的语句）。
  > 4. max_connections_per_hour：一个用户在一个小时内可以连接Mysql的时间。
  
  ```sql
  grant insert on lib.* to 'user1'@'localhost' with max_queries_per_hour 10;-- 对只允许输入多少次密码问题，属于queries，因为没输入此密码都要去查询是否相同
  ```

#### 回收与更新权限

- 回收权限

  ```sql
  -- 回收权限，收回权限就是取消已赋予用户的某些权限
  revoke [all] privilege,[privilege],.. on privilege_level from user;
  -- 如
  revoke insert on lib.* from user2@'%';
  show grants for 'user2'@'%';
  ```

- 更新权限的方式

  ```sql
  -- cmd终端
  mysqladmin flush -privileges
  mysqladmin reload
  -- mysql命令行
  flush privileges;

###  数据库备份和还原

#### 数据库备份

- 数据库的备份概念

​	Mysqldump命令可以将数据库中的数据**备份成一个文本文件（sql）**。执行Mysqldump命令时，它先查出需要备份的表的结构，再在文本文件中生成一个create语句。然后，将表中的所有记录转换成一条insert语句。然后通过这些语句，就能够创建表并插入数据。

- Mysqldump基本语法：

  ```sql
  Mysqldump [options] db_name [tbl_name ...] > backup.sql
  
  Mysqldump [options] --databases db_name ... > backup.sql
  
  Mysqldump [options] --all-databases > backup.sql
  ```

  > **都是在终端cmd进行**
  >
  > - 第一种方式是**备份特定数据库**下的**某些表**，其中表的指定是可选的，若不指定表，则备份该数据库下的**所有表**。
  > - 第二种方式是**备份某些数据库**，应该至少指定一个数据库。
  > - 第三种方式是**备份所有数据库**
  >
  > options 中选项：
  >
  > -  --host=host_name（h host_name）：指定要导出的目标数据库所在的主机，默认是 localhost 
  > - --user=user_name（-u user_name）：指定链接目标数据库的数据库用户名 
  > - --password[=password]（-p[password]）：指定链接目标数据库的数据库密码 
  > - --port=port_num（-P port_num）：指定链接目标数据库的端口 
  > - --all-databases（-A）：参数代表导出所有数据库里的所有的表

```mysql
-- 在cmd中方式1.备份某数据库或某数据库中的某表
Mysqldump -uroot -p lib book> d:\lib_20230619.sql                                          -- （官方写法，但是因版本问题，报错，所有要采用下面的那种方式👇）
Mysqldump --no-defaults -uroot -p12345678 lib book> d:\lib_20230619.sql

-- 方式2.备份某些数据库，最少一个
Mysqldump -u root -p --databases lib xk > d:\lib_xk_20230619.sql

Mysqldump –-no-defaults -uroot -p --databases lib xk > d:\lib_xk_20230619.sql

-- 方式3.备份所有数据库
Mysqldump -uroot -p --all-databases > d:\all_20230619.sql

Mysqldump –no-defaults -uroot -p --all-databases > d:\all_20230619.sql
```

#### 数据库还原

- 语法

  ```sql
  -- 方式1，cmd里
  mysql -u root -p [dbname] < backup.sql
  
  -- 方式2，在mysql里
  source backup.sql;
  ```

- eg

    ```mysql
    -- 1.cmd中
    Mysql -uroot -p12345678 lib < d:\lib_20230619.sql
    
    -- 2.Mysql中
    drop database if exists lib;
    create database lib;
    use lib;
    source d:\\lib_20230619.sql;  -- 因为\是转义字符
    -- 或
    source d:/lib_20230619.sql;  
    ```

###  备份与还原数据

#### 数据的备份

```mysql
-- 1.
select ... into outfile '目标文件' [option];

-- 2.
select ... into outfile '目标文件' fields terminated by ',' optionally enclosed by '""' lines terminated by '\n';    -- 要求字符用””包含，字段之间用，隔开，每行结束使用\n换行符
```

> “OPTION”参数为可选参数选项，其可能的取值有： 
>
> - **fields terminated by '字符串'：设置字符串为字段之间的分隔符，可以为单个或多 个字符。默认值是“\t”。** 
> - fields enclosed by '字符'：设置字符来括住字段的值，只能为单个字符。默认情况 下不使用任何符号。 
> - **fields optionally enclosed by '字符'：设置字符来括住 CHAR、VARCHAR 和 TEXT 等 字符型字段。默认情况下不使用任何符号。** 
> - fields ESCAPED by '字符'：设置转义字符，只能为单个字符。默认值为“\”。 
> - LINES STARTING by '字符串'：设置每行数据开头的字符，可以为单个或多个字符。默 认情况下不使用任何字符。 
> - **LINES terminated by '字符串'：设置每行数据结尾的字符，可以为单个或多个字符。 默认值是“\n”。** 
> - fields 和 LINES 两个子句都是自选的，但是如果两个子句都被指定了，fields 必须位 于 LINES 的前面。

```sql
-- 1.
select * from school into outfile 'd:/lib_school_2023-06-19.txt';

-- 2.
select * from book into outfile 'd:/lib_book_2023-06-19.txt'
fields terminated by ',' optionally enclosed by '"' 
lines terminated by '\n';    -- 要求字符用””包含，字段之间用，隔开，每行结束使用\n换行符
```

#### 数据的还原

```mysql
create table tb_name like tb_name2 load data infile "/path/file" into table tb_name;

create table school_bk like school;
load data infile 'd:/lib_school_20210101.txt' into table school_bk;

create table book_bk like book;
load data infile 'd:/lib_book_20210101.txt' into table book_bk
fields terminated by ',' optionally enclosed by '"' 
lines terminated by '\n';   -- 注意数据字符用””标注，字段之间用，隔开，每行结束使用\n换行符
```
