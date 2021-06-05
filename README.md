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
* Create sample source code to `hello.c`

    ```c
    #include <stdio.h>

    int main(int argc, char **argv) {
        (void)argv;
        printf("Hello World!\n");

        return 0;
    }
    ```

* Compile the programs for armf

    ```bash
    # Enter the armf container from host machine
    ./wrapper.sh armf
    # execute command
    xgcc -o armf_hello hello.c
    # run the program
    ./execute.sh armf_hello
    ```

* Compile the programs for arm64

    ```bash
    # Enter the armf container from host machine
    ./wrapper.sh arm64
    # execute command
    xgcc -o arm64_hello hello.c
    # run the program
    ./execute.sh arm64_hello
    ```
