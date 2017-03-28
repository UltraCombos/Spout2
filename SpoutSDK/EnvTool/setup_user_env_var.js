var args = WScript.Arguments;
if (args.count() != 2) 
{
	WScript.Echo("[add_user_env_var.js] Num of the arg is not correct.");
	WScript.Quit(1);
}

var shell = WScript.CreateObject("WScript.Shell");
var target_env = shell.Environment("User")
var var_name = args.Item(0);
var var_value = args.Item(1);

//setup the env var
target_env.Item(var_name) = var_value

WScript.Quit(0);
