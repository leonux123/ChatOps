# essbot-flowdock

### Configuration

Windows settings:
```bash
    set HUBOT_NAME=essbot
    set HUBOT_FLOWDOCK_API_TOKEN=<flowdock API token>
    set HUBOT_ADAPTER=flowdock
```

Linux:
```bash
    export HUBOT_ADAPTER=flowdock
    export HUBOT_FLOWDOCK_API_TOKEN=<flowdock API token>
```

Make sure to add the flowdock dependency here: `package.json`:
```
      "dependencies": {
      "hubot-flowdock": ">= 0.7.2",
```

## Deploying to LINUX

Tested in AWS using an Ubuntu Linux image. Follow these steps:

- [x] Allow SSH access and open port :8080 for Hubot listener.
- [x] [Install The Latest Node.Js And NPM Packages On Ubuntu](https://websiteforstudents.com/install-the-latest-node-js-and-nmp-packages-on-ubuntu-16-04-18-04-lts/)
- [x] ```sudo npm install -g yo generator-hubot```
- [x] Create your bot: ```yo hubot```
- [x] Start Hubot with flowdock adapter:```bin/hubot -a flowdock```

## Simple POST example via `notifier.coffee` script:

- [x] Get flowdock channel id: ```curl -X GET https://<flowdock API token>@api.flowdock.com/flows```
- [x] Post a message into that channel: ```curl -X POST -d message="Hello from $(hostname) shell" http://localhost:8080/hubot/notify/<flowdock channel ID>```

```bash
    export HUBOT_ADAPTER=flowdock
    export HUBOT_FLOWDOCK_API_TOKEN=<flowdock API token>
```


## Official documentation from Hubot:

### Running essbot Locally

You can test your hubot by running the following, however some plugins will not
behave as expected unless the [environment variables](#configuration) they rely
upon have been set.

You can start essbot locally by running:

    % bin/hubot

You'll see some start up output and a prompt:

    [Sat Feb 28 2015 12:38:27 GMT+0000 (GMT)] INFO Using default redis on localhost:6379
    essbot>

Then you can interact with essbot by typing `essbot help`.

    essbot> essbot help
    essbot animate me <query> - The same thing as `image me`, except adds [snip]
    essbot help - Displays all of the help commands that essbot knows about.
    ...

### Scripting

An example script is included at `scripts/example.coffee`, so check it out to
get started, along with the [Scripting Guide][scripting-docs].

For many common tasks, there's a good chance someone has already one to do just
the thing.

[scripting-docs]: https://github.com/github/hubot/blob/master/docs/scripting.md

### external-scripts

There will inevitably be functionality that everyone will want. Instead of
writing it yourself, you can use existing plugins.

Hubot is able to load plugins from third-party `npm` packages. This is the
recommended way to add functionality to your hubot. You can get a list of
available hubot plugins on [npmjs.com][npmjs] or by using `npm search`:

    % npm search hubot-scripts panda
    NAME             DESCRIPTION                        AUTHOR DATE       VERSION KEYWORDS
    hubot-pandapanda a hubot script for panda responses =missu 2014-11-30 0.9.2   hubot hubot-scripts panda
    ...


To use a package, check the package's documentation, but in general it is:

1. Use `npm install --save` to add the package to `package.json` and install it
2. Add the package name to `external-scripts.json` as a double quoted string

You can review `external-scripts.json` to see what is included by default.

##  Persistence

If you are going to use the `hubot-redis-brain` package (strongly suggested),
you will need to add the Redis to Go addon on Heroku which requires a verified
account or you can create an account at [Redis to Go][redistogo] and manually
set the `REDISTOGO_URL` variable.

    % heroku config:add REDISTOGO_URL="..."

If you don't need any persistence feel free to remove the `hubot-redis-brain`
from `external-scripts.json` and you don't need to worry about redis at all.

[redistogo]: https://redistogo.com/

## Adapters

Adapters are the interface to the service you want your hubot to run on, such
as Campfire or IRC. There are a number of third party adapters that the
community have contributed. Check [Hubot Adapters][hubot-adapters] for the
available ones.

If you would like to run a non-Campfire or shell adapter you will need to add
the adapter package as a dependency to the `package.json` file in the
`dependencies` section.

Once you've added the dependency with `npm install --save` to install it you
can then run hubot with the adapter.

    % bin/hubot -a <adapter>

Where `<adapter>` is the name of your adapter without the `hubot-` prefix.

[hubot-adapters]: https://github.com/github/hubot/blob/master/docs/adapters.md
