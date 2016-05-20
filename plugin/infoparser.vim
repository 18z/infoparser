function! Parse()
    let current_path = expand('%:p')
    " :echo current_path

    python << EOF

import vim
import re

URL_REGEX = re.compile('http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+')
IPV4_REGEX = re.compile('[1-2]?[0-9]?[0-9]\.[1-2]?[0-9]?[0-9]\.[1-2]?[0-9]?[0-9]\.[1-2]?[0-9]?[0-9]')
DOMAIN_REGEX = re.compile('([a-z0-9][a-z0-9\-]{0,61}[a-z0-9]\.)+[a-z0-9][a-z0-9\-]*[a-z0-9]', re.IGNORECASE)

textfile = open(vim.eval("current_path"), 'r')
filetext = textfile.read()

hosts = IPV4_REGEX.findall(filetext)

print hosts

# print vim.eval("current_path")

EOF

endfunc


"10.3.40.123, 8.8.8.8, 192.168.1.43"
"
"
"5.12.4.56 + 89.32.67.12
" 168.95.1.1
