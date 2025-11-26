#!/bin/bash

# Ansible role skeleton generator

# Verify execution from project root (roles directory must exist)
if [ ! -d "roles" ]; then
  echo "Erreur : le dossier 'roles' n'existe pas. Lancez ce script depuis la racine du projet."
  exit 1
fi

# Input role name
read -rp "Nom du rôle : " name_role

# Validate role name
if [ -z "$name_role" ]; then
  echo "Erreur : le nom du rôle est requis."
  exit 1
fi

# Confirm creation
echo "Création du rôle : $name_role"

# Check for existing role
if [ -d "roles/$name_role" ]; then
  echo "Erreur : le rôle 'roles/$name_role' existe déjà."
  exit 1
fi

# Create directory structure
mkdir -p "roles/$name_role"/{defaults,files,handlers,meta,tasks,templates,tests,vars}

# Create base YAML files
touch "roles/$name_role/defaults/main.yml"
touch "roles/$name_role/handlers/main.yml"
touch "roles/$name_role/meta/main.yml"
touch "roles/$name_role/tasks/main.yml"
touch "roles/$name_role/vars/main.yml"

# Create test files and documentation
touch "roles/$name_role/tests/inventory"
touch "roles/$name_role/tests/test.yml"
touch "roles/$name_role/README.md"

echo "Rôle '$name_role' créé avec succès dans roles/$name_role"
