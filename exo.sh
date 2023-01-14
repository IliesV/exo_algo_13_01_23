#!/bin/bash

function exo1(){
read -p "Veuillez entrer un nombre : " input
	for((i=1 ; i <= $input ; i++))
	do
		echo $i;
	done


}



exo1;
