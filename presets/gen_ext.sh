#!/bin/bash

start=$1
end=$2

for ((i=start; i<=end; i++)); do
    password=$(openssl rand -base64 12)
    
    echo "[$i](endpoint-basic)"
    echo "aors=$i"
    echo "auth=auth_$i"
    
    echo -e "\n[auth_$i](auth-userpass)"
    echo "username=$i"
    echo "password=$password"
    
    echo -e "\n[$i](aor-single-reg)\n"
    echo ";------------------------------"
    
    # Print username and password to console
#    echo "Username: $i, Password: $password"
done > ext_temp
grep -E "username|password" ext_temp | sed -n 'N;s/\(username=[^ ]*\)\n\(password=[^ ]*\)/\1 \2/p'


