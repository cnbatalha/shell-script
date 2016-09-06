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

echo "$LINHA"

done< "$CONFIG"

