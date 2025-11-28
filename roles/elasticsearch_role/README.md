# 📖 README.md **elasticsearch_role** – EXPLICATION DÉTAILÉE

[
[
[

## 🎯 Description

Rôle Ansible complet pour **installer et configurer Elasticsearch** (serveur de recherche/logs) sur Linux, avec gestion des clusters, des plugins, de la sécurité et de la compatibilité avec les modules Ansible.

**Fonctionnalités clés :**

- ✅ Installation Elasticsearch (tar ou package)
- ✅ Configuration multi-node/cluster
- ✅ Gestion des plugins (ingest-geoip, etc.)
- ✅ Sécurité X-Pack activée par défaut
- ✅ JVM Heap tuning
- ✅ Idempotence et logging structuré

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL/CentOS 8+ |
| Java | ≥ 8 |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `elasticsearch_version` | str | `"8.11.0"` | Version Elasticsearch |
| `elasticsearch_install_mode` | str | `"tar"` | `"tar"` ou `"deb"` |
| `elasticsearch_cluster_name` | str | `"elasticsearch"` | Nom du cluster |
| `elasticsearch_node_name` | str | `{{ inventory_hostname }}` | Nom du nœud |
| `elasticsearch_network_host` | str | `"0.0.0.0"` | Host réseau |
| `elasticsearch_http_port` | int | `9200` | Port HTTP |
| `elasticsearch_transport_port` | int | `9300` | Port transport |
| `elasticsearch_heap_size` | str | `"1g"` | JVM Heap |
| `elasticsearch_plugins` | list | `[]` | Plugins à installer |
| `elasticsearch_config` | dict | `{}` | Options de configuration Elasticsearch |


***

## 💡 Exemple d’utilisation

### Single-node (démo)

```yaml
---
- name: Installer Elasticsearch single-node
  hosts: all
  become: yes

  roles:
    - role: elasticsearch_role
      vars:
        elasticsearch_version: "8.11.0"
        elasticsearch_cluster_name: "mycluster"
        elasticsearch_node_name: "node1"
        elasticsearch_heap_size: "2g"
        elasticsearch_config:
          xpack.security.enabled: true
          http.port: 9200
```


### Cluster multi-nœuds

```yaml
---
- name: Installer cluster Elasticsearch
  hosts: es_nodes
  become: yes

  roles:
    - role: elasticsearch_role
      vars:
        elasticsearch_version: "8.11.0"
        elasticsearch_cluster_name: "mycluster"
        elasticsearch_node_name: "{{ inventory_hostname }}"
        elasticsearch_heap_size: "4g"
        elasticsearch_config:
          discovery.seed_hosts: ["node1", "node2", "node3"]
          cluster.initial_master_nodes: ["node1", "node2", "node3"]
          xpack.security.enabled: true
```


***

## 🧪 Tests recommandés

**Vérifier le service :**

```bash
systemctl status elasticsearch
```

**Vérifier le cluster :**

```bash
curl -X GET "http://localhost:9200/_cluster/health?pretty"
```

**Test idempotence :**

```bash
ansible-playbook elasticsearch.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : installation + configuration = `changed`
- Exécutions suivantes : **0 changed** si aucune variable modifiée

***

## 📁 Structure du rôle

```text
elasticsearch_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── install.yml       # Installation Elasticsearch
│   ├── config.yml        # Configuration cluster/plugins
│   └── main.yml          # Inclusion selon variables
├── templates/
│   └── elasticsearch.yml.j2  # Template config
├── handlers/
│   └── main.yml          # Restart Elasticsearch
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Installation officielle Elasticsearch
- Configuration centralisée cluster/plugins
- Sécurité X-Pack intégrée
- JVM Heap tuning
- Idempotence et logging structuré
- Prêt pour ELK Stack et monitoring

***

## 🤝 Contributing

1. Fork → Ajouter plugin → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `curl _cluster/health` + logs
- 🚀 Features : Ajout de nouveaux plugins ou options

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour l’installation et la configuration d’Elasticsearch sur toute infrastructure Linux moderne.** 🔍🚀[^1][^2]
<span style="display:none">[^10][^3][^4][^5][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://github.com/idealista/elasticsearch_role

[^2]: https://github.com/geerlingguy/ansible-role-elasticsearch

[^3]: https://github.com/elastic/ansible-elasticsearch

[^4]: https://galaxy.ansible.com/ui/repo/published/community/elastic/docs/

[^5]: https://www.elastic.co/blog/deploying-elasticsearch-with-ansible

[^6]: https://git.idc.tarento.com/upsmf/sunbird-devops/-/tree/release-1.4.2/ansible/roles/elasticsearch

[^7]: https://github.com/artefactual-labs/ansible-elasticsearch

[^8]: https://www.digitalocean.com/community/tutorials/how-to-use-ansible-to-set-up-a-production-elasticsearch-cluster

[^9]: https://galaxy.semaphoreui.com/views/GoodMirek/ansible-elasticsearch

[^10]: https://alfresco.github.io/alfresco-ansible-deployment/deployment-guide.html

