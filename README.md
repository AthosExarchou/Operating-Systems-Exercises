# Operating Systems Exercises

This repository contains a collection of exercises completed for the
**Operating Systems** course at [Harokopio University of Athens – Dept. of Informatics and Telematics](https://www.dit.hua.gr).\
The exercises are written in **Bash** and **C**, focusing on system
programming concepts such as shell scripting, process management,
signals, threads, and file I/O.

---

## Repository Layout

```
Operating-Systems-Exercises/
│
├── Exercise1/                     #Bash Shell Scripts
│   ├── ex1_password_generator.sh
│   ├── ex2_sysinfo_menu.sh
│   ├── ex3_log_analysis.sh
│   ├── ex4_directory_analysis.sh
│   ├── ex5_ssl_checker.sh
│   └── README.md                  #Short usage notes for each script
│
├── Exercise2/                     #C Programs (Processes, Threads, Signals)
│   ├── exercise2.c
│   ├── Makefile                   #Optional: compile with `make`
│   └── README.md                  #Build & run instructions
│
├── BonusExercise/                 #Read vs Fread performance comparison
│   ├── read.c
│   ├── fread.c
│   ├── sample_data/               #Example input files
│   │   ├── smallFile.txt
│   │   └── largeFile.txt
│   └── README.md
│
├── reports/                       #PDF reports
│   ├── exc1_report_el.pdf
│   ├── exc2_report_el.pdf
│   └── BonusExercise_report_el.pdf
│
├── .gitignore                     #Ignore compiled binaries, temp files, etc.
├── LICENSE                        #MIT license
└── README.md                      #Main project overview
```

## Exercises Overview

### Exercise Set 1 (Bash Shell Scripts)

Includes multiple scripts that cover: - Password generator with
different difficulty levels. - System information menu (hostname,
kernel, CPU, memory, disk usage). - Log file analysis using `awk` and
`uniq`. - Directory analysis (largest files, hard links, permissions). -
SSL certificate expiration checker with `openssl`.

Full report: `exc1_report_el.pdf`

---

### Exercise Set 2 (C Programming)

Implements a **multi-process and multi-threaded system** with
synchronization and signal handling: - Uses `fork()` to create
parent/child processes. - Parent writes random numbers to a file
(`data.txt`). - Child reads and processes the file using **POSIX
threads**. - Synchronization with **mutexes** and **semaphores**. -
Signal handling for `SIGINT` and `SIGTERM`. - Error handling and proper
resource cleanup.

Full report: `exc2_report_el.pdf`

---

### Bonus Exercise: `read()` vs `fread()`

Performance comparison between low-level `read()` and buffered `fread()`
when reading files with different sizes and access patterns.

-   Tested on:
    -   Small file (\~1.5KB)
    -   Large file (\~461MB)
-   Sequential vs irregular access patterns.
-   Measured execution time (real/user/sys).

Full report: `BonusExercise_report_el.pdf`

---

## Requirements

-   Linux-based environment
-   GCC compiler (`gcc`)
-   Bash shell
-   `make` (optional, for build automation)

---

## How to Run

### For Bash Scripts

``` bash
cd Exercise1
chmod +x script.sh
./script.sh [arguments]
```

### For C Programs

``` bash
cd Exercise2
gcc program.c -o program -lpthread
./program
```

### For Bonus Exercise

``` bash
cd BonusExercise
gcc read.c -o read
gcc fread.c -o fread
time ./read smallFile.txt sequential
time ./fread largeFile.txt irregular
```

---

## Results & Observations

-   `fread()` is generally faster than `read()` due to buffering.
-   Synchronization (mutexes + semaphores) ensures safe concurrent execution.
-   Signal handling allows graceful shutdown of processes.
-   Shell scripts demonstrate practical system administration tasks.

---

## Author

- **Name**: Exarchou Athos
- **Student ID**: it2022134
- **Email**: it2022134@hua.gr, athosexarhou@gmail.com

## License
This project is licensed under the MIT License.
