# swagger-ui

Swagger UI 2.1.3 with API_URL and API_KEY injection (45 MB)

## Usage

```sh
$ docker run -d -p 80:80 -e API_URL=http://localhost:4000/swagger -e API_KEY_JWT=true stempler/swagger-ui
```

### Variables

* `API_URL` - Swagger endpoint for your API
* `API_KEY` - Default API Key (optional)
* `API_KEY_JWT` - if set to anything else than "false" modifies the API Key mechanism to treat the API Key as Json Web Token (JWT) and send it as Authorization header instead (disabled by default)
