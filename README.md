# Docker Compose

Repositório com stacks Docker Compose utilizados para estudos, laboratório e ambientes de produção.

## Estrutura

| Pasta | Descrição |
|---|---|
| `glpi/` | Stack GLPI |
| `mattermost/` | Stack Mattermost |
| `nextcloud/` | Stack Nextcloud |
| `portainer/` | Stack Portainer |
| `snikket/` | Stack Snikket |
| `wordpress/` | Stack WordPress + MySQL |

## Observações

- Ajuste volumes, portas e variáveis conforme seu ambiente.
- Alguns serviços utilizam persistência local.
- Dados sensíveis e persistentes são ignorados pelo `.gitignore`.
- Utilize preferencialmente arquivos `.env` para credenciais e senhas.

## Execução

Exemplo:

```bash
docker compose up -d
```
