@echo off

:: Nastaven° znakÖ
chcp 852>NUL

:: Nastaven° a informace
SET verze=1.0
SET datum=02.09.2021
TITLE Shutdown script by Bazim.cz (v%verze% - %datum%)

:: Èvodn° text
echo 1 = vypnout poü°taü
echo 2 = zruÁit vypnut° poü°taüe

:: Vynech†me ˝†dek
echo.

:: Script
SET /P prikaz="Vyber prÌkaz: "

:: Zvol°me dle zad†n° ußivatele
IF %prikaz%==1 (
	cls
	SET /P cas_do_vypnuti_pred="¨as do vypnut° (poüet celÏch hodiny): "
	goto kontrola
)

IF %prikaz%==2 (
	shutdown.exe /a
)

:: Ukonü°me script
:konec
exit

:: Kontrola zda-li dojde k vypnut° poü°taüe za ußivatelem zvolenÏ üas
:kontrola
cls
SET /a cas_do_vypnuti_po=%cas_do_vypnuti_pred%*60*60
SET /a cas_do_vypnuti_po_minut=%cas_do_vypnuti_pred%*60
echo Poü°taü bude vypnut za %cas_do_vypnuti_po% sekund (= %cas_do_vypnuti_po_minut%m).
echo.
SET /p kontrola="Je to tak spr†vnÿ? (a/n): "

IF %kontrola%==a (
	goto vypnout
) ELSE (
	goto konec
)

:: Napl†nov†n° vypnut° poü°taüe
:vypnout
shutdown.exe /s /f /t %cas_do_vypnuti_po%