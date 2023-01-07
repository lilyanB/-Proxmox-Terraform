## Samuel BARBARIN / Lilyan BASTIEN

# Proxmox-Terraform

terraform init    

terraform apply   


# le code

## terraform

partie qui spécifie la version

## provider

On configure l’URL qui nous permet d’accéder à Proxmox.
Cet URL est protégé par un token créé préalablement.

## Q2

Ici on accede au template « test-vm » et qu’on va créer une nouvelle machine « DEBIAN ».

## Q3

Ici on double manuellement le nombre de cœurs et de mémoire sur la machine « CLONED » depuis « DEBIAN ».

## Q4

Avec "start_at_boot" sur "true" pour que les deux machines virtuelles démarrent automatiquement lors d'un redémarrage.
Avec "delay_start" qui à la valeur 60 pour la machine virtuelle "vm1". Alors cette dernière démarre 60 secondes après "vm2".


## Q7

Script qui utilise la propriété "count" pour définir le nombre de machine virtuelle à déployer. Cette propriété est utilisée pour déployer 10 serveurs web et 2 serveurs base de données. Nous utilisons le count dans le nom de chaque VM pour plus de lisibilité.