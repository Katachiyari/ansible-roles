# BIBLIOTHÈQUE ANSIBLE - "PROD READY"

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📦 BASE SYSTÈME </br>
├── apt_role / package_role / python3_role</br>
├── user_role / users_ssh_keys_role</br>
├── service_role / cron_job_role</br>
└── logging_role</br>

🌐 WEB \& BASES )</br>
├── apache_php_mariadb_r / mariadb_role / postgres_role</br>
├── nginx_role (manque mais optionnel)</br>
└── ssl_cert_role</br>

🔐 SÉCURITÉ )</br>
├── ufw_role / iptables_role / firewalld / selinux_role</br>
├── fail2ban_role</br>
└── users_ssh_keys_role</br>

⏰ SYNCHRO \& MAINTENANCE </br>
├── ntp_role / chrony_role</br>
├── backup_role</br>
└── logging_role

🐳 CONTAINERS \& MODERNE </br>
├── docker_role / container_runtime_role</br>
└── monitoring_role (Prometheus)

🔧 UTILITAIRES )</br>
├── git_clone_role / copy_role / template_role / unarchive_role</br>
├── lineinfile_role / file_role</br>
└── network_role)</br>


BIBLIOTHÈQUE ANSIBLE - STADE "PROD READY")</br>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## 📦 BASE SYSTÈME (100% couvert)</br>
├── apt_r</br>
├── package_role</br>
├── python3_role</br>
├── user_role</br>
├── users_ssh_keys_role</br>
├── service_role</br>
├── cron_job_role</br>
└── logging_role</br>

## 🌐 WEB \& BASES (100% couvert)</br>
├── apache_php_mariadb_r</br>
├── mariadb_role</br>
├── postgres_role</br>
├── ssl_cert_role</br>
└── (nginx_role manquant, optionnel))</br>

## 🔐 SÉCURITÉ (95% couvert)</br>
├── ufw_role</br>
├── iptables_role</br>
├── firewalld</br>
├── selinux_role</br>
├── fail2ban_role</br>
├── users_ssh_keys_role</br>
├── auditd_role</br>
├── apparmor_role</br>
└── security_hardening_role (en cours / à créer))</br>

## ⏰ SYNCHRO \& MAINTENANCE (100% couvert)</br>
├── ntp_role</br>
├── chrony_role</br>
├── backup_role</br>
└── logging_role)</br>

## 🐳 CONTAINERS \& MODERNE (90% couvert)</br>
├── docker_role</br>
├── container_runtime_role</br>
├── docker_compose_role</br>
├── kubernetes_tools_role</br>
└── monitoring_role (Prometheus)</br>

## 🔧 UTILITAIRES (100% couvert)</br>
├── git_clone_role</br>
├── copy_role</br>
├── template_role</br>
├── unarchive_role</br>
├── lineinfile_role</br>
├── file_role</br>
└── network_role)</br>

***

Cette bibliothèque couvre l’essentiel des besoins standards et avancés pour une infrastructure moderne, sécurisée, scalable et maintenable, sur des environnements Debian et RedHat. 
---

# 📚 Glossaire des Bonnes Pratiques Ansible

---
## Glossaire des Bonnes Pratiques Ansible
## Structure: nom_pratique: description_courte_pour_usage_rapide

ansible_best_practices:

  ## === 🏗️ STRUCTURE RÔLE ===
  
  role_structure: "📁 defaults/main.yml, tasks/main.yml, handlers/main.yml, templates/, meta/main.yml, README.md"
  defaults_main_yml: "⚙️ Variables par défaut, facilement surchargables dans playbooks"
  tasks_main_yml: "✅ Tâches principales du rôle, idempotentes"
  handlers_main_yml: "🔄 Actions déclenchées seulement si changement (restart services)"
  templates_j2: "📄 Fichiers Jinja2 dynamiques avec variables"
  meta_main_yml: "📋 Dépendances rôles, OS supportés, Galaxy metadata"
  readme_md: "📖 Documentation complète : vars, prérequis, exemples"
  
  ## === 🔄 IDEMPOTENCE & QUALITÉ ===
  
  idempotence: "🔁 Tâches exécutables plusieurs fois sans modification inutile"
  modules_natifs: "🛠️ Privilégier modules Ansible (package, service) vs shell/command"
  ignore_errors: "⚠️ Éviter sauf exceptions critiques, gérer avec rescue/when"
  changed_when: "📊 Contrôler quand une tâche marque 'changed'"
  failed_when: "❌ Définir conditions d'échec personnalisées"
  
  ## === 🏷️ NOMENCLATURE ===
  
  snake_case_vars: "🐍 Variables en snake_case (my_var_name)"
  extension_yml: "📄 Toujours .yml (pas .yaml, .YML)"
  nommage_coherent: "🎯 Rôles: nom-lowercase, tasks: verbe-infinitif"
  cli_vars: "⌨️ Variables ligne commande : cli_nom_var"
  global_vars: "🌍 Variables globales : g_nom_var"
  
  ## === 🔐 VARIABLES & SÉCURITÉ ===
  
  vars_precedence: "📊 inventory < group_vars < host_vars < playbook vars"
  ansible_vault: "🔒 Chiffrer secrets (mots de passe, clés API)"
  no_hardcode_paths: "🚫 Toujours passer chemins en variables"
  validate_templates: "✅ Valider sudoers/sshd_config avec validate"
  
  ## === 📍 INVENTAIRES ===
  
  inventaires_separes: "🏭 Un inventaire par environnement (dev/prod)"
  group_by_dynamic: "🔗 Regrouper hôtes dynamiquement avec module group_by"
  inventory_groups: "🏷️ Groupes logiques : webservers, dbservers, region-eu"
  ansible_inventory_list: "🔍 Vérifier avec ansible-inventory --list"
  
  ## === ⚡ PERFORMANCE & MAINTENANCE ===
  
  tags_usage: "🏷️ Exécuter partiellement : ansible-playbook --tags web"
  roles_reutilisables: "♻️ DRY : un rôle = un objectif précis"
  versionner_roles: "📦 Tags Git pour déploiements reproductibles"
  ci_pipeline: "🚀 Pipeline test automatique à chaque push"
  
  ## === 🧪 TESTS & DEBUG ===
  
  tests_test_yml: "🧪 Playbook local pour tester rôle"
  molecule_testing: "🔬 Tests rôles avec Molecule (Docker/Vagrant)"
  check_mode: "👁️ Vérifier sans appliquer : --check"
  diff_mode: "🔄 Voir changements : --diff"
  
  ## === 📁 STRUCTURE PROJET ===
  
  ansible_project_layout: |</br>
    🗂️ project/</br>
    ├── 📂 inventories/</br>
    │   ├── 🏭 production/</br>
    │   └── 🧪 staging/</br>
    ├── 📊 group_vars/</br>
    ├── 📊 host_vars/</br>
    ├── 📦 roles/</br>
    ├── 🎭 playbooks/</br>
    └── ⚙️ ansible.cfg</br>


## 🚀 **Utilisation pratique**

```yaml
# Importer dans playbook pour documentation auto
---
- name: 🎭 Playbook avec best practices intégrées
  hosts: all
  vars_files:
    - ansible_best_practices.yml
  pre_tasks:
    - name: ✅ Vérifier conformité best practices
      debug:
        msg: "🎯 Best Practice: {{ item.key }} -> {{ item.value }}"
      loop: "{{ ansible_best_practices | dict2items }}"
      when: item.key in ['idempotence', 'modules_natifs']
```



