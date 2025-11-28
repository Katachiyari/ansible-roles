# 📖 README.md **monitoring_role** – EXPLICATION DÉTAILLÉE


## 🎯 Description

Rôle Ansible complet pour **déployer et configurer un stack de monitoring** (Prometheus, Grafana, exporters) sur Linux, avec gestion des services, des dashboards et de la sécurité.

**Fonctionnalités clés :**

- ✅ Installation Prometheus, Grafana, exporters
- ✅ Configuration des services et des dashboards
- ✅ Gestion des utilisateurs et de la sécurité
- ✅ Idempotence et logging structuré

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL 8+ |
| Packages | prometheus, grafana, node_exporter |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `monitoring_prometheus_enabled` | bool | `true` | Activer Prometheus |
| `monitoring_grafana_enabled` | bool | `true` | Activer Grafana |
| `monitoring_exporters` | list | `["node"]` | Exporters à installer |
| `monitoring_grafana_admin_password` | str | `"admin"` | Mot de passe admin Grafana |
| `monitoring_prometheus_config` | dict | `{}` | Options Prometheus |
| `monitoring_grafana_dashboards` | list | `[]` | Dashboards à importer |


***

## 💡 Exemple d’utilisation

### Stack monitoring basique

```yaml
---
- name: Déployer stack monitoring
  hosts: all
  become: yes
  roles:
    - role: monitoring_role
      vars:
        monitoring_prometheus_enabled: true
        monitoring_grafana_enabled: true
        monitoring_exporters:
          - node
          - process
        monitoring_grafana_admin_password: "MonMotDePasseSécurisé"
        monitoring_prometheus_config:
          scrape_interval: "15s"
        monitoring_grafana_dashboards:
          - src: "dashboards/node-exporter.json"
            dest: "/var/lib/grafana/dashboards/node-exporter.json"
```


***

## 🧪 Tests recommandés

**Vérifier les services :**

```bash
systemctl status prometheus grafana-server
```

**Vérifier les dashboards :**

```bash
curl -s -u admin:MonMotDePasseSécurisé http://localhost:3000/api/dashboards
```

**Test idempotence :**

```bash
ansible-playbook monitoring.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : installation + configuration = `changed`
- Exécutions suivantes : **0 changed** si aucune variable modifiée

***

## 📁 Structure du rôle

```text
monitoring_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── prometheus.yml    # Installation Prometheus
│   ├── grafana.yml       # Installation Grafana
│   ├── exporters.yml     # Installation exporters
│   └── main.yml          # Inclusion selon variables
├── templates/
│   ├── prometheus.yml.j2 # Template Prometheus
│   └── grafana.ini.j2    # Template Grafana
├── handlers/
│   └── main.yml          # Restart services
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Installation officielle Prometheus/Grafana
- Configuration centralisée exporters/dashboards
- Idempotence et logging structuré
- Prêt pour monitoring avancé et visualisation

***

## 🤝 Contributing

1. Fork → Ajouter exporter → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie API dashboards + logs
- 🚀 Features : Ajout gestion alertes, API keys

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour l’installation et la configuration du stack de monitoring sur toute infrastructure Linux moderne.** 📊🚀[^1][^4]
<span style="display:none">[^2][^3][^5][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://github.com/netresearch/ansible-role-monitoring-server/blob/master/README.md

[^2]: https://forum.ansible.com/t/easy-documentation-for-roles-collection/6043

[^3]: https://gitlab.com/the-common/ansible-role-template/-/blob/main/README.md

[^4]: https://gitlab.developers.cam.ac.uk/rcs/platforms/infrastructure/ansible-roles/ansible-role-prometheus/-/blob/e73501716a4cc7f33fb57c4a0757f256365b69ad/README.md

[^5]: https://linux-system-roles.github.io/documentation/role-readme-md

[^6]: https://spacelift.io/blog/ansible-roles

[^7]: https://access.redhat.com/articles/7068606

[^8]: https://github.com/bluehalo/ansible-roles/blob/master/README.md

[^9]: https://gitlab.triumf.ca/gitlab/ci/templates/-/blob/0ac078f7b42e7e2dd0b57d222b9aaf4e0cbe3760/ansible/README.md

