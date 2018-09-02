# Assignment 2_1

### Installing Blue Ocean
- From an administrator account, go to `Manage jenkins -> Manage plugins`.
- Install the `Blue Ocean (BlueOcean Aggregator)` plugin from the `Available` plugins. This is available after jenkins 2.7.
- This will install Blue Ocean and the required dependencies.
- Restart jenkins by entering command `sudo systemctl restart jenkins` in the terminal.
- Upon restart, the menu will now have an option `Open Blue Ocean`, click on it to start using Blue Ocean GUI.

### Building a private Github Repository as a FreeStyle project
- Create a new freestyle project
- Select `Git` in the section `Source Code Management`
- In the input field `Repository URL` enter the URL of your private repository.
- Since the repository is private, jenkins will not be able to access it without credentials. Click on `Add` in the `Credentials` input field and enter your github credentials.
- Once added, select the credentials from the dropdown menu for `Credentials`.
- You can select the branches to build or leave it as `*/master` (default).
- Now the private repository can be used like any other public repository.

## Using Git SCM Poll
(Already done)

### Configuring build triggers
- Go to `Configuration` page of project.
- Under `Build Triggers` choose `GitHub hook trigger for GITScm polling` and save
configuration.

### Adding Jenkins service to GitHub
Now we need to set up our GitHub repo to make a request to Jenkins webhook so
that the polling logic can be applied.
- Go to GitHub repo and navigate to `Settings`.
- Choose `Integrations & services` from the submenu.
- Click on `Add service` and choose `Jenkins (GitHub plugin)` from dropdown menu.
- Add `http://<public-ip or URL>/github-webhook` under `Jenkins hook url`.
- Make sure the service is active by selective the `Active` checkbox and click
on `Add Service` button.
- Now GitHub should make a request to the Jenkins webhook and cause a build
(if required) to occur.

### Configuring Jenkins
- In the configuration page of the project, set build triggers to `GitHub hook trigger for GITScm polling`

### Adding Jenkins webhook to GitHub
Now we need to set up our GitHub repo to make a request to Jenkins webhook so
that the polling logic can be applied.
- Go to GitHub repo and navigate to `Settings`.
- Choose `Webhooks` from the submenu.
- Add `http://<public-ip or URL>/github-webhook` under `Jenkins hook url`.
- Now GitHub is cofigured to send a request when a commit is made

### Post Build Actions - Extended Email Notification
Given below, are the steps to setup email notifications in Jenkins.
The notifications will be sent after every build action.  

### Configuring Email
We need to first provide the SMTP credentials, so that Jenkins can send mails

- Go to `Manage Jenkins > Configure Systems` and scroll down to the `Extended
E-mail Notification` section.
- Add the SMTP server details e.g. `smtp.gmail.com`.
- Click on the `Advanced` button to provide credentials of the mail account used to send mails.
- Select `Use SMTP Authentication`.
- Enter the account username and password.
- Select `Use SSL` and specify the `SMTP port`
- Select `Allow sending to unregistered users` if mail should be sent to
non-Jenkins users.
- With this the basic email configuration is complete.

### Adding the post build action
- Go to `Post-build Actions` section in the `Configuration` page of project.
- Click on `Add post-build action` and choose `Email Notification`
- The options can be used for project based customizations of the email notification.

With this the Post build action for extended email notification is complete.
