---
- name: Installer et configurer un container runtime (containerd)
  hosts: all
  become: yes

  roles:
    - role: container_runtime_role
      vars:
        container_runtime_name: "containerd"
        containerd_config:
          version: 2
          root: "/var/lib/containerd"
          state: "/run/containerd"
          disable_plugins: []
          [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]:
            SystemdCgroup: true
        container_runtime_service_enabled: true

# Ce rôle installe un runtime container standard (containerd), déploie sa config,
# et assure le démarrage du service pour supports Docker, Kubernetes, et autres orchestrateurs.
