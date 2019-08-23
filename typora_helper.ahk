::<img::<img src="" width=500 />
return

::3mat3::\begin{{}bmatrix{}}{ENTER}0 & 0 & 0 \\{ENTER}0 & 0 & 0 \\{ENTER}0 & 0 & 0 \\{ENTER}\end{{}bmatrix{}}
return

::2mat2::\begin{{}bmatrix{}}{ENTER}0 & 0 \\{ENTER}0 & 0 \\{ENTER}\end{{}bmatrix{}}
return

;Easy Matrix Making
:*:\matr::
sendinput \begin{{}bmatrix{}}{enter}{enter}
sendinput \end{{}bmatrix{}}{enter}
sendinput {up}{up}

repeat := 0
While(true){

    Input inp, V & B, {Enter} {Space} {Escape}

    if(ErrorLevel = "Endkey:Escape"){
        break
    }
    else if(ErrorLevel = "EndKey:Enter"){
        if(repeat && inp = ""){
            sendinput {backspace}{backspace}{down}{down}
            break
        }
        else{
            sendinput {backspace}\\{enter}
            repeat := 1
        }
    }
    else if(ErrorLevel = "EndKey:Space"){
        sendinput &{space} 
        repeat := 0
    }
}
return

:*:\imatr::
repeat := 0
While(true){

    Input inp, V & B, {Enter} {Space} {Escape}

    if(ErrorLevel = "Endkey:Escape"){
        break
    }
    else if(ErrorLevel = "EndKey:Enter"){
        if(repeat && inp = ""){
            sendinput {backspace}{backspace}{down}{down}
            break
        }
        else{
            sendinput {backspace}\\{enter}
            repeat := 1
        }
    }
    else if(ErrorLevel = "EndKey:Space"){
        sendinput &{space} 
        repeat := 0
    }
}
return

;\begin \end environment completion
:*:\begin::
    sendinput \begin{{}
    Input inp, V &, {Enter} {Escape}
    if(ErrorLevel = "EndKey:Enter"){
        sendinput {Backspace}{}}{Enter}{Enter}\end{{}%inp%{}}{up}
    }
    return



:*:2i2::
    sendinput \begin{{}bmatrix{}}1&0\\0&1\end{{}bmatrix{}}
    return

:*:3i3::
    sendinput \begin{{}bmatrix{}}1&0&0\\0&1&0\\0&0&1\end{{}bmatrix{}}
    return

:*:\eq::
sendinput \begin{{}equation{}}{enter}{enter}\end{{}equation{}}{up}
return

:*b0:\frac::
    sendinput {{}{}}{{}{Left}{Left}
    Input inp, V &, {Space} {Right}

    if(ErrorLevel == "EndKey:Space"){
        Sendinput {Backspace}{Right}{Right}
    }
    else if(ErrorLevel == "EndKey:Right"){
        return
    }

    return
    



