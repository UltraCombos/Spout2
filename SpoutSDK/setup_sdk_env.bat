@REM ========================================
@REM setup-sdk-env.bat
@REM 
@REM 2017/03/28
@REM ========================================
@SETLOCAL ENABLEDELAYEDEXPANSION 

@PUSHD %~d0%~p0

@SET FORCE_SETUP=1
@SET ENV_TOOL_DIR=EnvTool\
@SET SDK_DIR=%~d0%~p0
@SET SRC_DIR=%ROOT_DIR%Source\

@REM ------------------------------------------------------
@REM Read SDK version from the file "EnvTool\_sdk_version"
@REM ------------------------------------------------------
@FOR /F %%i IN (%ENV_TOOL_DIR%_sdk_version) DO @SET SDK_VER=%%i
@ECHO Spout SDK verison: %SDK_VER% 


@REM ------------------------------------------------
@REM setup env
@REM ------------------------------------------------

@ECHO Checking user environment variables - [SPOUT_SDK_DIR] ...
@cscript.exe //nologo //e:jscript "%ENV_TOOL_DIR%check_user_env_var.js" "SPOUT_SDK_DIR" "%SDK_DIR%"

@IF NOT ERRORLEVEL 0 (
	@ECHO [SPOUT_SDK_DIR] is not set up yet...
	@ECHO [SPOUT_SDK_DIR] will be set up to "%SDK_DIR%".
	
	@cscript.exe //nologo //e:jscript "%ENV_TOOL_DIR%setup_user_env_var.js" "SPOUT_SDK_DIR" "%SDK_DIR%"
	
	@ECHO [SPOUT_SDK_DIR] was set up.
	
	
) ELSE (
	@IF %FORCE_SETUP% == 0 (
		@ECHO [SPOUT_SDK_DIR] was set up to "%SPOUT_SDK_DIR%".
		
	) ELSE (
		@ECHO WARNING======================================================================
		@ECHO WARNING Current [SPOUT_SDK_DIR] was set up to "%SPOUT_SDK_DIR%"
		@ECHO WARNING Current [SPOUT_SDK_VER] was set up to "%SPOUT_SDK_VER%"
		@ECHO WARNING======================================================================
		@SET /P ANS="Are you sure you want to overwrite it? (yes/no)"
		@IF !ANS! == yes (
			@ECHO [SPOUT_SDK_DIR] will be set up to "%SDK_DIR%"
			@cscript.exe //nologo //e:jscript "%ENV_TOOL_DIR%setup_user_env_var.js" "SPOUT_SDK_DIR" "%SDK_DIR%"
			@ECHO [SPOUT_SDK_DIR] was set up.
		
		) ELSE (
			@ECHO Cancel to force setup Spout SDK environment variables.
			@ECHO Please press any key to close the window...
			@PAUSE> nul
			@EXIT
			
		)
	)
)

@ECHO [SPOUT_SDK_VER] will be set up to "%SDK_VER%"

@cscript.exe //nologo //e:jscript "%ENV_TOOL_DIR%setup_user_env_var.js" "SPOUT_SDK_VER" "%SDK_VER%"

@ECHO [SPOUT_SDK_VER] was set up.

@ECHO Please press any key to close the window...
@PAUSE> nul
@EXIT


@POPD
