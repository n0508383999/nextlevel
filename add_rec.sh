#! /bin/bash

######################################search name function##################################

search_name ()
{
#allnames=$(grep -i  $1 recordFileName.txt | cut -f1 -d "," | tr "\n" ",")
allnames=$(cut recordFileName.txt -f1 -d "," | grep -i $1 |tr "\n" "," )
IFS=","
	echo $allnames
	if [[ -z $allnames ]]
	then
	echo the record does not exist
	
	return 1 
	fi
	PS3="please choose record: "
	select records in $allnames "non of them" exit
	do
        	case $records in  
		"non of them")
			return 10
			;;
	exit)
	return 254;;
	*)
	break ;;	
	
	esac
break
done


	

user_choice_search=$records
#echo $records
return  4
}

#######################################Add Records####################################

read -p "Please Enter Record Name to Add: "  add_record
search_name $add_record || hadas=$?


#grep "$user_choice_search" recordFileName.txt 
echo " ret value is - $ret "
case $hadas in
10|1)
	echo " record dosent exist --- Adding new record "
;;

4)
echo -n "the amount we have from \"$user_choice_search\" is :" ; cat  recordFileName.txt | grep "$user_choice_search" | cut -f2 -d "," > amount.tx	
echo " you chose an existing record enter the amount to add :"
;;
esac

















#echo $user_choice_search

#find line of the user chois in data file






#if  [ret]


#if [[ $user_choice_search == "non of them"  ]]
 #	then
#	read -p 'please enter the amount of $user_choice_search you want to add to library ' new_amount	 
#	echo '$$add_record,$new_amount' >> recordFileName.txt	
#elif  
#	then  
#fi

#1- read input 
#2- search for replicas
#	2.0= add new record (no matches found )
#	2.1 = add amount 
#	2.2=  enter new record- with new name (user's choice)
 
#3








