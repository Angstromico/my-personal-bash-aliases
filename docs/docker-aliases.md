# 🐳 Docker Aliases

Simple aliases to make Docker commands shorter.

## `docker-start-img`

Runs a Docker image interactively, removing it after it stops, and mapping a port.

### Usage
```bash
docker-start-img <port-mapping> <image-name>
```

### Example
```bash
docker-start-img 8080:80 nginx
```
