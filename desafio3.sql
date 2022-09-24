SELECT 
	usuario AS usuario,
	COUNT(cancoes_cancao_id) AS qt_de_musicas_ouvidas,
    SUM(ROUND(duracao_segundos/60, 2)) AS total_minutos
    
FROM 
	SpotifyClone.historico_de_reproducoes

INNER JOIN
	SpotifyClone.usuarios
ON
	historico_de_reproducoes.usuarios_usuario_id = usuarios.usuario_id

INNER JOIN
	SpotifyClone.cancoes
ON
	historico_de_reproducoes.cancoes_cancao_id = cancoes.cancao_id
    
GROUP BY
	usuarios.usuario
ORDER BY
    usuarios.usuario;