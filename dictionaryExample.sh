declare -A sound;

sound[cow]='moo';
sound[dog]='bark'
sound[wolf]='howl';
sound[bird]='tweet';
sound[lion]='Roar';
sound[tiger]='roar';

echo ${sound[@]};
echo ${!sound[@]};

for s in ${!sound[@]}
do
	echo 'Sound of '$s' is '${sound[$s]};
done

echo 'Hello MyPC!!!';
