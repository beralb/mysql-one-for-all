SELECT 
	usuarios.usuario AS usuario,
    IF(DATE(data_reproducao) >= '2021-01-01', 'Usuário ativo', 'Usuário inativo')
    # data_reproducao,    
    # 

FROM SpotifyClone.usuarios

INNER JOIN
	SpotifyClone.historico_de_reproducoes

ON 
	usuarios.usuario_id = historico_de_reproducoes.usuarios_usuario_id

GROUP BY
	usuarios.usuario,
	historico_de_reproducoes.data_reproducao;