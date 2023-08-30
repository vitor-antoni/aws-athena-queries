# Usuarios-Empresa
### Apresentação
Na empresa *XYZ*, há uma quantidade considerável de usuários cadastrada no sistema, estes dados podem ser visualizados por um arquivo CSV. Nele, está contido informações como: nome, sobrenome, nascimento, email, cargo, estado, salario. Iremos tratar estes dados e visualizá-los no Athena.

## ❗ Explicação
Antes de começarmos o passo a passo, vamos começar explicando a existência de arquivo dentro deste diretório: <br>
→ *[usuarios.csv](usuarios.csv)* : Arquivo com as informações dos usuários.
→ *[athena-queries.sql](athena-queries.sql)* : Neste arquivo, podemos ver algumas queries/consultas que podemos realizar no AWS Athena a partir dos dados utilizados.

> **Reforçando:** TODOS os dados presentes no repositório são dados fictícios e gerados por uma Inteligênia Artificial - Google Bard e ChatGPT

## 🔧 Passo a passo
1. Crie um Bucket do S3 para armazenar nosso arquivo `usuarios.csv`.
2. Exemplo de nome de bucket: `empresa-xyz-bucket`.
3. Envie o arquivo `usuarios.csv` para o bucket.
4. Navegue até o serviço **AWS Glue** e na aba esquerda, clique em *Data Catalog*, logo após, clique em *Classifiers* (abaixo de Crawlers).
5. Iremos criar um classifier para que seja deterimado os nomes das colunas/cabeçalho da nossa tabela.
6. Neste caso, iremos especificar:
    * `usuarios-classifier` para o nome;
    * `CSV` para classifier type;
    * `Has headings` para column headings;
    * `nome,sobrenome,nascimento,email,cargo,estado,salario` no espaço abaixo de `Has headings`;
    > Especifique exatamente nesta ordem;
    * Crie o classifier;
7. Iremos criar um banco de dados/database para os nossos dados a serem processados pelo Glue. Para isto, na aba esquerda, clique em Databases e em `create database`. Especifique o nome `empresa-xyz-database` .

> Este banco de dados não é um banco de dados comum próprio para ser utilizado em uma aplicação WEB, por exemplo. Para este caso de uso, seria adequado serviços como o RDS ou o DynamoDB.

8. Na aba esquerda, clique em Crawlers e vamos criar um Crawler.
    * `usuarios-crawler` para o nome;
    * clique em `add a data source`;
    * cole o URI do seu Bucket do S3 criado anteriormente (`empresa-xyz-bucket`) ou clique em `Browse S3`;
    * selecione a função/role do IAM adequada;
    * selecione o `database` criado anteriormente e especifique `usuarios-table-` para o nome para a tabela;
9. Assim que o Crawler for criado, vamos clicar em `run crawler` para que ele descubra nossos dados armazenados no bucket S3 e armazene-os na tabela. *Esta ação demanda entre 40 a 60 segundos, em média.*

10. Após rodar o Crawler e ele retornar um status de **READY**, podemos navegar até o AWS Athena.
11. Em `data`, vamos selecionar `empresa-xyz-database`.
12. Abaixo, será exibido uma lista suspensa com o nome `Tables`, clicaremos nela e vamos ver o nome da nossa tabela criada anteriormente.
13. Clique nos "3 pontinhos" no lado direito do nome da tabela e em `Preview Table`. Esta ação nos **permitirá visualizar todos** os dados contidos no arquivo `usuarios.csv`.
14. Agora, vamos executar algumas pesquisas em SQL Language usando os comandos disponibizados no arquivo `athena-queries.sql`.

✅ **Passo a passo concluído com sucesso.**
Caso houver alguma correção, questionamento ou dúvida, sinta-se a vontade para interagir com este repositório.

## 📑 Informações adicionais

Estes projetos foram desenvolvidos para fins de aprendizagem e desenvolvimento profissional acerca de serviços de análise de dados, logo, não há nenhum código muito complexo e de difícil entendimento.

Conforme eu avançar e me aprofundar meus conhecimentos nestes serviços, pretendo trazer mais conteúdo para este repositório.

Enquanto isto, você pode me acompanhar na minha rede social onde posto alguns conteúdos referentes a Cloud Computing: [LinkedIn](linkedin.com/in/vitor-silva-de-antoni/)
