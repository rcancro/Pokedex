pokemon_count=1118;
pokemon_base_url="https://pokeapi.co/api/v2/pokemon/";

catch_them_all() {
for ((i=1;i<=pokemon_count;i++)); do
    pokeball_url=$pokemon_base_url/"$i"
    pokeball="pokemon_""$i"".json"
    echo "$pokeball_url"
    echo "$pokeball"
    wget -O "$pokeball" "$pokeball_url"
done
}

echo "================================="
echo "=========Catch them all=========="
echo "================================="
catch_them_all
echo "\n"
