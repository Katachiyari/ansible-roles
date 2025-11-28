# 📚 Glossaire des rôles Ansible


***

## 📂 Structure du glossaire

Chaque rôle est présenté sous la forme :
**nom_du_role: description_courte_pour_usage_rapide**

***

## 📚 Liste des rôles

| Rôle | Description |
| :-- | :-- |
| `apache_php_mariadb_r` | Installation et configuration d’une stack web (Apache + PHP + bases de données) – très utilisé en déploiement web. |
| `apt_r` | Gestion générique des paquets apt sur Debian. |
| `package_role` | Gestion générique des paquets multi-OS (apt/yum/dnf). |
| `service_role` | Gestion des services systèmes (démarrage, activation, redémarrage). |
| `copy_role` | Déploiement de fichiers statiques avec contrôle permissions. |
| `template_role` | Déploiement de fichiers templates Jinja2 dynamiques. |
| `user_role` | Gestion des utilisateurs systèmes (création, modification, suppression). |
| `firewalld_role` | Configuration firewalld (RedHat) avec ports/services. |
| `ufw_role` | Configuration UFW (Debian/Ubuntu) avec ports/services. |
| `iptables_role` | Application de règles iptables personnalisées persistantes. |
| `mariadb_role` | Installation MariaDB sécurisée + utilisateur dédié. |
| `postgres_role` | Installation PostgreSQL + utilisateur dédié. |
| `ntp_role` | Configuration NTP pour synchronisation horaire. |
| `chrony_role` | Configuration Chrony (NTP moderne) pour synchronisation. |
| `git_clone_role` | Clonage/mise à jour de dépôts Git avec permissions. |
| `lineinfile_role` | Modification/insertion de lignes dans fichiers config. |
| `selinux_role` | Configuration SELinux (RedHat) enforcing/permissive/disabled. |
| `unarchive_role` | Extraction d'archives (tar, zip) avec permissions. |
| `python3_role` | Installation Python3 + pip pour Debian/RedHat. |
| `logging_role` | Gestion centralisée des logs (rsyslog, journald, logrotate). |
| `backup_role` | Sauvegarde des fichiers, bases ou configurations critiques. |
| `monitoring_role` | Installation/configuration d’outils de supervision (Prometheus, etc.). |
| `fail2ban_role` | Protection automatique par blocage d’IP suspectes. |
| `ssl_cert_role` | Gestion automatique des certificats SSL/TLS (Let’s Encrypt). |
| `docker_role` | Installation et configuration Docker/container runtime. |
| `cron_job_role` | Gestion centralisée des tâches planifiées crontab. |
| `users_ssh_keys_role` | Gestion fine des clés SSH et accès utilisateurs. |
| `network_role` | Configuration réseau avancée (interfaces, VLAN, bonding). |
| `vault_role` | Gestion sécurisée des secrets (HashiCorp Vault integration). |
| `nginx_role` | Installation/configuration NGINX serveur web/reverse proxy. |
| `redis_role` | Installation/configuration Redis cache/in-memory store. |
| `elasticsearch_role` | Installation/configuration Elasticsearch search engine. |
| `prometheus_role` | Installation/configuration Prometheus monitoring stack. |
| `grafana_role` | Installation/configuration Grafana dashboards. |
| `certbot_role` | Gestion automatique certificats Let’s Encrypt standalone. |
| `motd_role` | Personnalisation message du jour (MOTD) avec stats système. |


***

## 📚 Références

- [Un rôle Ansible, c'est quoi ?][^1]
- [Ansible Galaxy : Collections et Rôles][^2]
- [Comprendre et utiliser les rôles sur Ansible][^3]
- [Ansible Galaxy : Tout ce que vous devez savoir][^4]
- [Ecrire correctement des rôles Ansible][^6]

***

**Ce glossaire permet une identification rapide des rôles Ansible selon leur usage et facilite la gestion des projets d’automatisation.** 🚀
<span style="display:none">[^5][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://www.redhat.com/fr/topics/automation/what-is-an-ansible-role

[^2]: https://docs.rockylinux.org/10/fr/books/learning_ansible/04-ansible-galaxy/

[^3]: https://devopssec.fr/article/roles-ansible

[^4]: https://geekflare.com/fr/ansible-galaxy/

[^5]: https://www.formatux.fr/formatux-devops/module-020-ansible-niveau1/index.html

[^6]: https://blog.stephane-robert.info/docs/infra-as-code/gestion-de-configuration/ansible/ecrire-roles/

[^7]: https://techblog.ingeniance.fr/gestion-des-roles-sous-ansible/

[^8]: https://les-enovateurs.com/ansible-galaxy-scripts-existants

[^9]: https://www.editions-eni.fr/livre/red-hat-ansible-engine-gerez-l-automatisation-de-vos-configurations-linux-9782409027291/table-des-matieres.pdf

