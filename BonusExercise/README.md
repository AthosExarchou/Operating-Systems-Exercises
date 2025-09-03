# Bonus Exercise -- Read vs Fread Performance

This folder contains a **bonus experiment** comparing the performance of
`read()` vs `fread()` in C.

## Description

Two programs are implemented:
- **read.c**: Uses low-level `read()` system call.
- **fread.c**: Uses high-level buffered `fread()` library function.

Both test sequential and irregular access patterns on files of different sizes.

## Sample Data

-   `sample_data/smallFile.txt` (\~1.5 KB)
-   `sample_data/largeFile.txt` (\~461 MB)

## Build & Run

``` bash
#Compile
gcc read.c -o read
gcc fread.c -o fread

#Run benchmarks
time ./read sample_data/smallFile.txt sequential
time ./fread sample_data/largeFile.txt irregular
```

### Generating the Large Test File (~461 MB)

The large input file is **not included** in this repository due to GitHub size limits.  
You can generate it inside the `sample_data/` directory using the provided script:

```bash
cd BonusExercise
chmod +x generate_large_file.sh
./generate_large_file.sh
```

This will create `sample_data/largeFile.txt` (~461 MB) in the same directory.

## Reference

See full explanations in the bonus report:
`../reports/BonusExercise_report_el.pdf`
