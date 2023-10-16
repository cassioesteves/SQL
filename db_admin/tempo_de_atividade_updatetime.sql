SELECT 
    CONCAT(
        FLOOR(Uptime / 86400), ' dias, ',
        FLOOR((Uptime % 86400) / 3600), ' horas, ',
        FLOOR((Uptime % 3600) / 60), ' minutos e ',
        Uptime % 60, ' segundos'
    ) AS TempoDeAtividade
FROM
    information_schema.GLOBAL_STATUS
WHERE
    VARIABLE_NAME = 'Uptime';
