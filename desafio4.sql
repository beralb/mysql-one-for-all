SELECT 
	DISTINCT(u.usuario) AS usuario,
    COUNT(h.data_reproducao),
	
    CASE
		WHEN h.data_reproducao > '2021-01-01' AND COUNT(h.data_reproducao = 0) THEN 'Usuário ativo'
        WHEN h.data_reproducao > '2021-01-01' AND COUNT(h.data_reproducao = 0) THEN 'Usuário ativo'
        ELSE 'Usuário inativo'
	END AS status_usuario

FROM SpotifyClone.usuarios AS u

INNER JOIN
	SpotifyClone.historico_de_reproducoes AS h

ON 
	u.usuario_id = h.usuarios_usuario_id

GROUP BY
	u.usuario,
	h.data_reproducao;