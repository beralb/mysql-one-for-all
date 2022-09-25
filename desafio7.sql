SELECT 
	art.artista AS artista,
    alb.album AS album,
    COUNT(*) AS seguidores
FROM SpotifyClone.artistas AS art

INNER JOIN
	SpotifyClone.seguindo_artistas AS seg
ON
	seg.artistas_artista_id = art.artista_id

INNER JOIN
	SpotifyClone.albuns AS alb
ON
	seg.artistas_artista_id = alb.artistas_artista_id
    
GROUP BY
	alb.album
    
ORDER BY
	seguidores DESC;
		