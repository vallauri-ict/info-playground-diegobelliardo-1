/*SELECT f.Titolo
FROM Film f 
WHERE 'Mastroianni' IN (SELECT a.Nome
FROM Attori a, Recita r
WHERE r.CodFilm=f.CodFilm
AND r.CodAttore=a.CodAttore)
AND 'Loren' IN (SELECT a.Nome
FROM Attori a, Recita r
WHERE r.CodFilm=f.CodFilm
AND r.CodAttore=a.CodAttore)*/

--15
/*SELECT s.Citta, count(*)
FROM Sale s
GROUP BY s.Citta
*/

--16
/*SELECT s.Citta, count(*) as Numero_sale
FROM Sale s
WHERE s.Posti>60
GROUP BY s.Citta*/

--17 per ogni regista il numero di film diretti dopo 1990
/*SELECT f.Regista, count(*)
FROM Film f
WHERE f.AnnoProduzione>1990
GROUP BY f.Regista*/

--18 per ogni regista l'incasso totale di tutte le proiezioni dei suoi film
/*SELECT f.Regista, sum(p.Incasso) as Totale_incasso
FROM Film f, Proiezioni p
WHERE p.CodFilm=f.CodFilm
GROUP BY f.Regista*/

--19 per ogni film di X il numero totale di proiezioni a Pisa e l'incasso totale (sempre a Pisa)
/*SELECT f.Titolo, COUNT(*) as NumeroProiezioni, sum(p.Incasso) as IncassoTotale
FROM Film f, Proiezioni p, Sale s
WHERE f.CodFilm=p.CodFilm
AND s.CodSala=p.CodSala
AND s.Citta='Pisa'
AND f.Regista='Spielberg'
GROUP BY f.CodFilm, f.Titolo*/

--20 per ogni regista e per ogni attore, il numero d film del regista con l'attore
/*SELECT f.Regista, a.Nome, count(*) as NumeroFilm
FROM Film f, Attori a, Recita r
WHERE r.CodFilm=f.CodFilm
AND r.CodAttore=a.CodAttore
GROUP BY f.Regista, a.CodAttore, a.Nome*/

--21 il regista ed il titolo dei film in cui recitano meno di 6 attori
SELECT f.Regista, f.Titolo
FROM Film f, Recita r
WHERE r.CodFilm=f.CodFilm
GROUP BY f.CodFilm,f.Regista, f.Titolo
HAVING count(*)<6