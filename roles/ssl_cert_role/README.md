# 📖 README.md **ssl_cert_role** – EXPLICATION DÉTAILLÉE

## 🎯 Description

Rôle Ansible pour **générer, déployer et gérer des certificats SSL/TLS** (auto-signés ou Let's Encrypt) sur Linux, avec gestion des clés privées et des fichiers de certificat.

**Fonctionnalités clés :**

- ✅ Génération de certificats auto-signés
- ✅ Déploiement de certificats Let's Encrypt (via certbot)
- ✅ Gestion des clés privées et des fichiers de certificat
- ✅ Idempotence et logging structuré

***

## 📋 Requirements

| Requirement | Version / Notes |
| :-- | :-- |
| Ansible | ≥ 2.10 |
| OS | Debian 10+, Ubuntu 18.04+, RHEL 8+ |
| Packages | openssl, certbot (optionnel) |


***

## ⚙️ Variables (defaults/main.yml)

| Variable | Type | Défaut | Description |
| :-- | :-- | :-- | :-- |
| `ssl_cert_type` | str | `"self-signed"` | `"self-signed"` ou `"letsencrypt"` |
| `ssl_cert_domains` | list | `["localhost"]` | Domaines pour le certificat |
| `ssl_cert_path` | str | `"/etc/ssl/certs"` | Chemin de déploiement |
| `ssl_cert_key_path` | str | `"/etc/ssl/private"` | Chemin clé privée |
| `ssl_cert_enabled` | bool | `true` | Activer/désactiver le rôle |


***

## 💡 Exemple d’utilisation

### Certificat auto-signé

```yaml
---
- name: Générer certificat auto-signé
  hosts: all
  become: yes
  roles:
    - role: ssl_cert_role
      vars:
        ssl_cert_type: "self-signed"
        ssl_cert_domains:
          - "example.com"
          - "www.example.com"
        ssl_cert_path: "/etc/ssl/certs"
        ssl_cert_key_path: "/etc/ssl/private"
```


### Certificat Let's Encrypt

```yaml
        ssl_cert_type: "letsencrypt"
        ssl_cert_domains:
          - "example.com"
          - "www.example.com"
        ssl_cert_path: "/etc/ssl/certs"
        ssl_cert_key_path: "/etc/ssl/private"
```


***

## 🧪 Tests recommandés

**Vérifier les certificats :**

```bash
ls -la /etc/ssl/certs/
ls -la /etc/ssl/private/
```

**Vérifier la validité :**

```bash
openssl x509 -in /etc/ssl/certs/example.com.crt -text -noout
```

**Test idempotence :**

```bash
ansible-playbook ssl-cert.yml --check
```


***

## 🔄 Idempotence

- 1ère exécution : génération/déploiement = `changed`
- Exécutions suivantes : **0 changed** si configuration identique

***

## 📁 Structure du rôle

```text
ssl_cert_role/
├── defaults/
│   └── main.yml          # Variables par défaut
├── tasks/
│   ├── self_signed.yml   # Génération auto-signée
│   ├── letsencrypt.yml   # Génération Let's Encrypt
│   └── main.yml          # Inclusion selon variables
├── handlers/
│   └── main.yml          # Nettoyage temporaires
├── meta/
│   └── main.yml          # Métadonnées Galaxy
└── README.md             # Ce fichier
```


***

## 🚀 Avantages

- Génération centralisée certificats SSL/TLS
- Support auto-signé et Let's Encrypt
- Idempotence et logging structuré
- Prêt pour serveurs web et applications sécurisées

***

## 🤝 Contributing

1. Fork → Ajouter gestion Let's Encrypt → Test
2. `molecule test` obligatoire
3. Pull Request avec tests

***

## 🆘 Support

- ❓ Questions : GitHub Issues
- 🐛 Bugs : Sortie `openssl x509` + logs
- 🚀 Features : Ajout gestion wildcard, notifications

***

## 📜 License

MIT License - [LICENSE](LICENSE)

***

**Rôle complet et sécurisé pour la gestion des certificats SSL/TLS sur toute infrastructure Linux moderne.** 🔐🚀

