# docker-tutorial

1. Use `docker build --tag <dockername> .` in terminal
2. Enter `docker run publish 5000:5000 <dockername>`
3. Docker login code `docker login -u kramstyles`

`backports.zoneinfo==0.2.1;python_version<"3.9"` was added in `requirements.txt` 
because this plugin is not compatible with python 10

## Notes

### Using Docker Compose
- Run all commands through Docker Compose
    
    `docker-compose run --rm app sh -c "python manage.py collectstatic"`
- `docker -compose` runs a Docker Compose command
- `run` will start a specific container defined in config
- `--rm` removes the container after the execution
- `app` is the name of the service
- `sh -c` passes in a shell command
- `python manage.py ...` are commands to run within the container
- The first part (from `docker` to `app`) is the command we should add before every command we run. The second part is the command we run within the container