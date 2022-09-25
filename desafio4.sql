SELECT 
	MIN(u.usuario) AS usuario,
    IF (MAX(h.data_reproducao) >= '2021-01-01', 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM
	SpotifyClone.usuarios AS u	
INNER JOIN	
	SpotifyClone.historico_de_reproducoes AS h
ON 
	u.usuario_id = h.usuarios_usuario_id

GROUP BY
	u.usuario

ORDER BY
		u.usuario;
        