Guia de Implantação no Microsoft Azure para Aplicação Java Spring Boot com Thymeleaf

Aqui vamos fornecer algumas instruções basicas, passo a passo para implantar aplicação Java Spring Boot com Thymeleaf no Microsoft Azure.

###### Pré-requisitos:Pré-requisitos:

    Conta no Microsoft Azure.
    Aplicação Java Spring Boot pronta para implantação.
    Maven instalado localmente para compilação do projeto (caso não esteja empacotado).
    Conhecimento básico do Azure e do uso do Azure CLI.

## Via Azure CLI:

Faça o login no Azure:
Execute o comando abaixo para fazer login na sua conta do Azure através da linha de comando. Siga as instruções para autenticar-se no portal do Azure:

shell:

```shell
az login
```

Crie um Grupo de Recursos (Resource Group):
Você pode criar um grupo de recursos para organizar seus recursos no Azure. Substitua <nome-do-seu-grupo-de-recursos> pelo nome desejado:

shell:

```shell
az group create --name <nome-do-seu-grupo-de-recursos> --location <localizacao-do-grupo-de-recursos>
```

Crie um Serviço de Aplicativo (App Service):
O Azure App Service é um serviço de hospedagem que permite implantar aplicativos web. Substitua <nome-do-seu-appservice> pelo nome desejado e <plano-de-hospedagem> pelo nome do plano de hospedagem (por exemplo, "PlanoDeHospedagemPadrao"):

shell:

```shell
az webapp create --resource-group <nome-do-seu-grupo-de-recursos> --name <nome-do-seu-appservice> --plan <plano-de-hospedagem>
```

Configure as Variáveis de Ambiente:
Configure as variáveis de ambiente necessárias para sua aplicação no serviço de aplicativo. Substitua <chave> e <valor> pelas configurações específicas da sua aplicação:

shell:

```shell
az webapp config appsettings set --resource-group <nome-do-seu-grupo-de-recursos> --name <nome-do-seu-appservice> --settings <chave>=<valor>
```

Por exemplo, se você precisar configurar a URL do banco de dados:

shell:

```shell
az webapp config appsettings set --resource-group <nome-do-seu-grupo-de-recursos> --name <nome-do-seu-appservice> --settings DATABASE_URL=jdbc:mysql://localhost:3306/meu-banco
```

Implante sua Aplicação:
Implante sua aplicação Java Spring Boot no serviço de aplicativo. Substitua <caminho-do-seu-arquivo-jar> pelo caminho para o arquivo JAR da sua aplicação:

shell:
```shell
az webapp deployment source config-zip --resource-group <nome-do-seu-grupo-de-recursos> --name <nome-do-seu-appservice> --src <caminho-do-seu-arquivo-jar>
```

Acesse sua Aplicação:
Após a implantação, você pode acessar sua aplicação usando o URL fornecido pelo Azure. Você pode encontrar o URL no resultado do comando 
```shell
az webapp show --name <nome-do-seu-appservice>.
```


az group create --name app-java --location eastus &&

az appservice plan create --resource-group app-java --name app-java-plan --sku FREE &&

az webapp create --resource-group app-java --name app-java-webapp --plan app-java-plan --runtime "java:17:Java SE:17" &&

az webapp config appsettings set --resource-group app-java --name app-java-webapp --settings DATABASE_URL=jdbc:oracle:thin:@oracle.fiap.com.br:1521:ORCL &&

az webapp deployment source config --name app-java-webapp --resource-group app-java --manual-integration --repo-url https://github.com/Dagostini01/sprint-fiap-mvc-java.git --branch master && 

az webapp deployment source sync --name app-java-webapp --resource-group app-java &&

mvn com.microsoft.azure:azure-webapp-maven-plugin:2.9.0:config && 

mvn package azure-webapp:deploy -DskipTests
