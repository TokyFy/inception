#!/bin/sh

sleep 10

cd /www

git pull

ADMIN_USER=$(head -n 1 /run/secrets/ADMIN_USER | tr -d '\n') 
ADMIN_PASS=$(tail -n 1 /run/secrets/ADMIN_USER | tr -d '\n')

wp user get "$ADMIN_USER" >/dev/null 2>&1 ||                                    \
wp core install                                                                 \
        --url="$DOMAIN"                                                         \
        --title="franaivo"                                                      \
        --admin_user="$ADMIN_USER"                                              \
        --admin_password="$ADMIN_PASS"                                          \
        --admin_email="change@this.com"      

NORMAL_USER=$(head -n 1 /run/secrets/NORMAL_USER | tr -d '\n')
NORMAL_PASS=$(tail -n 1 /run/secrets/NORMAL_USER | tr -d '\n')

wp user get "$NORMAL_USER" >/dev/null 2>&1 ||                                   \
wp user create  "$NORMAL_USER"                                                  \
                "normal@42.fr" --role=subscriber --user_pass="$NORMAL_PASS"

wp post delete $(wp post list --post_type='post' --name='hello-world' --format=ids) --force

[ "$(wp post list --post_type=post --format=ids | wc -w)" -eq 0 ] && \
wp post create --post_title="👾Franaivo" --post_status=publish --post_type=post --post_content="$(cat <<'EOF'

Hey! I’m someone who loves figuring things out — mostly by getting them wrong first. 
I enjoy poking at everyday life like it's a mysterious puzzle box…
except there’s no manual, and sometimes I realize I’m holding it upside down.

I’m into:

    *   Overthinking simple decisions like it’s an Olympic sport

    *   Creating routines and then immediately rebelling against them

    *   Pretending to journal, but really just doodling and writing half-thoughts

    *   People-watching like I’m conducting a sociology experiment (with popcorn)

    *   Getting inspired by motivational quotes… and forgetting them two minutes later

    *   I believe life is best learned through trial, error, and that awkward pause when you realize you’ve been talking to yourself
in public. I enjoy learning by doing — and occasionally by not doing, then panicking, and finally doing it last minute.

This space is where I share things I notice, things I mess up, and things that make me laugh (especially when I probably shouldn’t).

EOF
)"

wp plugin activate redis-cache

wp redis enable

curl -s -X POST -H "Content-Type: application/json" \
     -d '{"text":"SERVER RUNINNGG : franaivo.42.fr"}' \
     tux/say > /dev/null 2>&1

chown -R nobody:nogroup /www/
chmod 777 -R /www

exec php-fpm83 -F -R
