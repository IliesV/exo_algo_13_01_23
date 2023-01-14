#!/bin/bash
clear ;





function exo1(){
read -p "Veuillez entrer un nombre : " input
	for((i=1 ; i <= $input ; i++))
	do
		echo $i;
	done
}

function exo2(){
read -p "Veuillez entrer du texte  : " input

nbvoyelle=$(echo $input | grep -o -i "[aeiouy]" | wc --lines)
echo $nbvoyelle;
}


function exo3(){
read -p "Combien d'entiers dans le tableau ? " nbEntiers
	for ((i=1 ; i<=nbEntiers ; i++ ));
	do
		read -p "Entrez l'entier numéro "$i" : " entier
		entierArray+=($entier)
	done

echo "Le plus grand élément parmi les nombres donnés est : $(plusGrand "${entierArray[@]}")"

}

function exo4(){

read -p "Entrez votre texte : " input1
read -p "Entrez votre texte : " input2
resultat=$(checkAnagramme $input1 $input2)
echo $resultat

}


function exo5(){
read -p "Entrez un nombre entier : " number
resultat=$(checkPrime $number)
echo $resultat
}

function exo6(){

read -p "Entrez un nombre entier : " number

resultat=$(countChiffres $number)
echo "Le nombre de chiffres est : $resultat"
}

function exo7(){

read -p "Entrez un nombre entier: " number

result=$(sommeChiffres $number)
echo "La somme des chiffres de " $number " est : $result"
}

sommeChiffres() {
  number=$1
  somme=0
  for chiffre in $(echo $number | grep -o .); do
    somme=$((somme + chiffre))
  done
  echo $somme
}

countChiffres() {
  number=$1
  echo ${#number}
}

checkPrime() {
  number=$1
  if [ $number -lt 2 ]; then
    echo "false"
    return
  fi
  if [ $number -eq 2 ]; then
    echo "true"
    return
  fi
  if [ $((number % 2)) -eq 0 ]; then
    echo "false"
    return
  fi 
  for ((i=3; i*i<=number; i+=2));
  do
    if [ $((number % i)) -eq 0 ]; then
      echo "false"
      return
    fi
  done

  echo "true"
}


function checkAnagramme(){
chaine1=$(echo $1 | tr -d ' ' | tr '[:upper:]' '[:lower:]')
chaine2=$(echo $2 | tr -d ' ' | tr '[:upper:]' '[:lower:]')

chaine1=$(echo $chaine1 | fold -w1 | sort | tr -d '\n')
chaine2=$(echo $chaine2 | fold -w1 | sort | tr -d '\n')

if [ $chaine1 == $chaine2 ]; then
	echo "true"
else
	echo "false"
fi
}


function plusGrand(){
max=${1}
	for i in "${@:2}";
	do
		((i > max)) && max=$i
	done
echo $m ax
}

exercices=(
"1: Ecrire un script qui prend en entrée un nombre entier et affiche tous les nombres de 1 à ce nombre."
"2: Ecrire un script qui prend en entrée une chaîne de caractères et renvoie le nombre de voyelles dans la chaîne."
"3: Ecrire un script qui prend en entrée un tableau d'entiers et renvoie le plus grand élément du tableau."
"4: Ecrire un script qui prend en entrée deux chaînes de caractères et renvoie true si elles sont des anagrammes, false sinon."
"5: Ecrire un script qui prend en entrée un nombre entier et renvoie true si c'est un nombre premier, false sinon."
"6: Ecrire un script qui prend en entrée un nombre entier et renvoie le nombre de chiffres de ce nombre."
"7: Ecrire un script qui prend en entrée un nombre entier et renvoie la somme des chiffres de ce nombre."
"Quitter le script"
)

while true; do
  for i in "${!exercices[@]}"; do
    echo "$((i+1)): ${exercices[$i]}"
  done

  echo "Tapez le nombre de l'exercice que vous voulez tester ou 8 pour quitter."
  read input

  # Exécuter la fonction choisie ou quitter le script
  case $input in
    1) exo1 ;;
    2) exo2 ;;
    3) exo3 ;;
    4) exo4 ;;
    5) exo5 ;;
    6) exo6 ;;
    7) exo7 ;;
    8) break ;;
    *) echo "Pas une option valide" ;;
  esac
done