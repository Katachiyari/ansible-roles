# 📖 README.md **kubernetes_tools_role** – EXPLICATION DÉTAILLÉE


## 🎯 Description

Rôle Ansible pour **installer et configurer les outils Kubernetes** (`kubectl`, `helm`, `helmfile`) sur les serveurs Linux, afin de permettre la gestion et le déploiement de clusters Kubernetes via Ansible.

**Fonctionnalités clés :**

- ✅ Installation des binaires `kubectl`, `helm`, `helmfile`
- ✅ Gestion des versions et des chemins d’installation
- ✅ Configuration de la CLI et du fichier kubeconfig
- ✅ Idempotence et logging structuré

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL 8+ |
| Packages | curl, wget, tar |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `kubernetes_tools_kubectl_bin_path` | str | `/usr/local/bin/kubectl` | Chemin d’installation de kubectl |
| `kubernetes_tools_kubectl_version` | str | `"stable"` | Version de kubectl |
| `kubernetes_tools_helm_bin_path` | str | `/usr/local/bin/helm` | Chemin d’installation de helm |
| `kubernetes_tools_helm_version` | str | `"v3.3.0"` | Version de helm |
| `kubernetes_tools_helmfile_bin_path` | str | `/usr/local/bin/helmfile` | Chemin d’installation de helmfile |
| `kubernetes_tools_helmfile_version` | str | `"v0.125.7"` | Version de helmfile |


***

## 💡 Exemple d’utilisation

### Installation basique (kubectl + helm)

```yaml
---
- name: Installer les outils Kubernetes
  hosts: all
  become: yes
  roles:
    - role: kubernetes_tools_role
      vars:
        kubernetes_tools_kubectl_version: "v1.28.0"
        kubernetes_tools_helm_version: "v3.12.0"
        kubernetes_tools_helmfile_version: "v0.145.0"
```


### Avancé (chemins personnalisés)

```yaml
        kubernetes_tools_kubectl_bin_path: "/opt/bin/kubectl"
        kubernetes_tools_helm_bin_path: "/opt/bin/helm"
        kubernetes_tools_helmfile_bin_path: "/opt/bin/helmfile"
```


***

## 🧪 Tests recommandés

**Vérifier les binaires :**

```bash
kubectl version --client
helm version
helmfile version
```

**Vérifier le fichier kubeconfig :**

```bash
cat ~/.kube/config
```

**Test idempotence :**

```bash
ansible-playbook kubernetes-tools.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : installation des outils = `changed`
- Exécutions suivantes : **0 changed** si version/chemin identique

***

## 📁 Structure du rôle

```text
kubernetes_tools_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── kubectl.yml       # Installation kubectl
│   ├── helm.yml          # Installation helm
│   ├── helmfile.yml      # Installation helmfile
│   └── main.yml          # Inclusion selon variables
├── handlers/
│   └── main.yml          # Nettoyage temporaires
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Installation centralisée des outils Kubernetes
- Gestion des versions et chemins
- Idempotence et logging structuré
- Prêt pour CI/CD et déploiements Kubernetes

***

## 🤝 Contributing

1. Fork → Ajouter outil → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie version outils + logs
- 🚀 Features : Ajout gestion d’autres outils (kustomize, kubectx, etc.)

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour l’installation et la configuration des outils Kubernetes sur toute infrastructure Linux moderne.** 🚀[^1][^7]
<span style="display:none">[^2][^3][^4][^5][^6][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://github.com/BasisTI/ansible_kubetools

[^2]: https://www.tauceti.blog/posts/kubernetes-the-not-so-hard-way-with-ansible-the-basics/

[^3]: https://spacelift.io/blog/ansible-kubernetes

[^4]: https://kubernetes.io/docs/setup/production-environment/tools/

[^5]: https://faun.pub/perfect-devops-example-project-for-your-cv-automate-k8s-installation-with-ansible-playbook-9e676d9b7bd7

[^6]: https://github.com/geerlingguy/ansible-role-kubernetes

[^7]: https://gitlab.mim-libre.fr/infrabricks/ansible/roles/k8s_tools/-/blob/main/README.md

[^8]: https://docs.ansible.com/projects/ansible/latest/collections/kubernetes/core/docsite/kubernetes_scenarios/k8s_intro.html

[^9]: https://docs.okd.io/4.18/operators/operator_sdk/ansible/osdk-ansible-k8s-collection.html

