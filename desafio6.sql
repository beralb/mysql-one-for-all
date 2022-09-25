SELECT 
	 FORMAT(MIN(p.valor_plano), 2) AS faturamento_minimo,
     FORMAT(MAX(p.valor_plano), 2) AS faturamento_maximo,
     FORMAT(SUM(p.valor_plano) / COUNT(p.valor_plano), 2) AS faturamento_medio,
     FORMAT(SUM(p.valor_plano), 2) AS faturamento_total

FROM SpotifyClone.usuarios AS u
INNER JOIN
	SpotifyClone.planos AS p
ON
	p.plano_id = u.planos_plano_id;