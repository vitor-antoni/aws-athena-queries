SELECT *
FROM "usuarios-table-empresa-xyz-bucket"
LIMIT 10;

SELECT "nome", "sobrenome"
FROM "usuarios-table-empresa-xyz-bucket"
WHERE "salario" > 5000;

SELECT "nome","sobrenome"
FROM "usuarios-table-empresa-xyz-bucket"
WHERE "salario" > 3000
ORDER BY("salario") DESC;

SELECT "nome", "estado"
FROM "usuarios-table-empresa-xyz-bucket"
WHERE "estado" = 'Rio Grande do Sul'
AND "salario" >= 5500;

SELECT count(*), "estado"
FROM "usuarios-table-empresa-xyz-bucket"
GROUP BY("estado");


