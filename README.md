# Git user profiles

This repo contains a very simple Git Bash script (a function, really)
to set the Git author identity for commits. It is intended for use in
server environments.

## Introduction

Many devops teams use shared accounts to deploy and fix code on
servers. This means that by default any Git commits made on the server
will appear as if they were authored by the Git user set up for the 
shared account, which might not be the developer who made the change.

This script allows devops personnel to set their Git identity prior
to committing changes on the server so that they will be correctly
identified in the git log.

## Installation

After cloning the repository, create a `.bash_profile` text file in the
Git Bash home directory if necessary and add the following lines:

	GITPROFILE_DIR=/path/to/git-profiles
	. $GITPROFILE_DIR/functions.sh

Launch a new Git Bash shell for access to Git profiles.

## Creating a new profile

Profiles are stored in the `profiles` subfolder.

The profile _template_ can be used as a template for new profiles.
Make a copy of the profile and rename it to the profile name you
desire.

The profile file should look like this:

	# Changing these two lines is sufficient for most users
	GIT_AUTHOR_NAME='Joe Bloggs'
	GIT_AUTHOR_EMAIL='nobody@example.com'

	export GIT_AUTHOR_NAME
	export GIT_AUTHOR_EMAIL

Change the 'Joe Bloggs' and 'nobody@example.com' in the copied profile
to the profile user's name and email address respectively.


## Using a profile

To activate a profile, use the `gituser` command from the Bash
prompt and provide with the name of a profile you created:

	$ gituser bigcheese

	Git author set as Big Cheese <root@example.com> 1367540210 +1000
	Git committer set as Joe Bloggs <nobody@example.com> 1367540210 +1000

Commits made from the same Bash prompt will be recorded as being
made by the displayed Git user identities.

To see the active Git user identites without changing them, run
`gituser` with no arguments;

	$ gituser

	Git author set as Big Cheese <root@example.com> 1367540308 +1000
	Git committer set as Joe Bloggs <nobody@example.com> 1367540308 +1000

To reset the Git identities to their defaults, use the _default_
identity:

	$ gituser default

	Git author set as Joe Bloggs <nobody@example.com> 1367541058 +1000
	Git committer set as Joe Bloggs <nobody@example.com> 1367541058 +1000

Note that the default identities are those defined in git config,
which may not be the same identities in the template profile.

## Git author and committer identities

Git commits have two user identities: the author and the committer.
The author is the person who wrote the change, and the committer is the
person who added the change to git.

The default profile sets the author identity but not the committer
identity. For these profiles the default user identity on the server
will appear as the committer in the git log. This is handy for identifying
which commits were made on the server.

If you want to set the Git committer identity to be the same as the Git
author identity in a profile, add the following lines to the end of the
profile file:

	GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
	GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"

	export GIT_COMMITTER_NAME
	export GIT_COMMITTER_EMAIL


## License

Copyright 2013 Daemon Pty Limited http://www.daemon.com.au/

This work is free. You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To Public License, Version 2,
as published by Sam Hocevar. See the LICENSE.txt file for more details.

