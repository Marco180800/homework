## Findings

### Task 1 – Bash Script

**Issue:** The script contained an invalid Unicode whitespace character, an incorrect variable reference, and a misspelled `echo` command.

**Identification:** Reproduced the failure and inspected the affected lines using `cat -n` and `od`.

**Fix:** Replaced the Unicode character with a standard space, corrected the variable reference, and fixed the command typo.

**Verification:**
- `bash -n task-1-script/random-data.sh`
- `bash task-1-script/random-data.sh`
- Confirmed exit code `0`.

### Task 2 – Configuration

**Issue:** The script used a configuration path relative to the caller's working directory instead of the script's location.

**Identification:** Executed the script from different directories and reproduced the missing configuration error.

**Fix:** Used `${BASH_SOURCE[0]}` and `dirname` to resolve the configuration file relative to the script directory.

**Verification:**
- Successfully executed the script from the exercise root.
- Successfully executed it from another directory.
- Temporarily removed the configuration and confirmed an error message with exit code `1`.
- Restored the configuration.

### Task 3 – GitHub Actions

**Issue:** The expected `.github/workflows/check-scripts.yml` file was missing from the local repository.

**Identification:** Inspected tracked files using `git ls-files` and searched for the workflow using `find`.

**Fix:** Created a GitHub Actions workflow with push and pull request triggers, Bash syntax validation, script execution, output verification, and missing-configuration testing.

**Verification:**
- `git diff --cached --check` completed without errors.

