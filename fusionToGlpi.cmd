if exist "C:\Program Files\FusionInventory-Agent" (
    
    cd \Program Files\FusionInventory-Agent
    
    Uninstall.exe /S

    echo FusionInventory removido com sucesso.

    cd \
    msiexec -i https://github.com/glpi-project/glpi-agent/releases/download/1.5/GLPI-Agent-1.5-x64.msi /passive
	
    echo GLPI instalado com sucesso.

    reg add HKEY_LOCAL_MACHINE\SOFTWARE\GLPI-Agent /v server /t REG_SZ /d https://addyourlinkhere.com /f 
    reg add HKEY_LOCAL_MACHINE\SOFTWARE\GLPI-Agent\Installer /v RunNow /t REG_SZ /d 1 /f

    timeout /t 80 & ( 
    echo Forçando inventário, aguarde...    
    cd /Program Files/GLPI-Agent 
    glpi-agent.bat --force --no-ssl-check
    echo Inventário forçado com sucesso.
    )

) else if exist "C:\Program Files\GLPI-Agent" (
    echo FusionInventory não está instalado, GLPI sim. Forçando inventório:

    reg add HKEY_LOCAL_MACHINE\SOFTWARE\GLPI-Agent /v server /t REG_SZ /d https://addyourlinkhere.com /f 
    reg add HKEY_LOCAL_MACHINE\SOFTWARE\GLPI-Agent\Installer /v RunNow /t REG_SZ /d 1 /f

    echo Forçando inventário, aguarde...
    cd /Program Files/GLPI-Agent 
    glpi-agent.bat --force --no-ssl-check
    echo Inventário forçado com sucesso.

) else (
    echo Fusion e GLPI não estão instalados. Prosseguindo com instalação do GLPI:

    cd /
    msiexec -i https://github.com/glpi-project/glpi-agent/releases/download/1.5/GLPI-Agent-1.5-x64.msi /passive
	
    echo GLPI instalado com sucesso.

    reg add HKEY_LOCAL_MACHINE\SOFTWARE\GLPI-Agent /v server /t REG_SZ /d https://addyourlinkhere.com /f 
    reg add HKEY_LOCAL_MACHINE\SOFTWARE\GLPI-Agent\Installer /v RunNow /t REG_SZ /d 1 /f

    timeout /t 80 & ( 
    echo Forçando inventário, aguarde...    
    cd /Program Files/GLPI-Agent 
    glpi-agent.bat --force --no-ssl-check
    echo Inventário forçado com sucesso.
    )

)



