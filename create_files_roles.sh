#!/bin/bash

# Ansible role skeleton generator (Full Structure)

# Verify execution from project root
if [ ! -d "roles" ]; then
  echo "Erreur : Dossier 'roles' introuvable. Exécutez depuis la racine du projet."
  exit 1
fi

# Input role name
read -rp "Nom du rôle : " name_role

# Validate role name
if [ -z "$name_role" ]; then
  echo "Erreur : Nom du rôle requis."
  exit 1
fi

# Check for existing role
if [ -d "roles/$name_role" ]; then
  echo "Erreur : Le rôle 'roles/$name_role' existe déjà."
  exit 1
fi

echo "Création du rôle complet : $name_role"

# Create standard directories
mkdir -p "roles/$name_role"/{defaults,files,handlers,meta,tasks,templates,tests,vars}

# Create advanced plugin directories (Python extensions)
mkdir -p "roles/$name_role"/{library,module_utils,lookup_plugins,filter_plugins,action_plugins}

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

# Create .gitkeep for advanced folders to ensure git tracks them even if empty
touch "roles/$name_role/library/.gitkeep"
touch "roles/$name_role/module_utils/.gitkeep"
touch "roles/$name_role/lookup_plugins/.gitkeep"
touch "roles/$name_role/filter_plugins/.gitkeep"
touch "roles/$name_role/action_plugins/.gitkeep"

echo "Rôle '$name_role' créé avec structure étendue dans roles/$name_role"
