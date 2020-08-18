# Test on jenkins

```sh
docker run -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts

docker run --name JenkinsDocker -ti -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts
docker ps

docker build -t custom_jenkins .
docker run --name JenkinsDocker -ti -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker -p 8080:8080 -p 50000:50000 --group-add 100 custom_jenkins

groupadd -g ${BUILD_DOCKER_GROUP:-999} -f docker;
usermod -aG docker jenkins;
usermod -aG root jenkins;
```

```sh
docker copy /Users/martin/Documents/DEV/dev_tools/Jenkins/quality/xslt/checkstyle2junit.xslt JenkinsDocker3:/usr/lib/quality/xslt/checkstyle2junit.xslt


git checkout eed723bf936a1e888a69721a92b82b985713cabd Jenkinsfile
git commit Jenkinsfile -m "Restore basic jenkinsfile"

git checkout fb65c4cfa36b0e917f7386ab4fa49d48e23e8d55 Jenkinsfile
git commit Jenkinsfile -m "Restore complex pipeline"

```
