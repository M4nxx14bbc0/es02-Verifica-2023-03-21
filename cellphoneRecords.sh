#!/bin/bash
FILE="./records.txt" # Creates records.txt file if not exists
if [ ! -f $FILE ]; then
    touch $FILE
fi

MENU=0 # Creates menu at the first use
echo -ne "\033[37;40;1m"
echo -e "Rubrica\n"
echo "Inserisci un numero tra quelle indicate nel menu"
echo "1) Inserisci contatto"
echo "2) Cerca contatto"
echo "3) Modifica contatto"
echo "4) Ordina contatto"
echo "5) Cancella contatto"
echo "6) Stampa la rubrica"
echo "7) Esci"
read MENU    # reads menu choice

while [[ $MENU -ne 7 ]] 
do   # "for" loop if menu choice is not working
    # switch part to execute menu choices
    case $MENU in
    1)  clear
        echo -e "Inserisci il \033[36;40;1mcognome\033[37;40;1m: "
        read -i cognome
        echo -e "Inserisci il \033[36;40;1mnome\033[37;40;1m: "
        read nome
        ricerca=$(grep -w -i "$cognome;$nome" records.txt) # Check if records.txt contains already a product with the code inserted
        if [[ -z $ricerca ]]
        then 
            echo -e "Inserisci il \033[36;40;1mnumero\033[37;40;1m: "
            read numero
            echo -e "Inserisci la \033[36;40;1mcitta\033[37;40;1m: "
            read citta
            # Output data of product inserted
            echo "$cognome $many $price \"$desc\"" | tee -a records.txt > /dev/null
            echo -e "\033[34;40;1mPremi invio per proseguire...\033[37;40;1m";;
        else
            echo -e "\033[37;40;1mATTENZIONE!!"
            echo "Esiste già un contatto --> ($cognome)"
            echo -e "\033[34;40;1mPremi invio per proseguire...\033[37;40;1m"
            read -n1 -s dummy
        fi
        ;;
    2)  clear
        echo -n "Inserisci il cognome: "
        read cognome
        ricerca=$(grep -w -i "$cognome" records.txt) # Check if records.txt contains already a product with the code inserted
        echo $ricerca | tee -a dummy.txt > /dev/null
        if [[ -z $ricerca ]]
        then
            echo "\033[37;40;1mATTENZIONE!!"
            echo "Non è stato trovato il contatto --> ($cognome)"
            echo "\033[34;40;1mPremi invio per proseguire...\033[37;40;1m"
            read -n1 -s dummy
        else
            echo "\033[30;42;1mTrovato!"
            read cognome nome numero citta < dummy.txt
            echo -e "\n$cgnome $nome $numero \"$citta\""
            rm dummy.txt
            echo "\033[34;40;1mPremi invio per proseguire...\033[37;40;1m"
            read -n1 -s dummy
        fi
        ;;
    3)  clear
        echo
        echo -n "Inserisci il cognome: "
        read cognome
        ricerca=$(grep -w -i "$cognome" records.txt) # Check if records.txt contains already a product with the code inserted
        if [[ -z $ricerca ]]
        then
            echo "\033[37;40;1mATTENZIONE!!"
            echo "Non è stato trovato il contatto --> ($cognome)"
            echo "\033[34;40;1mPremi invio per proseguire...\033[37;40;1m"
            read -n1 -s dummy
        else
            while IFS=, read cognome nome numero citta
            do
                if [ $cognomem == $cognome]
                then
                    nomem=$(echo $nome | tr -s "")
                    numerom=$(echo $numero | tr -s "")
                    cittam=$(echo $citta | tr -s "")
                fi
            done < "records.txt"
            
        fi
        ;;
    4)  clear
        sort records.txt > dummy.txt
        if [[ $? -eq 1 ]]
        then
            echo dummy.txt > records.txt
            echo "\033[32;40;1mOrdinamento eseguito"
            read -n1 -s dummy
        else
            echo "\033[37;40;1mATTENZIONE!!"
            echo "Problema con l'ordinamento"
            read -n1 -s dummy
        fi
        echo "\033[34;40;1mPremi invio per proseguire...\033[37;40;1m"
        rm dummy.txt
        ;;
    5)  clear
        echo -n "Inserisci il cognome"
        read -n5 code
        sed '/^${code}/d';;
        echo -e "\033[34;40;1mPremi invio per proseguire...\033[37;40;1m";;
    6)  clear
        echo -e "Elenco completo della rubrica\n"
        cat records.txt
        echo -e "\033[34;40;1mPremi invio per proseguire...\033[37;40;1m"
        read -n1 -s dummy;;
    *)  clear
        echo "Opzione non riconosciuta"
        echo -e "\033[34;40;1mPremi invio per proseguire...\033[37;40;1m";;
    esac
    clear # Displays menu after exec menu choice
    echo -ne "\033[37;40;1m"
    echo -e "Rubrica\n"
    echo "Inserisci un numero tra quelle indicate nel menu"
    echo "1) Inserisci contatto"
    echo "2) Cerca contatto"
    echo "3) Modifica contatto"
    echo "4) Ordina contatto"
    echo "5) Cancella contatto"
    echo "6) Stampa la rubrica"
    echo "7) Esci"
    read MENU    # reads menu choice
done
echo "Signed out" # Line when signing out