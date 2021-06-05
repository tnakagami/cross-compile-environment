# cross compile environment
## Preparation
Run the following command:

```bash
docker-compose build
```

## Create containers
Run the following command:

```bash
docker-compose up -d
```

## Usage
* Compile the programs for armf

    ```bash
    # Enter the armf container from host machine
    docker exec -it -u armer armf bash
    # execute command
    xgcc -o armf_hello hello.c
    # run the program
    ./execute.sh armf_hello
    ```

* Compile the programs for arm64

    ```bash
    # Enter the armf container from host machine
    docker exec -it -u armer arm64 bash
    # execute command
    xgcc -o arm64_hello hello.c
    # run the program
    ./execute.sh arm64_hello
    ```
