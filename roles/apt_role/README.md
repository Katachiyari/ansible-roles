# 📖 README.md **apt_role** - EXPLICATION DÉTAILLÉE

[
[
[

## 🎯 Description

Rôle Ansible minimaliste et performant pour **gérer les dépôts APT sur Debian/Ubuntu** : ajout, suppression et mise à jour de sources personnalisées, avec gestion des clés GPG associées.

**Fonctionnalités clés :**

- ✅ Ajout/suppression simple et sûre de dépôts APT
- ✅ Gestion automatique des clés GPG (import via URL/fichier)
- ✅ Mise à jour des caches APT (apt-get update) uniquement si nécessaire
- ✅ Idempotence totale
- ✅ Compatible avec environnements Cloud/Docker/VM


## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+ |
| Packages | apt, apt-transport-https |

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `apt_repositories` | list of dict | `[]` | Liste des dépôts APT à gérer |
|  |  |  | Ex: `{name: 'nginx', repo: 'ppa:nginx/stable', state: 'present', key_url: 'http://nginx.org/keys/nginx_signing.key'}` |
| `apt_update_cache` | bool | `true` | Mise à jour du cache APT si changements |

## 💡 Exemple d'utilisation

```yaml
---
- name: Configurer dépôts APT personnalisés
  hosts: all
  become: yes

  roles:
    - role: apt_role
      vars:
        apt_repositories:
          - name: "nginx"
            repo: "ppa:nginx/stable"
            state: present
            key_url: "http://nginx.org/keys/nginx_signing.key"
          - name: "customrepo"
            repo: "deb http://myrepo.example.com/debian stable main"
            state: present
            key_url: "http://myrepo.example.com/keys/repo.key"
        apt_update_cache: true
```


## 🧪 Tests recommandés

- Vérifier la présence des dépôts :

```bash
ansible -m shell -a "apt-cache policy" all
```

- Contrôle du cache APT :

```bash
ansible -m shell -a "apt-get update -qq" all
```

- Vérification des clés GPG :

```bash
ansible -m shell -a "apt-key list" all
```


## 🔄 Idempotence

```
1ère exécution : ajout dépôts/key, update cache ✅
2ème exécution : 0 changement (stable) ✅
```


## 📁 Structure du rôle

```
apt_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   └── main.yml          # Gestion des dépôts et clés
├── handlers/
│   └── main.yml          # Mise à jour cache APT
├── meta/
│   └── main.yml          # Métadonnées Galaxy et OS
├── README.md             # Documentation (ce fichier)
```


## 🚀 Avantages

- Gestion aisée et centralisée des dépôts pour Debian/Ubuntu
- Compatible avec APT standard et PPA
- Automatisation des clés associées
- Intégration facile dans pipeline CI/CD
- Nécessaire pour déploiements reproductibles et sécurisés


## 🤝 Contribution

1. Fork \& clone
2. Ajouter/simplifier les tâches ou vars
3. Tester avec `molecule`
4. Soumettre PR

## 🆘 Support

- GitHub Issues : [lien du projet]
- Communauté Ansible


## 📜 License

MIT License — voir fichier [LICENSE](LICENSE)

***

**README conforme aux meilleures pratiques Ansible. Rôle minimal, simple, performant et idempotent pour la gestion des dépôts APT.** 🚀
<span style="display:none">[^1][^2][^3][^4][^5][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://docs.ansible.com/projects/ansible/latest/galaxy/user_guide.html

[^2]: https://galaxy.ansible.com/ui/repo/published/arillso/system/content/role/apt_repositories

[^3]: https://github.com/claranet/ansible-role-apt

[^4]: https://docs.ansible.com/projects/ansible/latest/playbook_guide/playbooks_reuse_roles.html

[^5]: https://stackoverflow.com/questions/25230376/how-to-automatically-install-ansible-galaxy-roles

[^6]: https://docs.rockylinux.org/10/books/learning_ansible/04-ansible-galaxy/

[^7]: https://www.scaleway.com/en/docs/tutorials/ansible-galaxy/

[^8]: https://spacelift.io/blog/ansible-roles

[^9]: https://cloud.ibm.com/docs/schematics?topic=schematics-ansible-roles-galaxy

