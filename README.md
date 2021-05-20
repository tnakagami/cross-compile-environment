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
    docker exec -it armf bash
    # execute command
    arm-linux-gnueabihf-gcc -o hello_armf hello.c
    # run the program
    ./hello_armf
    ```

* Compile the programs for arm64

    ```bash
    # Enter the armf container from host machine
    docker exec -it arm64 bash
    # execute command
    aarch64-linux-gnu-gcc -o hello_arm64 hello.c
    # run the program
    ./hello_arm64
    ```
