---
- name: Installer Prometheus pour monitoring système
  hosts: monitoring_servers
  become: yes

  roles:
    - role: monitoring_role
      vars:
        monitoring_type: "prometheus"
        prometheus_version: "2.45.0"
        prometheus_port: 9090
        prometheus_targets:
          - targets: ['localhost:9100']
            labels:
              job: node
          - targets: ['webserver1:9100', 'webserver2:9100']
            labels:
              job: web_servers
        monitoring_services_enabled: true
# Ce rôle installe Prometheus avec Node Exporter support, configure les cibles de monitoring,
# déploie systemd service et assure la supervision métriques temps réel.
