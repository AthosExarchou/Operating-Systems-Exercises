# Exercise 1 -- Bash Shell Scripts

This folder contains a collection of Bash shell scripts developed for
the **Operating Systems** course.

## Scripts

-   **ex1_password_generator.sh**: Generates random passwords (easy,
    medium, hard) using `/dev/urandom`.
-   **ex2_sysinfo_menu.sh**: Displays system information (hostname,
    kernel, CPU, memory, disk usage) via a menu.
-   **ex3_log_analysis.sh**: Extracts and counts occurrences of dates
    from a `syslog` file using `awk` and `uniq`.
-   **ex4_directory_analysis.sh**: Analyzes a directory: lists the 5
    largest files, checks for hard links, and verifies file permissions.
-   **ex5_ssl_checker.sh**: Checks SSL certificate expiration date for
    a given domain using `openssl`.

## How to Run

``` bash
chmod +x script.sh
./script.sh [arguments]
```

Each script contains **comments** explaining the implementation.

## Reference

See full explanations in the main report:
`../reports/exc1_report_el.pdf`
