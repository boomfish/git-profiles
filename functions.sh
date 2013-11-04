# Custom bash functions and aliases

# Use this command to load Git user profiles
function gituser() {

	if [ -f "$GITPROFILE_DIR/profiles/$1" ]; then
		. "$GITPROFILE_DIR/profiles/$1"
	elif [ -n "$1" ]; then
		echo "Error: No such user '$1'" >&2
	fi

	echo -n "Git author set as "
	git var GIT_AUTHOR_IDENT
	echo -n "Git committer set as "
	git var GIT_COMMITTER_IDENT

}
