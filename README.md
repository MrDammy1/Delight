Pour tester le code, il faut exécuter ces commandes sur un terminal :

intaller les dépendences :
```
mix deps.get
```
compiler le projet :
```
mix compile
```
 
Vous devrez obtenir un token d'accès Spotify pour interagir avec l'API. Vous pouvez obtenir un token d'accès et le mettre dans
```
def get_access_token do
  "VOTRE_TOKEN_SPOTIFY_ICI"
end
```

Lancez une session iex :
```
iex -S mix
```

utilisez les fonctions suivantes : 
```
SpotifyClient.list_albums()
SpotifyClient.list_albums_without_singles()
SpotifyClient.list_albums_sorted_by_date()
```
