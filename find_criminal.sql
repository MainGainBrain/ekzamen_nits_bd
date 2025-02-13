-- Преступник Алексей	Сафранов	10.10.2.26
-- это так, ибо
-- "Первую часть дня я писала код для обучающего курса по Python, 
-- а ближе к обеду мне позвонили из десткого сада моего сына,
-- я отпросилась с работы, я забрала ребенка домой и открыла больничный"
-- (сказала Диана Требияни)

-- "Первую половину дня я занимался редактированием документации нашего отдела,
-- а после обеда мы с Дианой Требияни собрались в переговорке и обсуждали
-- функционал курса по Python, добавляли материалы на нашу шару"
-- Алексей	Сафранов



select
	er.report,
	query.name,
	query.surname,
	query.ip_address
from
	employee_report er
join (
	select
		e.uid,
		e.name,
		e.surname,
		pc.ip_address
	from
		pc
	join applications app
on
		pc.id = app.source_pc
	join employees e on
		app.source_pc = e.pc
	where
		pc.vlan_pc = (
		select
			sj.vlan
		from
			security_journal sj
		where
			sj.discovery_date like '2024-10-10'
			and sj.vulnerability_id like 'УБИ.041')
		and app.application like 'Mozila Firefox'
		and app.session_time like '17:25') as query
on
	er.uid_employee = query.uid;




select
	er.report,
	e.name,
	e.surname
from
	employee_report er
join employees e 
on
	er.uid_employee = e.uid
where
	(e.name like 'Натан'
		and e.surname like 'Христинович')
	or
(e.name like 'Диана'
		and e.surname like 'Требияни')
	or 
(e.name in('Алиса', 'Агафон', 'Август'));







