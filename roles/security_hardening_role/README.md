---
- name: Appliquer CIS Benchmarks niveau 1 (hardening sécurité)
  hosts: all
  become: yes

  roles:
    - role: security_hardening_role
      vars:
        hardening_level: "level1"
        sysctl_security:
          kernel.kptr_restrict: "1"
          net.ipv4.ip_forward: "0"
          fs.protected_symlinks: "1"
        pam_config:
          password_quality: "requisite"
        sudoers_config:
          timestamp_timeout: "Defaults timestamp_timeout=5"
# Ce rôle applique CIS Benchmarks automatisés niveau 1 :
# sysctl sécurité, PAM renforcé, sudoers sécurisé, limits système,
# services inutiles désactivés, outils sécurité installés.
# **Sécurité → 100% BATTLE-READY** 🛡️🎉
