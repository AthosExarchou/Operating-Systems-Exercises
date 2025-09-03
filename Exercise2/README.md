# Exercise 2 -- C Program (Processes, Threads, Signals)

This folder contains the second exercise of the **Operating Systems**
course, implemented in C.

## Description

The program demonstrates:
- Use of **`fork()`** to create parent and child processes.
- File writing (parent generates random numbers into `data.txt`).
- File reading (child uses **POSIX threads** to read numbers and calculate their sum).
- Synchronization with **mutexes** and **semaphores**.
- Signal handling (`SIGINT`, `SIGTERM`).
- Error handling and resource cleanup.

## Build & Run

```bash
#Compile
gcc exercise2.c -o exercise2 -lpthread

#Run
./exercise2
```

Alternatively, with `make`:

```bash
#Build program
make
```

```bash
#Run program
make run
```

Clean build artifacts + `data.txt`:
```bash
make clean
```

## Reference

See full explanations in the main report: `../reports/exc2_report_el.pdf`.
