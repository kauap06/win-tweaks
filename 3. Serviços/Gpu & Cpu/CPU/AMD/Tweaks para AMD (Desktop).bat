@echo off

echo - Desativando Core Parking (todos os nucleos ativos)
powercfg -setacvalueindex scheme_current sub_processor CPMINCORES 100
powercfg /setactive SCHEME_CURRENT

echo - Desativando TSX
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableTsx" /t REG_DWORD /d "1" /f

echo - Desativando Event Processor
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /t REG_DWORD /d "0" /f

echo - Ajustes de resfriamento da CPU
powercfg /setACvalueindex scheme_current SUB_PROCESSOR SYSCOOLPOL 1
powercfg /setDCvalueindex scheme_current SUB_PROCESSOR SYSCOOLPOL 1
powercfg /setactive SCHEME_CURRENT

echo - Ajustando capacidades internas da CPU
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Processor" /v Capabilities /t REG_DWORD /d 0x7E066 /f

echo - Ativando todos os processadores logicos
set THREADS=%NUMBER_OF_PROCESSORS% & bcdedit /set {current} numproc %NUMBER_OF_PROCESSORS%

echo - Desativando C-States
powercfg -setacvalueindex scheme_current sub_processor PROCTHROTTLEMIN 100
powercfg /setactive SCHEME_CURRENT

echo - Ajustando P-States para melhor resposta da CPU
powercfg -setacvalueindex scheme_current sub_processor IDLESCALING 1
powercfg /setactive SCHEME_CURRENT

echo - Desativando limitacao de clock da CPU
powercfg -setacvalueindex scheme_current sub_processor THROTTLING 0
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f

echo - Desativando Fair Share do agendador de CPU
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Quota System" /v EnableCpuQuota /t REG_DWORD /d "0" /f

echo - Ajustando capacidades internas da CPU
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Processor" /v Capabilities /t REG_DWORD /d 0x7E066 /f

echo - Otimizando intervalo de verificacao de performance
powercfg /setacvalueindex scheme_current 54533251-82be-4824-96c1-47b60b740d00 4d2b0152-7d5c-498b-88e2-34345392a2c5 5000
Powercfg -setactive scheme_current