(when (string-equal system-type "windows-nt")
  (let ((winpaths
         '(
           "C:/Users/darko/AppData/Local/Programs/Python/Python310"
           "C:/Users/darko/AppData/Local/Programs/Python/Python310/Scripts"
           "C:/Program Files/nodejs/"
           "C:/Users/darko/AppData/Roaming/npm/"
           "C:/ProgramData/chocolatey/bin/"
           "c:/ProgramData/Anaconda3/Scripts"

           "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\IDE\\CommonExtensions\\Microsoft\\CMake\\Ninja"
           "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\MSBuild\\Current\\Bin\\amd64"
           "C:\\Program Files\\LLVM\\bin"
           "C:\\Program Files\\CMake\\bin"
           
           "C:/msys64/mingw64/bin/"
           "C:/msys64/usr/bin/"

           "C:/Program Files/WinUAE"
           "C:/Program Files/Microsoft/jdk-17.0.3.7-hotspot/bin/"
           ))
        )
    ;; PATH is used by emacs when you are running a shell in emacs
    (setenv "PATH" (mapconcat 'identity winpaths ";"))
    (setenv "URHO3D_HOME" "c:/Users/darko/.urho3d")
    ;; exec-path is used by emacs itself to find programs
    (setq exec-path (append winpaths (list "." exec-directory))))
  ;; (w32-register-hot-key [s-]) with w32-lwindow-modifier bound to super
  ;; disables all the Windows’ own Windows key based shortcuts.
  (setq w32-lwindow-modifier 'super)
  (w32-register-hot-key [s-])
  ;; (electric-indent-mode -1)
  )
