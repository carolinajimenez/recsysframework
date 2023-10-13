# Recommedation System Framework

## Usage

1. Clone the repository.
    ```
    git clone https://github.com/carolinajimenez/recsysframework.git
    cd recsysframework
    ```

2. Give execution permissions to the creation script.    
Before you can run the script, you must give it execution permissions. You can do this with the following command:
    ```
    chmod +x create_project.sh
    ```

3. Create projects.    
With this command the '*python-project*' will be created using `cookiecutter` from the custom template '**RecSysFramework**', and the '*helm-project*' will also be created using `Helm` which will allow you to deploy to the Kubernetes cluster later on.
    ```
    ./create_project.sh
    ```

4. Proceed to organize the development of the '*python-project*'.

5. Follow the instructions in the '**README.md**' of the '*python-project*' created with `cookiecutter`. Here you will find instructions on how to build and run the Docker image, once done, push the image to a repository, either Docker Hub or other.


## References

1. <a target="_blank" href="https://github.com/cookiecutter/cookiecutter">Cookiecutter</a>

2. <a target="_blank" href="https://www.youtube.com/watch?v=DQk8HOVlumI">Complete Helm Chart Tutorial: From Beginner to Expert Guide</a>
