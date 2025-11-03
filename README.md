clone this repo to `~/scripts`
To initialize scripts you need to add this snippet in `.zshrc` file

```bash
export SCRIPTS_DIR="${HOME}/scripts"
if [[ -d "${SCRIPTS_DIR}" ]]; then
  for script in "${SCRIPTS_DIR}"/*.sh; do
    # only source regular files
    [[ -r "$script" ]] && source "$script"
  done
fi
```
