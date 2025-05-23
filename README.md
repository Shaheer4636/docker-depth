# docker-depth

## Our basic docker app is running fine
Dir structre is very simple:
1. app.py
2. requirements.txt
3. Dockerfile
![image](https://github.com/user-attachments/assets/b460af75-4e5a-4c79-8316-2e3abef04d1e)

Know we will see each 

### Dind
1. in order to create the DIND we first had to introduce a new file named dind-runner.sh. Its contect will be inside the repo.
2. we had o run the container using the command below:

```bash
docker run --privileged --rm -it `
  -v ${PWD}:/workspace `
  docker:dind `
  /workspace/dind-runner.sh
```
3. Once the conainer is build we have to go inside the container using command and build our python app inside the workspace
```bash
docker exec -it 996d597251ff sh
```

```bash
 docker build -t sample-python-app .
```

The output for dind is below:
![image](https://github.com/user-attachments/assets/971be14d-a546-434d-b1bb-67d40739b391)

### Doond
1. We had to introduce a new script named dood-runner.sh in order to execute docker container in Doond.
2. The script is inside the repo which can be checked.
3. The command used to run the docker is below:

```bash
docker run --rm -it `
  -v ${PWD}:/workspace `
  -v /var/run/docker.sock:/var/run/docker.sock `
  docker:latest `
  sh /workspace/dood-runner.sh
```

the image below shows the container running after downloading the stuff 
![image](https://github.com/user-attachments/assets/3b5f46c9-2dea-483c-8bd7-1d9c7904f54a)

the final result from the contaier shown on the web is:
![image](https://github.com/user-attachments/assets/29402b2f-6f2c-4da1-a0d4-196f5fb1c5de)

### Kaniko
1. Serves best when we want to use in k8s or via ci/cd process. We push the image to docke hub and then we pull it in order to use. But for now we are just learning ang I am going to test in locally.
2. First we have to pull the kaniko image from the gcr.
3. The command used to work arond wiht Kaniko
```bash
docker run --rm -v ${PWD}:/workspace `
  gcr.io/kaniko-project/executor:latest `
  --dockerfile=Dockerfile `
  --context=dir:///workspace `
  --no-push `
  --tarPath=/workspace/sample-python-app.tar
```
4. On port 5000 access the app now, maybe the other containers would bee running and already taken the port. But try to stop them or use another port.

![image](https://github.com/user-attachments/assets/22b8c09d-1f75-40b8-90b5-5ee0280f9b24)


