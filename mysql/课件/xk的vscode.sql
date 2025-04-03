xk
USE XK;
-- 5.1
CREATE OR REPLACE VIEW v_course_compute(课程名,种类,学分,任课教师,课程时间) 
AS SELECT CouName,Kind,Credit,Teacher,SchoolTime FROM course
WHERE departNo='01'
WITH CHECK OPTION;

DROP VIEW XK.V_COURSE_COMPUTE;

SELECT * FROM v_course_compute;

UPDATE v_course_compute SET 任课教师='gg'
WHERE 任课教师='刘杰';

-- 5.2
CREATE OR REPLACE VIEW v_student_compute(学号,姓名,班级名称,系部名称,密码)
AS SELECT StuNo,StuName,ClassName,DepartName,Pwd
FROM Student,Class,Department
WHERE student.classNo=class.classNo AND class.departNo=department.departNo
WITH CHECK OPTION;

SELECT * FROM v_student_compute;

-- 5.4
ALTER VIEW v_course_compute(课程名,学分,任课教师,选修上线人数,种类,课程时间) 
AS SELECT CouName,Credit,Teacher,LimitNum,kind,SchoolTime FROM course
WHERE departNo='01'
WITH CHECK OPTION;


-- 存储函数2
delimiter $$
CREATE function fn_query(v_CouNo char(30))
returns char(30)
begin
    declare v_count int(2);
    declare v_name char(30);
    declare v_WillNum decimal(5,0);
    SELECT COUNT(*) INTO v_count 
    FROM stucou
    where couNo=v_CouNo;
    select couName,willNum Into v_name,v_willNum from course where couNo=v_couNo;
    IF (v_willNum = 0 AND v_count = 0) THEN
        delete from course where couNo=v_CouNo;
        return concat('已删除',v_name,'课程');
    ELSE IF (v_name is null) THEN
        return concat('未查到',v_couNo,'这门课');
    else
        return concat('未删除',v_name,'课程');
    end if;
    end if;
end$$
delimiter ;
--------------------------------
SELECT COUNT(*) 
    FROM course,stucou 
    where WillNum=0 
    and (select couNo from Stucou where couNo='019') is null
    AND course.couNo='019';


-- 8-27
delimiter $$
CREATE trigger tr_borrow_returnDate before UPDATE
    on borrow for each row
begin 
    if new.borrowdate is not null THEN
        set new.re_turn='是';
    end if;
end$$
delimiter ;

-- 8-28
delimiter $$
create trigger tr_borrow_return after UPDATE
    on borrow for each row
begin
    if new.re_turn='是' THEN
        UPDATE book set number=number+1 where bookno=new.bookNo;
    end if;
end$$
delimiter ;

-- 8-29
delimiter $$
create trigger tr_borrow_new after insert
    on borrow for each row
begin
    update book set number=number-1 where bookno=new.bookNo;
end$$
delimiter ;

-- 8-30
delimiter $$
create trigger tr_book_onshelf before update
    on book for each row
begin
    if new.number<=1 THEN
        set new.onshelf='否';
    else
        set new.onshelf='是';
    end if;
end$$
delimiter ;

-- 触发器1
delimiter $$
create trigger tr_WillOrder_RandomNum before update
    on StuCou for each row
begin
    set new.RandomNum=floor(Rand()*1000) + 1;
end$$
delimiter ;

select * from stucou where stuNo='00000008';
update StuCou set WillOrder=3 where stuNo='00000008' and couNo='018';
select * from stucou where stuNo='00000008';
update StuCou set WillOrder=1 where stuNo='00000008' and couNo='005';
update StuCou set WillOrder=2 where stuNo='00000008' and couNo='018';
select * from stucou where stuNo='00000008';

-- 2
delimiter $$
create trigger tr_StuCou_WillNum after insert  
    on StuCou for each row
begin
    update course set willNum=willNum+1 where CouNo=new.couNo;
end$$
delimiter ;

select * from course where couno='001';
select * from StuCou where StuNo='00000001';
insert into StuCou(stuNo,CouNo,WillOrder,State) VALUES ('00000001','001',4,'报名');
select * from course where couno='001';
select * from StuCou where StuNo='00000001';

-- 游标
delimiter $$
create procedure pr_lovecourse()
begin
    declare v_sum int(4);
    declare v_couNo char(3);
    declare done int default false;
	declare cr_lovecourse cursor for
        SELECT CouNo,COUNT(*) FROM StuCou Group by couNo order by Count(*) desc limit 3;
    declare continue handler for not found set done=true;
    open cr_lovecourse;
    course_loop:loop
        fetch cr_lovecourse into v_couNo,v_sum;
        if done THEN
            leave course_loop;
        end if;
        select couNo 课程号,couName 课程名,Teacher 上课教室,LimitNum 限选人数,v_sum 总的选秀学生数 from course where couNo=v_couNo;
    end loop;
    close cr_lovecourse;
end$$
delimiter ;

call pr_lovecourse;


-- 用户管理1
CREATE user 'jiaowu1'@'%' IDENTIFIED BY 'jiaowu_1!';

-- 2
GRANT SELECT ON *.* to 'jiaowu2'@'%' IDENTIFIED BY 'jiaowu_2!' WITH GRANT OPTION;

-- 3
RENAME user 'jiaowu1'@'%' to 'jiaowuAdmin'@'%','jiaowu2'@'%' to 'jiaowuShow'@'%';

-- 4
drop user 'jiaowuAdmin'@'%';

-- 5
set password=password('jiaowuShow_1!');

-- 6
set password for 'jiaowu'=password('jiaowuShow_1!');

-- 数据备份
USE XK;
select * from student into outfile 'd:/xk_student_20210201.txt'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

-- 数据还原
create table student_bk like student;
LOAD DATA INFILE 'd:/xk_student_20210201.txt' into table student_bk
FIELDS TERMINATED by ',' OPTIONALLY ENCLOSED by '"'
LINES TERMINATED by '\n';