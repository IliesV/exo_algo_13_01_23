#!/bin/bash

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
echo $max
}

exo4;
