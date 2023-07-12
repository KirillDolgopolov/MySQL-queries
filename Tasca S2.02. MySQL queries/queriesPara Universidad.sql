select apellido1, apellido2, nombre from persona  order by apellido1, apellido2, nombre;
select nombre, apellido1, apellido2 from persona where tipo="alumno" and  telefono is null;
select nombre, apellido1, apellido2 from persona where tipo="alumno" and year(fecha_nacimiento)=1999;
select nombre, apellido1, apellido2 from persona where tipo="profesor" and  telefono is null and right(nif,1)='K';
select * from asignatura where cuatrimestre=1 and curso=3 and  id_grado=7;
select p.apellido1, p.apellido2, p.nombre, d.nombre from persona p inner join profesor pr on p.id=pr.id_profesor inner join departamento d on d.id=pr.id_departamento;
select p.nif, asig.nombre, ce.anyo_inicio, ce.anyo_fin from persona p join alumno_se_matricula_asignatura asm on p.id =asm.id_alumno join curso_escolar ce on asm.id_alumno=ce.id join asignatura asig on asm.id_asignatura=asig.id where p.nif="26902806M";
select distinct dep.nombre, gr.nombre from departamento dep join profesor prof on dep.id=prof.id_departamento join asignatura asig on prof.id_profesor= asig.id_profesor join grado gr on gr.id=asig.id_grado where gr.nombre like "%Grado en Ingeniería Informática%";
select distinct p.nombre, p.apellido1, asig.nombre from persona p  join alumno_se_matricula_asignatura asm on asm.id_alumno= p.id join curso_escolar ce on ce.id = asm.id_curso_escolar join asignatura asig on asig.id=asm.id_asignatura where ce.id=5;

-- LEFT JOIN i RIGHT JOIN --

select dep.nombre, p.apellido1, p.apellido2, p.nombre from persona p join profesor prof on p.id=prof.id_profesor left join departamento dep on prof.id_departamento=dep.id order by dep.nombre, p.apellido1, p.apellido2, p.nombre;
select p.apellido1, p.apellido2, p.nombre from persona p join profesor prof on p.id=prof.id_profesor left join departamento dep on prof.id_departamento=dep.id where dep.nombre is null ;
select dep.nombre, prof.id_profesor from departamento dep left join profesor prof on prof.id_departamento=dep.id where prof.id_profesor is null;
select p.nombre, p.apellido1, p.apellido2 from persona p right join profesor prof on p.id=prof.id_profesor left join asignatura asig on prof.id_profesor=asig.id_profesor where asig.id_profesor is null;
select asig.nombre, prof.id_profesor from asignatura asig left join profesor prof on asig.id_profesor= prof.id_profesor where asig.id_profesor is null; -- select nombre from asignatura where id_profesor is null , no?
select distinct dep.nombre from departamento dep left join profesor prof on dep.id=prof.id_departamento left join asignatura asig on prof.id_profesor=asig.id_grado where asig.id is null;

-- Consultes resum --

select count(*) from persona where persona.tipo="alumno";
select count(*) from persona where persona.tipo="alumno" and year(fecha_nacimiento)=1999;
select dep.nombre as Departamento, count(prof.id_profesor) as "número de profesores" from departamento dep join profesor prof on prof.id_departamento= dep.id group by dep.nombre order by count(prof.id_profesor) asc;
select dep.nombre as Departamento, count(prof.id_profesor) as "número de profesores" from departamento dep left join profesor prof on prof.id_departamento= dep.id group by dep.nombre order by count(prof.id_profesor) asc;
select grado.nombre as "nombre de grado", count(asignatura.id) as "número de asignaturas" from grado left join asignatura on grado.id=asignatura.id_grado group by grado.nombre order by count(asignatura.id);
select grado.nombre as "nombre de grado", count(asignatura.id) as "número de asignaturas" from grado join asignatura on grado.id=asignatura.id_grado  group by grado.nombre having count(asignatura.id)>40  order by count(asignatura.id);
select grado.nombre as "nombre de grado", asignatura.tipo as "tipo de asignatura", sum(asignatura.creditos) as "número de creditos" from grado join asignatura on grado.id=asignatura.id_grado group by grado.nombre, asignatura.tipo;
select curso_escolar.anyo_inicio as "Año de inicio", count(alumno_se_matricula_asignatura.id_alumno) as "número de alumnos" from curso_escolar left join alumno_se_matricula_asignatura on curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar group by curso_escolar.anyo_inicio;
select p.id, p.nombre, p.apellido1, p.apellido2, count(asignatura.id_profesor) as "número de asignaturas" from persona p  left join asignatura on p.id=asignatura.id_profesor where p.tipo="profesor" group by p.id order by count(asignatura.id_profesor) desc;
select * from persona where tipo="alumno" order by fecha_nacimiento limit 1;
select distinct p.id, p.nombre, p.apellido1, p.apellido2 from persona p inner join profesor on p.id=profesor.id_profesor left join asignatura on profesor.id_profesor=asignatura.id_profesor where asignatura.id is null;