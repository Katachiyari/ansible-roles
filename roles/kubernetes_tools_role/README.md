---
- name: Installer les outils Kubernetes kubectl, helm, et k9s
  hosts: all
  become: yes

  roles:
    - role: kubernetes_tools_role
      vars:
        kubectl_version: "v1.27.3"
        helm_version: "v3.12.1"
        k9s_version: "v0.27.4"
        kubernetes_bin_dir: "/usr/local/bin"
# Ce rôle installe et configure les outils clients Kubernetes essentiels
# kubectl pour gestion de clusters,
# Helm pour déploiement chartes,
# et k9s pour interface interactive.
