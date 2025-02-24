sqlite3 gitea.db "select passwd,salt,name from user" | while read data;
do digest=$(echo "$data" | cut -d'|' -f1 | xxd -r -p | base64); salt=$(echo "$data" | cut -d'|' -f2 | xxd -r -p | base64);
name=$(echo $data | cut -d'|' -f 3); echo "${name}:sha256:50000:${salt}:${digest}";
done | tee gitea.hashes