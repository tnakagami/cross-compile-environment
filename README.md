# cross compile environment
## Preparation
Run the following command:

```bash
docker-compose build

or

./wrapper biuld
```

## Create containers
Run the following command:

```bash
docker-compose up -d

or

./wrapper start
```

## Usage
* Check and modify `NODE_UID` and `NODE_GID`

    ```bash
    # in host directory
    id
    # output(example): uid=1001(docker) gid=117(docker) groups=117(docker)
    # set to NODE_UID=1001, NODE_GID=117 in docker-compose.yml
    ```

* Compile the programs for armf

    ```bash
    # Enter the armf container from host machine
    ./wrapper.sh armf
    # execute command
    xgcc -o armf_hello src/hello.c
    # run the program
    ./execute.sh armf_hello
    ```

* Compile the programs for arm64

    ```bash
    # Enter the armf container from host machine
    ./wrapper.sh arm64
    # execute command
    xgcc -o arm64_hello src/hello.c
    # run the program
    ./execute.sh arm64_hello
    ```
