SELECT
	art.artista AS artista,
    alb.album AS album
FROM
	SpotifyClone.artistas AS art
INNER JOIN
	SpotifyClone.albuns AS alb
ON
	art.artista_id = alb.artistas_artista_id
WHERE
	art.artista = 'Elis Regina'
ORDER BY
	alb.album;