# **Docker Case Study** - Automate Infra allocation for Learning and Development

### **Requirements**-

- Dynamic Allocation of Linux systems for users
- Each user should have independent Linux System
- Specific training environment should be created in Container
- User should not allow to access other containers/images
- User should not allow to access docker command
- Monitor participants containers
- Debug/live demo for the participants if they have any doubts/bug in running applications.
- Automate container creation and deletion.

## Allocating Containers To Users
1.  The shell script `createContainers.sh` will automatically create a docker container for every user.

    - `users.txt`
        ```
        Name1
        Name2
        Name3
        Name4
        ```

    - `createContainers.sh`
        ```sh
        echo -n "Enter name of file with usernames: "
        read file
        while read user
            do
                docker create -it --name $user <Docker Image> /bin/bash
            done < $file
        ```
        where `<Docker Image>` is whichever image you want to run.

2.  Fill the entries in `users.txt` with usernames and run the shell script `createContainers.sh`. This creates a docker container corresponding to each username from `users.txt`.

3.  The user can then start using the allocated container by running the `useContainers.sh` script.
    - `useContainers.sh`
        ```sh
        echo -n "Enter your username: "
        read name
        docker start $name
        docker attach $name
        ```

## Monitoring The Containers
- To monitor the containers, use the `monitorContainers.sh` script.
    - `monitorContainers.sh`
        ```sh
        echo -n "Enter username of container to be monitored: "
        read name
        docker logs -f $name
        ```
## Deleting The Containers
- Automate the deletion using the `deleteContainers.sh` script.

    - `deleteContainers.sh`
        ```sh
        echo -n "Enter 'y' to delete the containers of all usernames, else enter 'n': "
        read option
        if [ "$option" == "n" ]
        then
            echo -n "Enter the usernames you want to delete, enter 'exit' when done deleting: "
            while read user
                do
                    if [ "$user" != "exit" ]
                        then
                            docker rm $user
                    else
                        break
                fi
                done
        else
            echo -n "Enter name of file containing usernames: "
            read file
            while read user
                do
                    docker rm $user
                done < $file
        fi

        ```
- You can either delete all users or user by name using `deleteContainers.sh`.
