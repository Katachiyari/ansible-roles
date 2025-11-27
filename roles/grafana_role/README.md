---
- name: Déployer Grafana avec Prometheus datasource
  hosts: monitoring_servers
  become: yes

  roles:
    - role: grafana_role
      vars:
        grafana_version: "10.4.0"
        grafana_admin:
          user: "admin"
          password: "SuperSecretAdmin123!"
        grafana_server:
          http_port: 3000
          domain: "monitoring.example.com"
        grafana_datasources:
          - name: "Prometheus"
            type: "prometheus"
            url: "http://localhost:9090"
            access: "proxy"
            isDefault: true
        grafana_dashboards:
          - "dashboards/prometheus-dashboard.json"
# Ce rôle déploie Grafana 10.x complète avec admin préconfiguré,
# datasource Prometheus automatique, dashboards importés,
# prêt pour monitoring visuel temps réel.
