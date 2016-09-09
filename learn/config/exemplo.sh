#!/bin/bash

CONFIG="example.conf"

# Configuracoes
EMAIL_SENDER=
PASSWD_EMAIL_SENDER=

# loop para ler linhas da configuracao
while read LINHA; do

	# Ignorando linhas de comentario
	[ "$(echo $LINHA | cut -c1)" = '#' ] && continue

	# Ignorando as linhas em branco
	[ "$LINHA" ] || continue

	set - $LINHA

	chave=$1
	shift
	valor=$*

	# echo $chave
	# echo $valor

	case $chave in
		
		EMAIL)
		EMAIL_SENDER=$valor
		;;
		PASSWD)
		PASSWD_EMAIL_SENDER=$valor
		;;
	esac

done< "$CONFIG"

echo $EMAIL_SENDER
echo $PASSWD_EMAIL_SENDER

