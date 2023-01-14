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

function plusGrand(){
max=${1}
	for i in "${@:2}";
	do
		((i > max)) && max=$i
	done
echo $max
}

exo3;
