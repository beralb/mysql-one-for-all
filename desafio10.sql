SELECT 
	c.cancao AS nome,
    COUNT(h.data_reproducao) AS reproducoes
FROM
	SpotifyClone.cancoes as c
    
INNER JOIN
	SpotifyClone.historico_de_reproducoes as h
ON 
	h.cancoes_cancao_id = c.cancao_id
    
INNER JOIN
	SpotifyClone.usuarios AS u
ON
	h.usuarios_usuario_id = u.usuario_id
    
WHERE
	u.planos_plano_id = 1 OR u.planos_plano_id = 4
    
GROUP BY
c.cancao

ORDER BY
	c.cancao;
    