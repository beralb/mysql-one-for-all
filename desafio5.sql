SELECT
	c.cancao AS cancao,
    COUNT(h.data_reproducao) AS reproducoes
    
FROM
	SpotifyClone.cancoes AS c
    
INNER JOIN
	SpotifyClone.historico_de_reproducoes AS h
ON
	h.cancoes_cancao_id = c.cancao_id

GROUP BY
	c.cancao
    
ORDER BY
	reproducoes DESC,
    c.cancao
    
LIMIT 2;