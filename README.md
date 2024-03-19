## Register Runner

```sh
gitlab-runner register -n \
--url "http://gitlab.example.com/" \
--registration-token token \
--executor docker \
--docker-image "docker:25.0.3" \
--description "Docker Runner"

```

```sh
gitlab-runner register -n \
  --url "https://gitlab.example.com/" \
  --registration-token token \
  --executor docker \
  --description "Docker Runner" \
  --docker-image "docker:25.0.3" 
```

```
[[runners]]
  name = "Docker Runner"
  url = "https://gitlab.example.com/"
  id = 9
  token = ""
  token_obtained_at = 2024-02-11T07:00:46Z
  token_expires_at = 0001-01-01T00:00:00Z
  executor = "docker"
  [runners.cache]
    MaxUploadedArchiveSize = 0
  [runners.docker]
    tls_verify = false
    image = "docker:25.0.3"
    privileged = false
    disable_entrypoint_overwrite = false
    oom_kill_disable = false
    disable_cache = false
    volumes = ["/tmp/runner/builds:/builds", "/tmp/runner/cache:/cache", "/var/run/docker.sock:/var/run/docker.sock"]
    shm_size = 0
    network_mtu = 0
```