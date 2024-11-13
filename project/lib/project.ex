defmodule SpotifyClient do
  alias HTTPoison, as: HTTP

  @base_url "https://api.spotify.com/v1"
  @artist_id "4FpJcNgOvIpSBeJgRg3OfN"  # ID de l'artiste Orelsan

  def get_access_token do
    "BQCApwuwthu6ajgAJYnaUrdX0Z5zPPOC5Ug9QOf2ZtxfwABUprLZ_fSpwtbSj_kXOHa1oUFhHOn9cTg8zlK0csOpaZ1v_Oe4OfIEHSx1ejY7pkvVXks"
  end

  defp fetch_albums do
    headers = [
      {"Authorization", "Bearer " <> get_access_token()}
    ]

    url = "#{@base_url}/artists/#{@artist_id}/albums?include_groups=album,single&market=FR&limit=50"

    case HTTPoison.get(url, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Jason.decode!(body)["items"]}

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts("Erreur lors de la requête : #{reason}")
        {:error, reason}
    end
  end

  def list_albums do
    case fetch_albums() do
      {:ok, albums} -> Enum.map(albums, & &1["name"])
      {:error, _reason} -> []
    end
  end

  def list_albums_without_singles do
    case fetch_albums() do
      {:ok, albums} ->
        albums
        |> Enum.filter(fn album -> album["album_type"] == "album" end)
        |> Enum.map(& &1["name"])

      {:error, _reason} -> []
    end
  end

  def list_albums_sorted_by_date do
    case fetch_albums() do
      {:ok, albums} ->
        albums
        |> Enum.filter(fn album -> album["album_type"] == "album" end)
        |> Enum.sort_by(& &1["release_date"], :desc)
        |> Enum.map(& &1["name"])

      {:error, _reason} -> []
    end
  end
end
