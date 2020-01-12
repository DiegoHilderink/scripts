#!/bin/bash
dir=$1
opc=$2
valores=$3
tipo=$4

declare -r localizacion=$(pwd)
declare -r pos=$(find /home/$(whoami) -name rTemplates)
declare -r i=1
declare -r ayudas=$(find /home/$(whoami) -name rAyuda)

declare -A mensajes

mensajes[0]="Generando directorio ${dir}."
mensajes[1]="Generando directorios template."
mensajes[2]="Generando ficheros template."

declare -A plantillas

plantillas[0]="${ayudas}/ayuda.txt"
plantillas[1]="${pos}/javascript/*";
plantillas[2]="${pos}/php/*";
plantillas[3]="${pos}/html/*";

help(){
    cat ${plantillas[0]}
    exit 0
}

comprobacionMin(){
    if [ $dir = '--help' ]
    then
        help
    elif [ -z $dir ]
    then
        echo -e "Falta el nombre del fichero. \n"
        help
    elif [[ $dir = -* ]]
    then
        help
    fi
}

comprobacionBase(){
    if [ -d $dir ]
    then
        echo "El fichero existe."
        read -n 1 -p "¿Desea borrar el archivo y generarlo de nuevo? [y/n] " ans;
        
        case $ans in
            y|Y|yes) rm -rf $dir;;
            n|N|no) exit 0;;
        esac
    fi
}

comprobacionMultiple(){
    if [ -z $valores ] || [ $valores -le 0 ]
    then
        echo 'Falta unario o el valor debe ser mayor a 0'
        exit 0
    fi
}

generarDirectorios(){
    echo "¿Que tipo de plantilla desea usar?"
    echo "JavaScript -> j"
    echo "PHP -> p"
    echo "HTML -> h"

    read -n 1 ans;
    echo ""
    
    case $ans in
        j|J) cp -r ${plantillas[1]} . ;;
        p|P) cp -r ${plantillas[2]} . ;;
        h|H) cp -r ${plantillas[3]} . ;;
        *) echo "No ha seleccionado tipo, cerrando..." && exit 0;;
    esac
}

generarSimple(){
    echo -e "\n${mensajes[0]}"
    mkdir $dir && cd $dir
}

crearRepo(){
        read -n 1 -p "¿Desea generar un nuevo repositorio de git? [y/n] " ans;
        echo ""
        
        if [ $ans = "y" ] || [ $ans = "Y" ] || [ $ans = "yes" ]
        then
            git init
        fi
}

generar(){
    comprobacionBase $dir
    generarSimple $dir
    crearRepo
    generarDirectorios
    cd $localizacion
}

multiple(){
    comprobacionBase $dir
    comprobacionMultiple $valores
    generarSimple $dir
    echo "${mensajes[1]}"
    echo "${mensajes[2]}"
    while [ $i -le $valores ]
    do
        mkdir $i
        cd $i
        generarDirectorios
        cd ..
        i=$(( i+1 ))
    done
    cd $localizacion
}

menu(){
    case $opc in
        "") generar $dir ;;
        "-r") multiple $dir $valores ;;
        "--help") help ;;
        *) echo "opcion incorrecta, consulte la ayuda con el comando --help" ;;
    esac
}

comprobacionMin $dir
menu $dir $opc




