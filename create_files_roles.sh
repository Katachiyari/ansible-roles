#!/bin/bash

# Script de création d'un squelette de rôle Ansible
# Utilisation : lancer depuis la racine du repo (là où se trouve le dossier "roles")

# Vérifier qu'on est bien à la racine (dossier roles présent)
if [ ! -d "roles" ]; then
  echo "Erreur : le dossier 'roles' n'existe pas dans le répertoire courant."
  echo "Place-toi à la racine de ton projet Ansible (là où il y a le dossier 'roles')."
  exit 1
fi

# Demander le nom du rôle
read -rp "Nom du rôle : " name_role

# Vérifier que le nom n'est pas vide
if [ -z "$name_role" ]; then
  echo "Erreur : le nom du rôle ne peut pas être vide."
  exit 1
fi

# Afficher le nom du rôle
echo "Création du rôle : $name_role"

# Vérifier si le rôle existe déjà
if [ -d "roles/$name_role" ]; then
  echo "Erreur : le rôle 'roles/$name_role' existe déjà."
  exit 1
fi

# Créer l'arborescence du rôle
mkdir -p "roles/$name_role"/{tasks,defaults,handlers,vars,templates,files,meta}

# Créer les fichiers main.yml de base
touch "roles/$name_role/tasks/main.yml"
touch "roles/$name_role/defaults/main.yml"
touch "roles/$name_role/handlers/main.yml"
touch "roles/$name_role/vars/main.yml"
touch "roles/$name_role/meta/main.yml"

echo "Rôle '$name_role' créé dans roles/$name_role"
