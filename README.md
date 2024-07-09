## Register Runner

```sh
gitlab-runner register -n \
--url "https://gitlab.example.com" \
--registration-token token \
--executor docker \
--description "Docker Runner 2" \
--docker-image "docker:27.0.3" \
--docker-volumes "/tmp/runner/builds:/builds" \
--docker-volumes "/tmp/runner/cache:/cache" \
--docker-volumes "/var/run/docker.sock:/var/run/docker.sock"
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
## Kubernetes Runner

### Installing GitLab Runner using the Helm Chart

```sh
helm repo add gitlab https://charts.gitlab.io
```
```sh
helm repo update gitlab
```
### Values file

```yaml
gitlabUrl: https://gitlab.example.com
runnerRegistrationToken: "token"
imagePullPolicy: IfNotPresent
concurrent: 10
checkInterval: 5
rbac:
 create: true
 rules:
 - resources: ["configmaps", "pods", "pods/attach", "secrets", "services"]
   verbs: ["get", "list", "watch", "create", "patch", "update", "delete"]
 - apiGroups: [""]
   resources: ["pods/exec"]
   verbs: ["create", "patch", "delete"]

runners:
  config: |
    [[runners]]
      environment = [
        "FF_KUBERNETES_HONOR_ENTRYPOINT=false",
        "FF_USE_LEGACY_KUBERNETES_EXECUTION_STRATEGY=true",
        ]
      [runners.kubernetes]
         namespace = "gitlab-runner"
         tls_verify = false
         image = "docker:27"
         privileged = true
         poll_timeout = 2000
         [[runners.kubernetes.volumes.host_path]]
          name = "docker-sock"
          mount_path = "/var/run/docker.sock"
          read_only = false
          host_path = "/var/run/docker.sock"
```


```sh
helm install --namespace <NAMESPACE> gitlab-runner -f values.yaml gitlab/gitlab-runner

```