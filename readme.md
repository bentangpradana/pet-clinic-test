# Spring PetClinic Sample Application 

## How to use it 
login to your gcp or register with free tier
create your project the name is hijra
create the service account under project the name is somesvc with owner and storage admin role.
download the key on your create service account and create as json.

## Create the secret manager on github action
settings > secret and variable > action
create 3 secrets here:

```
CREDENTIALS_JSON (this is the gcp service account)
DOCKER_USERNAME (docker hub private registry username)
DOCKER_PASSWORD (docker hub private registry password)

```
### run the github action pipeline
push code to repository or running manual on action page

### install docker, docker-compose and github self hosted runner
after they create vm and the other last deploy job  will stopped because they still didnt find any self hosted runner, so u must login to your created vm and install docker,docker-compose and github self hosted there.
for the github self hosted go to setting > action > runner  > new self hosted .
make sure u installed the self hosted in the vm.
then u can run again the pipeline and voila ur deployment its already created there. 


im using docker-compose for the service app and the database:

``` 
docker-compose up -d 
```

for the monitoring and logging im using docker compose too, jump to the folder monitoring and elk :

```
docker-compose up -d
```
noted : for this monitoring and logging deployment u must go to ur instance first and clone this repository and after that u can run the docker-compose run or u can just add it to pipeline,

for the testing terrafprm mannualy u can try to install googlecloud sdk cli and login to ur gcp account then running manually:
dont forget to export ur gcp service account json :
```
export GOOGLE_APPLICATION_CREDENTIALS=/home/benja/somesvc.json
```
then  run ur terraform init,and terraform plan 