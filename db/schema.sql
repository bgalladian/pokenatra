DROP TABLE IF EXISTS pokemons;

CREATE TABLE pokemons (
  id SERIAL PRIMARY KEY,
  name TEXT,
  poke_type TEXT,
  cp INTEGER,
  img_url TEXT
)
