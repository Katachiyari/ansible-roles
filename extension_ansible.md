# 📝 Installation et gestion des outils Ansible avec pipx (en français) 🚀


***

## 🔧 Installation de pipx

```bash
sudo apt update
sudo apt install pipx
pipx ensurepath  # Ajoute pipx au PATH pour accéder aux outils installés
```

**Commentaire** :
pipx permet d’installer des outils Python dans des environnements virtuels isolés, évitant les conflits de dépendances.
L’ajout au PATH via `ensurepath` permet d’exécuter les outils directement depuis n’importe quel terminal.

***

## 📦 Installation des outils Ansible

```bash
pipx install ansible
pip install pipx --user  # Assure que pipx est à jour
pipx install ansible-lint
pipx install ansible-creator
pipx install ansible-navigator
pipx install molecule
pipx install yamllint
pipx install ansible-galaxy-importer
pipx install ansible-review
pipx install ansible-cmdb
pipx install ansible-inventory
pipx install ansible-vault
pipx install ansible-pull
pipx install ansible-lint-formatter
pipx install ansible-test
pipx install ansible-collections
pipx install ansible-role-skeleton
pipx install ansible-playbook-grapher
pipx install ansible-compat
pipx install precommit-ansible
```

**Commentaire** :
Chaque outil installé avec pipx fonctionne dans son propre environnement, garantissant une installation propre et isolée.

***

## ✅ Bonnes pratiques avec pipx

- Utilisez `pipx install` pour installer des outils globaux, jamais `pip install` (cela évite les conflits de dépendances).
- Vérifiez l’installation avec `pipx list` pour voir tous les outils disponibles.
- Mettez à jour un outil avec `pipx upgrade <nom-outil>`.
- Désinstallez un outil avec `pipx uninstall <nom-outil>`.
- Pour exécuter un outil temporairement sans l’installer : `pipx run <nom-outil>`.

***

## 📚 Références

- [pipx : gérer les paquets Python installés en local][^3]
- [Pipx facilite l’installation des outils Python][^1]
- [Bonnes pratiques Python][^5]

***

**pipx est l’outil idéal pour installer et gérer les outils Ansible de manière propre, sécurisée et isolée.** 🛠️
<span style="display:none">[^10][^2][^4][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://blog.stephane-robert.info/docs/developper/programmation/python/pipx/

[^2]: https://blog.crea-troyes.fr/6180/pip-pipx-et-pip3-tutoriel-dun-gestionnaire-de-paquets/

[^3]: https://cyberinstitut.fr/pipx-gerer-paquets-python-installes-en-local/

[^4]: https://linuxfr.org/news/python-partie-6-pip-et-pipx

[^5]: https://tuto.joliciel.org/docs/CYBER/Developpement_securise/Bonnes_pratiques_Python/

[^6]: https://docs.nitrokey.com/fr/software/nitropy/all-platforms/installation

[^7]: https://www.it-connect.fr/pip-vs-pipx-comprendre-leurs-differences-pour-mieux-gerer-vos-projets-python/

[^8]: https://www.reddit.com/r/learnpython/comments/1hj6vx4/about_using_pipx/

[^9]: https://fr.linkedin.com/pulse/découvre-pipx-ton-outil-essentiel-pour-python-saied-zouaoui-v180e

[^10]: https://docs.github.com/fr/actions/tutorials/build-and-test-code/python

