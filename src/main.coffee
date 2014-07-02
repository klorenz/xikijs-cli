{OptionParser} = require 'optparse'

switches = [
    ['-n', '--non-interactive', "Non interactive mode" ]
    ['-p', '--port', "Port to listen/connect to" ]
    ['-h', '--host', "Host to listen/connect to" ]
    ['-u', '--user', "Username" ]
    ['-w', '--password', "Password" ]
    ['--serve']
]

banner = "usage: xiki [ OPTIONS ] { --serve | [ PATH ] }"

{Xiki, XikiServer} = require 'xikijs'

parser = OptionParser(switches)

parser.banner = """
  usage: xiki [ OPTIONS ] { --serve | [ PATH ] }
  """

options = {}

parser.on '*', (name, arg) -> options[name] = arg

args = parser.parse process.argv[2..]

(new Xiki(options)).request args, (err, response) ->
    if err
        process.stderr.write err
        process.exit 1
    process.stdout.write response
