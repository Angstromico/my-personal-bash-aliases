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

---

## `checkdockport`

Check which Docker container has mapped a specific port.

### Usage
```bash
checkdockport <port>
```

- `port`: The host port mapped to a container (e.g., 3000, 8080).

### Example
```bash
checkdockport 3000
```
