# 📖 README.md **fail2ban_role** – EXPLICATION DÉTAILLÉE


## 🎯 Description

Rôle Ansible complet pour **installer et configurer Fail2ban**, le démon de protection réseau contre les attaques Brute Force et autres comportements malveillants, avec gestion des jails, des filtres, des actions et des notifications.

**Fonctionnalités clés :**

- ✅ Installation Fail2ban (Debian/Ubuntu/RHEL)
- ✅ Configuration jails prêtes (SSH, Apache, Nginx, etc.)
- ✅ Personnalisation filtres et actions
- ✅ Notifications email (optionnel)
- ✅ Idempotence et logging structuré

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL 8+ |
| Packages | fail2ban, sendmail (optionnel pour notifications) |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `fail2ban_enabled` | bool | `true` | Activer/désactiver Fail2ban |
| `fail2ban_bantime` | str | `"600"` | Durée du bannissement (secondes) |
| `fail2ban_findtime` | str | `"600"` | Temps pour compter les tentatives |
| `fail2ban_maxretry` | int | `5` | Nombre de tentatives avant bannissement |
| `fail2ban_ignoreip` | list | `["127.0.0.1"]` | IPs à ignorer |
| `fail2ban_destemail` | str | `"root@localhost"` | Email notifications |
| `fail2ban_jails` | list | Voir exemple | Liste jails à configurer |
| `fail2ban_configuration` | dict | `{}` | Options de configuration Fail2ban |


***

## 💡 Exemple d’utilisation

### Base (SSH seulement)

```yaml
---
- name: Installer Fail2ban (SSH)
  hosts: all
  become: yes

  roles:
    - role: fail2ban_role
      vars:
        fail2ban_enabled: true
        fail2ban_bantime: 600
        fail2ban_findtime: 600
        fail2ban_maxretry: 5
        fail2ban_ignoreip:
          - "127.0.0.1"
          - "192.168.1.0/24"
        fail2ban_destemail: "admin@mycompany.com"
```


### Avancé (SSH + Apache + Nginx)

```yaml
        fail2ban_jails:
          - name: "sshd"
            filter: "sshd"
            port: "ssh"
            logpath: "/var/log/auth.log"
          - name: "apache-auth"
            filter: "apache-auth"
            port: "http,https"
            logpath: "/var/log/apache2/error.log"
          - name: "nginx-auth"
            filter: "nginx-auth"
            port: "http,https"
            logpath: "/var/log/nginx/error.log"
```


***

## 🧪 Tests recommandés

**Vérifier le service :**

```bash
systemctl status fail2ban
```

**Vérifier les jails :**

```bash
fail2ban-client status sshd
```

**Test idempotence :**

```bash
ansible-playbook fail2ban.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : installation + configuration = `changed`
- Exécutions suivantes : **0 changed** si aucune variable modifiée

***

## 📁 Structure du rôle

```text
fail2ban_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── install.yml       # Installation Fail2ban
│   ├── config.yml        # Configuration jails/filtres
│   └── main.yml          # Inclusion selon variables
├── templates/
│   └── jail.local.j2     # Template jail.local
├── handlers/
│   └── main.yml          # Restart Fail2ban
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Protection réseau contre Brute Force
- Configuration centralisée jails/filtres
- Notifications email
- Idempotence et logging structuré
- Prêt pour serveurs critiques

***

## 🤝 Contributing

1. Fork → Ajouter jail → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `fail2ban-client status` + logs
- 🚀 Features : Ajout de nouveaux filtres ou actions

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour l’installation et la configuration de Fail2ban sur toute infrastructure Linux moderne.** 🔒🚀[^1][^4]
<span style="display:none">[^10][^2][^3][^5][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://github.com/robertdebock/ansible-role-fail2ban

[^2]: https://galaxy.ansible.com/robertdebock/fail2ban

[^3]: https://galaxy.ansible.com/ui/repo/published/republic/infra/docs/fail2ban_role/

[^4]: https://galaxy.semaphoreui.com/views/guidugli/ansible-role-fail2ban

[^5]: https://ansible.build/roles/fail2ban/

[^6]: https://docs.gnuhealth.org/ansible/roles/fail2ban.html

[^7]: https://docs.debops.org/en/master/ansible/roles/fail2ban/

[^8]: https://ansible-playbook-baseline-online-server.readthedocs.io/en/latest/features/fail2ban.html

[^9]: https://git.food.dtu.dk/academic-support/ansible/ubuntu-common/-/tree/main/roles/fail2ban

[^10]: https://galaxy.ansible.com/ui/standalone/roles/buluma/fail2ban/documentation

