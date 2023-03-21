#!/bin/bash
clear # clear pulisce il terminale
echo -e "\e[44;1m"
echo ""
echo "Benvenuto a \"Indovina il gioco\""
echo ""
echo -e "\e[0m"
echo ""
# introduzione del gioco

echo -ne "Inserisci il tuo \e[32musername\e[0m --> "
read userName # legge l'input dell'username
if [[ ${#userName} -eq 0 ]] # verifica che non è vuota
then # se è vuota esegue il them
    clear
    while # esegue il while finche non inserisce uno username non vuoto
    echo -e "\e[41;5mAttenzione!!\nUsername non inserito\nPer favore inserisca uno username\e[0m\n"
    echo -ne "Inserisci il tuo \e[32mnome\e[0m --> "
    read userName
    [[ ${#userName} -eq 0 ]] 
    do true 
    done
fi
clear
echo -ne "Inserisci un numero --> "
read userNumber  # legge il numero che l'utente inserisce
while [[ $userNumber -ne -1 ]] 
do  # verifica se il numero non è -1; se è uguale a -1, termina lo script
    pcRandNumber=$userNumber # inserisce il numero random
    difference=`expr $userNumber - $pcRandNumber` # esegue la differenza
    difference=$(echo ${difference#-}) # prende il valore assoluto
    if [[ difference -gt 100 ]] # se la differenza è maggiore di 100
    then
        echo -e "\e[1;30;41mNumero troppo grande/(piccolo)\e[0m"
    elif [[ difference -le 1000  && difference -ge 1 ]] 
    then    # se la differenza è minore/uguale di 100 e maggiore/uguale di 1
        echo -e "\e[1;37;41mNumero grande/(piccolo)\e[0m"
    else # se la differenza è uguale a 0
        echo -e "\e[1;37;42mBravo $userNamehai indovinato il numero\e[0m"
    fi
    echo -ne "Inserisci un numero --> "
    read userNumber # inserisce un'altro numero
done
echo "$userName, hai deciso di lasciare il gioco" # termine dello script