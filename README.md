# cross compile environment
## Preparation
Run the following command:

```bash
./wrapper biuld
```

## Create containers
Run the following command:

```bash
./wrapper start
```

## Usage
Compile the programs for armf

    ```bash
    # Enter the armf container from host machine
    ./wrapper.sh armf
    # execute command
    xgcc -o armf_hello src/hello.c
    # run the program
    ./execute.sh armf_hello
    ```
