if status is-interactive
    # Commands to run in interactive sessions can go here
end

set DEV_PATH $HOME/dev

# go
set PATH $PATH:$DEV_PATH/go/bin

# java
set PATH $PATH:$DEV_PATH/jdks/jdk22/bin
set JAVA_HOME $DEV_PATH/jdks/jdk22

alias et=empty-trash
