# SAP NGINX Proxy – Railway Deploy

## Pré-requisitos
- Conta no GitHub
- Conta no Railway (free)

## Passos
1. Suba esses arquivos em um repositório GitHub
2. Acesse https://railway.app
3. New Project → Deploy from GitHub
4. Selecione o repositório
5. Aguarde o build

## Variáveis de ambiente (OBRIGATÓRIO)
No Railway → Variables, configure:

CPI_URL=https://71c5c840trial.it-cpitrial06-rt.cfapps.us10-001.hana.ondemand.com/http/proxy
CPI_HOST=71c5c840trial.it-cpitrial06-rt.cfapps.us10-001.hana.ondemand.com
CPI_AUTH=Basic xxxxxxxxxxxxxxxxxxxxxxxxxxxxx

## Basic Auth (SAP → Proxy)
Crie o arquivo .htpasswd localmente:
htpasswd -nb sapuser sapsenha > .htpasswd

Depois inclua no repo (somente para POC).

## Teste
curl -u sapuser:sapsenha https://SEU_PROJETO.up.railway.app/http/proxy
