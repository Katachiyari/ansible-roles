# 📖 README.md **command_role** - EXPLICATION DÉTAILLÉE


## 🎯 **Description**

Rôle Ansible utilitaire pour **exécuter des commandes système de manière sécurisée et idempotente**. Wrapper intelligent autour des modules `command`, `shell` et `script` avec gestion d'erreurs, validation de sortie et logging centralisé.

**Fonctionnalités clés :**

- ✅ Wrapper sécurisé pour `command` / `shell` / `script`
- ✅ **Idempotence intelligente** (changed_when, creates, removes)
- ✅ Validation sortie (regex, return code, JSON)
- ✅ Logging structuré avec timestamps
- ✅ Timeout et retry configurables
- ✅ **Sécurité** : échappement variables, validation input


## 📋 **Requirements**

| Requirement | Version | Notes |
| :-- | :-- | :-- |
| Ansible | ≥2.10 | Testé 2.14+ |
| Python | ≥3.6 | pip requis pour scripts |

**Dépendances externes :** Aucune

## ⚙️ **Variables (defaults/main.yml)**

### **Configuration globale**

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `command_timeout` | int | `30` | Timeout par défaut (secondes) |
| `command_retries` | int | `0` | Nombre de tentatives |
| `command_log_dir` | str | `/var/log/ansible/commands` | Répertoire logs |

### **Liste des commandes**

| Variable | Type | Exemple | Description |
| :-- | :-- | :-- | :-- |
| `commands` | list | Voir exemple | Liste commandes à exécuter |

**Structure commande :**

```yaml
- name: "Vérifier disque"
  cmd: "df -h /"
  module: "shell"
  creates: "/tmp/disk_checked"
  changed_when: false
  register: result
  validate:
    return_code: 0
    stdout_regex: "^Filesystem"
```


## 💡 **Exemple d'utilisation**

### **Playbook simple**

```yaml
---
- name: Exécuter commandes système sécurisées
  hosts: all
  become: yes
  roles:
    - role: command_role
      vars:
        commands:
          - name: "Vérifier uptime"
            cmd: "uptime"
            module: "command"
            register: uptime
            
          - name: "Nettoyer tmp (idempotent)"
            cmd: "find /tmp -mtime +7 -delete"
            module: "shell"
            creates: "/tmp/cleaned"
            timeout: 60
```


### **Avec validation et retry**

```yaml
        commands:
          - name: "Vérifier service"
            cmd: "systemctl is-active nginx"
            module: "command"
            retries: 3
            delay: 5
            validate:
              return_code: [0, 3]
              stdout: "active"
              
          - name: "Script externe"
            cmd: "/usr/local/bin/custom-script.sh"
            module: "script"
            validate:
              stdout_json: true
```


## 🧪 **Testing**

### **Vérification rapide**

```bash
# Logs commandes
ansible all -m shell -a "ls -la /var/log/ansible/commands/"

# Tester idempotence
ansible-playbook site.yml --check
```


### **Validation sortie**

```bash
ansible all -m shell -a "cat /var/log/ansible/commands/*.log"
```


## 🔄 **Idempotence**

```
✅ creates/removes pour commandes idempotentes
✅ changed_when personnalisé
✅ register + conditionnel
✅ 2ème exécution : 0 changed ✅
```


## 📁 **Role Structure**

```
command_role/
├── 📁 defaults/
│   └── main.yml              # Timeout, retries, log_dir
├── 📁 tasks/
│   └── main.yml              # Boucle sur commands[]
├── 📁 templates/
│   └── command-logger.sh.j2  # Script logging
├── 📁 handlers/
│   └── main.yml              # Nettoyage logs
├── 📁 meta/
│   └── main.yml              # Galaxy metadata
└── 📄 README.md              # Documentation
```


## 🎨 **Tags disponibles**

| Tag | Description |
| :-- | :-- |
| `command_exec` | Exécution commandes |
| `command_log` | Création logs |
| `command_validate` | Validation sortie |

```bash
ansible-playbook site.yml --tags "command_exec"
```


## 🖥️ **Compatibilité**

| OS Family | Versions | Statut |
| :-- | :-- | :-- |
| Debian | 10-12 | ✅ Production |
| Ubuntu | 18.04-24.04 | ✅ Production |
| RHEL | 8-9 | ✅ Production |

## 🔐 **Sécurité**

- ✅ **Échappement automatique** variables
- ✅ **Timeout** évite blocages
- ✅ **Validation return_code** systématique
- ✅ **Logs** isolés et rotatifs
- ✅ **No sudo** par défaut


## 🚀 **Use Cases**

1. **Vérifications système** (df, uptime, services)
2. **Scripts custom** idempotents
3. **Migration** depuis raw `shell/command`
4. **Debugging** avec logs structurés
5. **Pipeline CI/CD** validations

## 📈 **Performance**

```
Timeout : configurable (30s default)
Retry   : configurable (0 default)
Logging : asynchrone
Overhead: négligeable
```


## 🤝 **Contributing**

1. Fork → Ajouter module type → Test
2. `molecule test` ✅
3. Nouveaux validateurs (JSON, YAML, regex)

## 🆘 **Support**

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Log + `ansible-playbook -vvv`
- 🚀 Features : `validate_json`, `validate_yaml`


## 📜 **License**

MIT License - [LICENSE](LICENSE)

***

**Rôle utilitaire **essentiel** pour remplacer tous les `shell/command` raw par une approche **sécurisée, idempotente et observable**.** 🔧🚀[^1][^2]
<span style="display:none">[^10][^3][^4][^5][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://blog.stephane-robert.info/docs/infra-as-code/gestion-de-configuration/ansible/ecrire-roles/

[^2]: https://docs.ansible.com/projects/ansible/latest/playbook_guide/playbooks_reuse_roles.html

[^3]: https://github.com/docsible/docsible

[^4]: https://forum.ansible.com/t/easy-documentation-for-roles-collection/6043

[^5]: https://www.rubydoc.info/gems/ansible-role/1.1.0

[^6]: https://spacelift.io/blog/ansible-roles

[^7]: https://devopssec.fr/article/roles-ansible

[^8]: https://docs.rockylinux.org/10/fr/books/learning_ansible/04-ansible-galaxy/

[^9]: https://gitlab.com/glienhart/ansible/ansible-roles-usage-example/-/blob/main/README.md

[^10]: https://blog.stephane-robert.info/post/ansible-gendoc-role-collection/

