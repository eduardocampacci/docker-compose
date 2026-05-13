# Docker Compose - WordPress

Stack Docker Compose para ambiente WordPress com banco MySQL.

## Estrutura

| Arquivo | Descrição |
|---|---|
| `docker-compose.yml` | Stack WordPress + MySQL |

## Requisitos

- Docker
- Docker Compose

## Execução

```bash
docker compose up -d

```

## Observações

- Ajuste portas, volumes e senhas antes do uso.
- Recomendado utilizar `.env` para variáveis sensíveis.
- Testado em OpenSUSE Leap 15.3.
