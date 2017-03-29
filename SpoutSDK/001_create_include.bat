@REM ========================================
@REM 001_create_include.bat
@REM 
@REM 2017/03/28 The78ester
@REM ========================================
@SETLOCAL ENABLEDELAYEDEXPANSION 

@PUSHD %~d0%~p0

@SET filecpy=XCOPY /Y /D
@SET SrcRoot=Source\
@SET IncName=Include
@SET DstRoot=%IncName%\

@IF NOT EXIST "%IncName%" (
	@MKDIR %IncName%
)

@%filecpy% %SrcRoot%Spout.h 				%DstRoot%
@%filecpy% %SrcRoot%SpoutSender.h 			%DstRoot%
@%filecpy% %SrcRoot%SpoutReceiver.h 		%DstRoot%
@%filecpy% %SrcRoot%SpoutSDK.h 				%DstRoot%
@%filecpy% %SrcRoot%SpoutCommon.h 			%DstRoot%
@%filecpy% %SrcRoot%SpoutMemoryShare.h 		%DstRoot%
@%filecpy% %SrcRoot%SpoutSenderNames.h 		%DstRoot%
@%filecpy% %SrcRoot%SpoutSharedMemory.h 	%DstRoot%
@%filecpy% %SrcRoot%SpoutGLDXinterop.h 		%DstRoot%
@%filecpy% %SrcRoot%SpoutDirectX.h 			%DstRoot%
@%filecpy% %SrcRoot%SpoutCopy.h 			%DstRoot%
@%filecpy% %SrcRoot%SpoutGLextensions.h 	%DstRoot%

@PAUSE

@POPD
