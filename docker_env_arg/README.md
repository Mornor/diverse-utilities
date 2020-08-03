### Build the docker image
```
docker build --build-arg temp_file_name="hello.txt" -t bash_example .
```

### Run it
```
docker run --rm -it -e "string_var=celien" bash_example:latest
```