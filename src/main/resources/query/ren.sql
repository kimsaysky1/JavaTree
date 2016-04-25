SELECT LEVEL 
FROM   dual
CONNECT BY LEVEL <= 10


SELECT s.lectureno as studying, l.lectureno as lectureno, c.courseno as courseno,
		l.lecturename, to_char(l.regdate, 'yyyy/mm/dd') as regdate, l.uploadedfilename,
		c.coursename as coursename, c.introdution as introdution, c.courseno as courseno, c.id as teacherid
		FROM lecture l 
		JOIN course c ON ( l.courseno = c.courseno and c.courseno = 3 )
		LEFT OUTER JOIN studylecture s ON (  s.lectureno = l.lectureno and s.courseno = 3 and s.id = 2)
		order by lectureno asc