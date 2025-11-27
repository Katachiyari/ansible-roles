---
- name: Installer et configurer Fail2Ban pour protection brute force
  hosts: all
  become: yes

  roles:
    - role: fail2ban_role
      vars:
        fail2ban_jails:
          - name: "sshd"
            enabled: true
            port: "ssh"
            filter: "sshd"
            logpath: "/var/log/auth.log"
            maxretry: 5
            bantime: 3600
          - name: "apache-auth"
            enabled: true
            port: "http,https"
            filter: "apache-auth"
            logpath: "/var/log/apache2/error.log"
            maxretry: 3
            bantime: 7200
          - name: "nginx-http-auth"
            enabled: true
            port: "http,https"
            filter: "nginx-http-auth"
            logpath: "/var/log/nginx/error.log"
            maxretry: 3
            bantime: 7200
        fail2ban_global:
          bantime: 3600
          findtime: 600
          maxretry: 5
# Ce rôle installe Fail2Ban, configure des jails personnalisées pour SSH, Apache, Nginx,
# protège automatiquement contre les attaques par brute force via blocage IP temporaire.
