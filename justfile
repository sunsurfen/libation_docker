
run *args:
    docker compose rm
    docker compose up --no-deps --build {{args}}