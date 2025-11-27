---
- name: Installer et configurer Redis cache serveur
  hosts: cache_servers
  become: yes

  roles:
    - role: redis_role
      vars:
        redis_port: 6379
        redis_bind: "0.0.0.0"
        redis_requirepass: "MonMotDePasseTresSecurise"
        redis_maxmemory: "512mb"
        redis_config:
          appendonly: "yes"
          appendfilename: "appendonly.aof"
          save:
            - "900 1"
            - "300 10"
            - "60 10000"
        redis_enabled: true
# Ce rôle déploie Redis sécurisé, mémoire limitée, sauvegardes persistantes,
# prêt pour cache haute performance, session store, ou broker léger.
