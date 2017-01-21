#!/bin/bash

# one time only actions
if [ ! -e /var/lib/docker-entrypoint/.entrypoint-develbase-executed ]; then
	# nano editor settings
	cat >> ~/.nanorc << EOL
set const
syntax "C# source" "\.cs$"
color green "\<(bool|byte|sbyte|char|decimal|double|float|int|uint|long|ulong|new|object|short|ushort|string|base|this|void)\>"
color brightcyan "\<(as|break|case|catch|checked|continue|default|do|else|finally|fixed|for|foreach|goto|if|is|lock|return|switch|throw|try|unchecked|while)\>"
color cyan "\<(var|abstract|class|const|delegate|enum|event|explicit|extern|implicit|in|internal|interface|namespace|operator|out|override|params|private|protected|public|readonly|ref|sealed|sizeof|static|struct|typeof|using|virtual|volatile)\>"
color brightwhite ""[^\"]*""
color yellow "\<(true|false|null)\>"
color brightblack "//.*"
color brightblack start="/\*" end="\*/"
color brightblue start="/\*\*" end="\*/"
color brightgreen,green " +$"
EOL

	cd /usr/share/nano
	for i in `\ls`; do echo "include /usr/share/nano/$i" >> ~/.nanorc; done

	touch /var/lib/docker-entrypoint/.entrypoint-develbase-executed
fi

# every run actions
