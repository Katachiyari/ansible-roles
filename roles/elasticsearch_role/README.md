---
- name: Déployer Elasticsearch (single-node ou cluster)
  hosts: elasticsearch_nodes
  become: yes

  roles:
    - role: elasticsearch_role
      vars:
        elasticsearch_version: "8.11.0"
        elasticsearch_mode: "single-node"
        elasticsearch_jvm_heap: "2g"
        elasticsearch_paths:
          data: "/var/lib/elasticsearch"
          logs: "/var/log/elasticsearch"
        elasticsearch_network:
          host: "0.0.0.0"
          http_port: 9200
# Ce rôle déploie Elasticsearch 8.x sécurisé (X-Pack), JVM optimisée,
# single-node ou cluster discovery, répertoires dédiés, prêt pour ELK Stack.