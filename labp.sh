#!/bin/sh

if [ ! -d "$1" ]; then
	echo "usage: lp <dir>"
	exit 1
fi

cd "$1"

suffix=
for f in *; do
	case $f in
	*.png) suffix=png;;
	*.jpg) suffix=jpg;;
	*.jpeg) suffix=jpeg;;
	esac
done

js_obj="{pages:["
for img in *.$suffix; do
	js_obj="$js_obj{source:'$img',translation:[]},"
done
js_obj="$js_obj]}"

m4 -DNEW_TRANSLATION="$js_obj" ~/labelplus.html > labelplus.html

