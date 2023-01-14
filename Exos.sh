#!/bin/bash

# 1 / Ecrire un script qui prend en entrée un nombre entier et affiche tous les nombres de 1 à ce nombre.

seq 1 $1 ;	

# 2 / Ecrire un script qui prend en entrée une chaîne de caractères et renvoie le nombre de voyelles dans la chaîne.
 
 chaine=$1;
  # Explications : echo prend notre chaine $1 puis grâce au pipe, la passe dans le grep qui ne garde alors que les voyelles de $1
 # et wc compte les voyelles trouvées dans la ligne (donc une phrase grâce à -l) grâce à grep
  voyelles=`echo $chaine | grep -o "[aeiou]" | wc -l`;
  echo "Dans $chaine, il y a $voyelles voyelles.";

# 3 / Ecrire un script qui prend en entrée un tableau d'entiers et renvoie le plus grand élément du tableau.

 tbl=( 1 45 87 123 12 );
  max=${tbl[0]}; #on initialise la variable à l'index 0 pour la comparaison de la condition

  for i in "${tbl[@]}";
  do
      if [[ $i -gt $max ]]; then 
          max=$i; 
      fi
  done
 echo "Le plus grand élément du tableau est: $max"

# 4 / Ecrire un script qui prend en entrée deux chaînes de caractères et renvoie true si elles sont des anagrammes, false sinon.
# pour que cela soit un anagramme j'ai besoin qu'il y ait les memes lettres et le même nombre de lettres

  taille1=${#1}; #pour connaître la longueur du mot en entrée $1
  taille2=${#2}; #pour connaître la longueur du mot en entrée $2
  tri1=$(echo $1 | grep -o . | sort); #grep -o . extrait chaque caractère individuellement de la chaine $1 et tri les lettres par ordre alphabétique
  tri2=$(echo $2 | grep -o . | sort); #même chose pour $2

  if [[ $tri1 == $tri2 ]] && [[ $taille1 == $taille2 ]]
      then
          echo "anagramme" true;
      else 
          echo "pas anagramme" false;
  fi


# 5 / Ecrire un script qui prend en entrée un nombre entier et renvoie true si c'est un nombre premier, false sinon.
# definition : un nombre premier est un nombre entier supérieur à 1 , qui n’est divisible que par 1 et lui-même	

 nb=$1

 if [[ $nb -le 1 ]]; then
      echo "false"
      exit
  fi

  for ((i=2 ; i<$nb ; i++)); 
  do
      if [[ $(($nb % $i)) -eq 0 ]]; then #vérifie si le nombre donné en entrée est divisible par un nombre compris entre 2 et n-1
          echo "false"
          exit
      fi
  done
  echo "true"

# 6 / Ecrire un script qui prend en entrée un nombre entier et renvoie le nombre de chiffres de ce nombre.

  nb=$1;
  echo ${#nb}; #permet de compter le nombre de caractère chiffre dans le nombre
  #autre façon
  echo -n $nb | wc -m # -m car on a qu'un nombre 

# 7 / Ecrire un script qui prend en entrée un nombre entier et renvoie la somme des chiffres de ce nombre.

nb=$1;
sum=0;

for ((i=0;i<${#nb};i++)); 
do
   digit="${nb:$i:1}"; #  extraire la valeur de l'index $i
   sum=$(( $sum + $digit)); # permet d'avoir une nouvelle somme et à chaque passage de la boucle, rajoute le nouveau chiffre à additionner
done

echo $sum;
