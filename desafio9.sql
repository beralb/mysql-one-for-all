SELECT 
	COUNT(*) AS quantidade_musicas_no_historico
FROM
	SpotifyClone.usuarios AS u
INNER JOIN
	SpotifyClone.historico_de_reproducoes AS h
ON 
	u.usuario_id = h.usuarios_usuario_id
WHERE
	u.usuario_id = 1;