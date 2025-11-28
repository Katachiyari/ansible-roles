# 📖 README.md **grafana_role** – EXPLICATION DÉTAILLÉE


## 🎯 Description

Rôle Ansible complet pour **installer et configurer Grafana**, le dashboard de visualisation pour la supervision (Prometheus, Loki, etc.), avec gestion des datasources, des dashboards et de la sécurité.

**Fonctionnalités clés :**

- ✅ Installation Grafana (APT/YUM)
- ✅ Configuration admin et sécurité
- ✅ Gestion des datasources (Prometheus, Loki, MySQL, etc.)
- ✅ Import automatique de dashboards
- ✅ Idempotence et logging structuré

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL 8+ |
| Packages | grafana, wget, unzip |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `grafana_version` | str | `"latest"` | Version Grafana |
| `grafana_admin_user` | str | `"admin"` | Utilisateur admin |
| `grafana_admin_password` | str | `"admin"` | Mot de passe admin |
| `grafana_datasources` | list | `[]` | Datasources à configurer |
| `grafana_dashboards` | list | `[]` | Dashboards à importer |
| `grafana_config` | dict | `{}` | Options de configuration Grafana |

**Structure datasource :**

```yaml
- name: "Prometheus"
  type: "prometheus"
  access: "proxy"
  url: "http://localhost:9090"
  isDefault: true
```


***

## 💡 Exemple d’utilisation

### Grafana basique (Prometheus)

```yaml
---
- name: Installer Grafana avec Prometheus
  hosts: all
  become: yes
  roles:
    - role: grafana_role
      vars:
        grafana_admin_password: "MonMotDePasseSécurisé"
        grafana_datasources:
          - name: "Prometheus"
            type: "prometheus"
            access: "proxy"
            url: "http://localhost:9090"
            isDefault: true
        grafana_dashboards:
          - src: "dashboards/prometheus.json"
            dest: "/var/lib/grafana/dashboards/prometheus.json"
```


### Avancé (multi-datasources)

```yaml
        grafana_datasources:
          - name: "Prometheus"
            type: "prometheus"
            access: "proxy"
            url: "http://localhost:9090"
          - name: "Loki"
            type: "loki"
            access: "proxy"
            url: "http://localhost:3100"
        grafana_dashboards:
          - src: "dashboards/prometheus.json"
            dest: "/var/lib/grafana/dashboards/prometheus.json"
          - src: "dashboards/loki.json"
            dest: "/var/lib/grafana/dashboards/loki.json"
```


***

## 🧪 Tests recommandés

**Vérifier le service :**

```bash
systemctl status grafana-server
```

**Vérifier datasources :**

```bash
curl -s -u admin:MonMotDePasseSécurisé http://localhost:3000/api/datasources
```

**Test idempotence :**

```bash
ansible-playbook grafana.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : installation + configuration = `changed`
- Exécutions suivantes : **0 changed** si aucune variable modifiée

***

## 📁 Structure du rôle

```text
grafana_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── install.yml       # Installation Grafana
│   ├── config.yml        # Configuration admin/datasources/dashboards
│   └── main.yml          # Inclusion selon variables
├── templates/
│   └── grafana.ini.j2    # Template config
├── handlers/
│   └── main.yml          # Restart Grafana
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Installation officielle Grafana
- Configuration centralisée admin/datasources/dashboards
- Idempotence et logging structuré
- Prêt pour monitoring et visualisation avancée

***

## 🤝 Contributing

1. Fork → Ajouter datasource → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie API datasources + logs
- 🚀 Features : Ajout gestion alertes, API keys

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour l’installation et la configuration de Grafana sur toute infrastructure Linux moderne.** 📊🚀[^1][^5]
<span style="display:none">[^2][^3][^4][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://github.com/angristan/ansible-grafana

[^2]: https://galaxy.ansible.com/ui/repo/published/grafana/grafana/content/role/grafana_agent/

[^3]: https://gitlab.eox.at/ansible-public/grafana-role

[^4]: https://grafana.com/blog/2024/07/05/how-to-customize-your-loki-deployment-with-ansible/

[^5]: https://github.com/grafana/grafana-ansible-collection

[^6]: https://grafana.com/docs/grafana/latest/as-code/infrastructure-as-code/ansible/

[^7]: https://code.vandalsweb.com/ansible-roles/grafana/-/tree/update-ansible-version

[^8]: https://git.lsd.ufcg.edu.br/ops/grafana-ansible/-/blob/master/README.md

[^9]: https://gitlab.developers.cam.ac.uk/rcs/platforms/infrastructure/ansible-roles/ansible-role-prometheus/-/blob/e73501716a4cc7f33fb57c4a0757f256365b69ad/README.md

