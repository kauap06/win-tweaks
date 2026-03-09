@echo off

echo - Desligando o Core Parking (todos os nucleos sempre ativos)
powercfg -setacvalueindex scheme_current sub_processor CPMINCORES 100
powercfg /setactive SCHEME_CURRENT

echo - Ajustes internos especificos para CPUs Intel
bcdedit /set allowedinmemorysettings 0x0
bcdedit /set isolatedcontext No

echo - Ativando TSX
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" ^
 /v "DisableTsx" /t REG_DWORD /d "0" /f

echo - Desativando o Event Processor (menos latencia)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" ^
 /v "EventProcessorEnabled" /t REG_DWORD /d "0" /f

echo - Politica de resfriamento da CPU no modo ativo
powercfg /setACvalueindex scheme_current SUB_PROCESSOR SYSCOOLPOL 1
powercfg /setDCvalueindex scheme_current SUB_PROCESSOR SYSCOOLPOL 1
powercfg /setactive SCHEME_CURRENT

echo - Garantindo todos os threads ativos
bcdedit /set {current} numproc %NUMBER_OF_PROCESSORS%

echo - Desligando C-States (prioridade total em desempenho)
powercfg -setacvalueindex scheme_current SUB_SLEEP AWAYMODE 0
powercfg -setacvalueindex scheme_current SUB_SLEEP ALLOWSTANDBY 0
powercfg -setacvalueindex scheme_current SUB_SLEEP HYBRIDSLEEP 0
powercfg -setacvalueindex scheme_current sub_processor PROCTHROTTLEMIN 100
powercfg /setactive SCHEME_CURRENT
timeout /t 1 /nobreak > NUL

echo - Ajustando P-States para resposta mais rapida
powercfg -setacvalueindex scheme_current sub_processor IDLESCALING 1
powercfg /setactive SCHEME_CURRENT

echo - Desativando limitacao dinamica de clock (throttling)
powercfg -setacvalueindex scheme_current sub_processor THROTTLING 0
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" ^
 /v "ValueMin" /t REG_DWORD /d "0" /f

echo - Desativando o Fair Share do agendador de CPU
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Quota System" ^
 /v EnableCpuQuota /t REG_DWORD /d "0" /f

echo - Ajustando capacidades internas da CPU Intel
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Processor" ^
 /v Capabilities /t REG_DWORD /d 0x7E066 /f

echo - Aumentando o intervalo de checagem de performance
powercfg /setacvalueindex scheme_current ^
 54533251-82be-4824-96c1-47b60b740d00 ^
 4d2b0152-7d5c-498b-88e2-34345392a2c5 5000

powercfg /setactive scheme_current