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



exo2;
