SELECT 
	COUNT(DISTINCT(cancoes.cancao)) AS cancoes,
    COUNT(DISTINCT(artistas.artista)) AS artistas,
	COUNT(DISTINCT(albuns.album)) AS albuns

FROM 
	SpotifyClone.albuns
    
INNER JOIN
	SpotifyClone.artistas
ON
 	artistas.artista_id = albuns.artistas_artista_id  

INNER JOIN
	SpotifyClone.cancoes
ON
	cancoes.albuns_album_id = albuns.album_id;