SELECT
	c.cancao AS nome_musica,

	CASE
		WHEN c.cancao LIKE '%Bard%' THEN REPLACE(c.cancao, 'Bard', 'QA')
		WHEN c.cancao LIKE '%Amar%' THEN REPLACE(c.cancao, 'Amar', 'Code Review')
		WHEN c.cancao LIKE '%Pais%' THEN REPLACE(c.cancao, 'Pais', 'Pull Requests')
		WHEN c.cancao LIKE '%SOUL%' THEN REPLACE(c.cancao, 'SOUL', 'CODE')
        WHEN c.cancao LIKE '%SUPERSTAR%' THEN REPLACE(c.cancao, 'SUPERSTAR', 'SUPERDEV')
	END AS novo_nome
    
FROM 
	SpotifyClone.cancoes AS c

WHERE
	c.cancao_id IN (1, 3, 6, 7, 9)
	#novo_nome IS NOT NULL

ORDER BY 
	nome_musica DESC,
    novo_nome DESC;



    