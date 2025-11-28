# 📝 Best Practices Ansible 🚀


***

## ✅ Pratiques recommandées

### 🧩 FQCN (Fully Qualified Collection Names)

- Utilisez toujours `ansible.builtin.xxx` au lieu des noms courts pour éviter les conflits et garantir la compatibilité future.
Exemple : `ansible.builtin.file` au lieu de `file`.


### 🔁 Idempotence stricte

- Les tâches ne doivent rien changer si l’état souhaité est déjà atteint.
- Utilisez le module `ansible.builtin.file` ou `ansible.builtin.template` pour vérifier l’état avant modification.


### 🛠️ Pas de modules shell/command inutiles

- Privilégiez les modules dédiés (`apt`, `service`, `file`).
- Si `command` est inévitable, utilisez obligatoirement les arguments `creates` ou `removes`.


### 🔄 Gestion des états

- Utilisez exclusivement les **handlers** pour les redémarrages de services.
Exemple : `notify: restart nginx` dans la tâche, et le handler dédié dans `handlers/main.yml`.


### 🔐 Sécurité et Permissions

- Définissez explicitement `owner`, `group` et `mode` lors de la création de fichiers ou dossiers.
Exemple :

```yaml
ansible.builtin.file:
  path: /etc/myapp/config.yml
  owner: myapp
  group: myapp
  mode: "0600"
```


***

## 📂 Organisation du code

### 🗂️ Structure de répertoires claire

- Suivez les conventions Ansible :

```
project/
├── inventory/
│   ├── production/
│   └── development/
├── group_vars/
├── host_vars/
├── roles/
│   ├── common/
│   ├── nginx/
│   └── postgresql/
├── playbooks/
└── .git/
```


### 🔄 Factorisation (DRY)

- Utilisez des **rôles** et des **collections** pour éviter la répétition.
- Stockez vos projets Ansible dans un système de contrôle de version comme **Git**.

***

## 📊 Gestion des variables

### 📁 Séparation logique

- Séparez les variables de la logique avec `group_vars` et `host_vars`.
- Utilisez des inventaires distincts pour chaque environnement (développement, production).

***

## 🔒 Sécurité renforcée

### 🔐 Gestion des secrets

- Gérez les informations sensibles avec **Ansible Vault** ou un autre système de gestion des secrets.


### ⚠️ Privilèges limités

- Limitez l’élévation des privilèges (`become: true`) aux tâches qui en ont absolument besoin.

***

## 🧪 Fiabilité et Tests

### 📦 Versions explicites

- Évitez d’utiliser `latest` pour les paquets ou sources Git.
- Spécifiez des versions explicites pour garantir la prévisibilité.


### ❌ Contrôle des erreurs

- Utilisez `failed_when` pour un contrôle précis des conditions d’échec, plutôt que `ignore_errors`.


### 🔍 Validation automatique

- Intégrez **ansible-lint** dans des hooks de pre-commit ou dans votre pipeline CI/CD pour une validation automatique du code.

***

## 🏗️ Rôles incontournables

### 🖥️ Système \& Base

| Rôle | Description |
| :-- | :-- |
| `common` | Paquets de base (curl, vim, git, htop, etc.) |
| `users` | Gestion des utilisateurs, groupes, clés SSH |
| `sudo` | Configuration des droits sudoers |
| `sshd` | Sécurisation du service SSH |
| `ntp` / `chrony` | Synchronisation de l’horloge |
| `timezone` | Définition du fuseau horaire |
| `hostname` | Configuration du nom de la machine |
| `firewall` | Gestion générique (UFW/Firewalld) |
| `system_update` | Mise à jour complète des paquets |
| `swap` | Création et montage de fichier swap |
| `locale` | Configuration des locales |
| `logrotate` | Rotation des logs |
| `cron` | Tâches planifiées |

### 🌐 Serveurs Web \& Proxy

| Rôle | Description |
| :-- | :-- |
| `nginx` | Installation et configuration |
| `apache` | Serveur web classique |
| `haproxy` | Load balancer et proxy |
| `traefik` | Reverse proxy moderne |
| `certbot` | Certificats SSL Let's Encrypt |
| `varnish` | Cache HTTP |

### 🗃️ Bases de Données \& Cache

| Rôle | Description |
| :-- | :-- |
| `mysql` | Serveur MySQL |
| `mariadb` | Serveur MariaDB |
| `postgresql` | Serveur PostgreSQL |
| `redis` | Cache in-memory |
| `mongodb` | Base NoSQL |
| `elasticsearch` | Moteur de recherche |
| `memcached` | Cache d’objets |

### 🐍 Langages \& Runtimes

| Rôle | Description |
| :-- | :-- |
| `php` | PHP et ses extensions |
| `nodejs` | Node.js et npm/yarn |
| `java` | JDK/JRE |
| `python` | Versions Python et pip |
| `golang` | Environnement Go |
| `ruby` | Environnement Ruby |

### 📦 Conteneurisation \& Orchestration

| Rôle | Description |
| :-- | :-- |
| `docker` | Installation Docker |
| `docker_compose` | docker-compose |
| `kubernetes` | Bootstrapping cluster |
| `k3s` | Distribution Kubernetes légère |
| `podman` | Alternative à Docker |

### 📈 Monitoring \& Logging

| Rôle | Description |
| :-- | :-- |
| `prometheus` | Serveur de monitoring |
| `node_exporter` | Agent de métriques |
| `grafana` | Dashboard de visualisation |
| `filebeat` | Transfert de logs |
| `zabbix_agent` | Agent Zabbix |
| `datadog` | Agent Datadog |

### 🔐 Sécurité \& Réseau

| Rôle | Description |
| :-- | :-- |
| `fail2ban` | Bannissement d’IPs |
| `wireguard` | VPN moderne |
| `openvpn` | VPN classique |
| `selinux` | Configuration/désactivation SELinux |

### 🔄 CI/CD \& Outils Dev

| Rôle | Description |
| :-- | :-- |
| `git` | Configuration avancée |
| `jenkins` | Serveur CI/CD |
| `gitlab_runner` | Agent GitLab CI |


***

## 🛠️ Bonnes pratiques à retenir

- ✅ Utilisez **FQCN** pour tous les modules
- ✅ Garantissez l’**idempotence**
- ✅ Évitez les modules `shell`/`command` inutiles
- ✅ Utilisez les **handlers** pour les redémarrages
- ✅ Définissez explicitement les permissions
- ✅ Structurez clairement vos projets
- ✅ Séparez les variables des playbooks
- ✅ Utilisez Ansible Vault pour les secrets
- ✅ Limitez l’élévation des privilèges
- ✅ Spécifiez des versions explicites
- ✅ Utilisez `failed_when` pour contrôler les échecs
- ✅ Intégrez ansible-lint dans votre CI/CD

***

## 📚 Sources

- [Ansible in 2025: Best Practices for Configuration and Provisioning][^1]
- [50 Ansible Best Practices to Follow][^2]
- [Ansible tips and tricks][^3]
<span style="display:none">[^4][^5][^6][^7]</span>

<div align="center">⁂</div>

[^1]: https://www.gocodeo.com/post/ansible-in-2025-best-practices-for-configuration-and-provisioning

[^2]: https://spacelift.io/blog/ansible-best-practices

[^3]: https://docs.ansible.com/projects/ansible/latest/tips_tricks/index.html

[^4]: https://www.reddit.com/r/ansible/comments/1fo7vrx/what_are_the_best_practices_for_organizing/

[^5]: https://medium.datadriveninvestor.com/ansible-tags-in-2025-handy-shortcut-or-anti-pattern-14556e1984a0

[^6]: https://www.youtube.com/watch?v=wmkwVZApMNM

[^7]: https://forum.ansible.com/t/advices-on-roles-and-projects-best-practices/44618

