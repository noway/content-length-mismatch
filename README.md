# Repro for the `Error: request size did not match content length` bug in Bun

## Install

```bash
bun i
```

## Run

```
./repro.sh
```


## Expected behavior

- Bun should not throw `Error: request size did not match content length` error.
- Bun should output a 404 HTTP error, just like Node.js does. 

## Notes
- Make sure ports 42337 and 42338 are available when running
- Only tested on macOS 14.2
