@echo off
REM rename_folders.bat
REM Renames numerically-named folders (1, 2, ..., 200) to zero-padded
REM names (001, 002, ..., 200) so they sort correctly in GitHub / File Explorer.

setlocal enabledelayedexpansion

for /d %%D in (*) do (
    set "name=%%D"
    set "isnum=1"
    for /f "delims=0123456789" %%c in ("!name!") do set "isnum=0"

    if "!isnum!"=="1" (
        set "padded=000!name!"
        set "padded=!padded:~-3!"
        if not "!name!"=="!padded!" (
            echo Renaming "!name!" to "!padded!"
            git rev-parse --is-inside-work-tree >nul 2>&1
            if !errorlevel! equ 0 (
                git mv "!name!" "!padded!"
            ) else (
                ren "!name!" "!padded!"
            )
        )
    )
)

echo Done. Review changes, then commit and push if this is a git repo.
pause