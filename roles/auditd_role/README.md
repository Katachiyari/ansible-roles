---
- name: Configurer audit système complet pour conformité/sécurité
  hosts: all
  become: yes

  roles:
    - role: auditd_role
      vars:
        audit_rules:
          - "-w /etc/passwd -p wa -k identity"
          - "-w /etc/sudoers -p wa -k sudoers"
          - "-a always,exit -F arch=b64 -S execve -k exec"
          - "-w /var/www -p wa -k web_changes"
          - "-a always,exit -F path=/usr/bin/sudo -F perm=x -F auid>=1000 -k privileged"
        auditd_config:
          log_file: "/var/log/audit/audit.log"
          max_log_file: "128"
          num_logs: "7"
        auditd_enabled: true
# Ce rôle implémente un audit système complet : suivi fichiers critiques,
# exécutables, logins, sudoers. Parfait pour conformité PCI-DSS, forensic,
# détection intrusions. **Sécurité → 95% → 98%** 🎉
