delimiter $$
create procedure proc_media_ponderada (
	in nome varchar(100), 
		in p1 float(3,1),
			in p2 float(3,1), 
				in p3 float(3,1), 
					in p4 float(3,1)
    )
comment 'Efetua o calculo de média ponderada: (((p1*2)+(p2*2)+(p3*3)+(p4*3)) / 10)'
		begin
			select nome,
			round((((p1*2)+(p2*2)+(p3*3)+(p4*3)) / 10), 1) as media_ponderada;
		end
	$$
delemiter ; 

call proc_media_ponderada('João', 8, 7, 5, 9);
call proc_media_ponderada('Maria', 6.5, 4.2, 9.9, 8.7);