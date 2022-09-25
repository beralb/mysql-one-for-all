SELECT 
	u.usuario AS usuario,
    COUNT(h.data_reproducao)
    
FROM 
	SpotifyClone.historico_de_reproducoes AS h
INNER JOIN
	SpotifyClone.usuarios AS u
ON 
	u.usuario_id = h.usuarios_usuario_id

GROUP BY
	u.usuario,
	h.data_reproducao;