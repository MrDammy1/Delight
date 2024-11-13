Pour tester le code, il faut exécuter ces commandes sur un terminal :

mix deps.get
mix compile
Vous devrez obtenir un token d'accès Spotify pour interagir avec l'API. Vous pouvez obtenir un token d'accès et le mettre dans
```
def get_access_token do
  "VOTRE_TOKEN_SPOTIFY_ICI"
end
```
iex -S mix
SpotifyClient.list_albums()
SpotifyClient.list_albums_without_singles()
SpotifyClient.list_albums_sorted_by_date()
