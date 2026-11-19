; Use the Windows display language instead of the user's number/date locale.
!macro CageSelectInstallerLanguage
  Push $0
  System::Call 'kernel32::GetUserDefaultUILanguage() i .r0'
  StrCpy $LANGUAGE ${LANG_SIMPCHINESE}
  ${If} $0 == 0x0404
  ${OrIf} $0 == 0x0c04
  ${OrIf} $0 == 0x1404
  ${OrIf} $0 == 0x7c04
    StrCpy $LANGUAGE ${LANG_TRADCHINESE}
  ${Else}
    IntOp $0 $0 & 0x03ff
    ${Switch} $0
      ${Case} 0x19
        StrCpy $LANGUAGE ${LANG_RUSSIAN}
        ${Break}
      ${Case} 0x01
        StrCpy $LANGUAGE ${LANG_ARABIC}
        ${Break}
      ${Case} 0x29
        StrCpy $LANGUAGE ${LANG_FARSI}
        ${Break}
      ${Case} 0x12
        StrCpy $LANGUAGE ${LANG_KOREAN}
        ${Break}
      ${Case} 0x0a
        StrCpy $LANGUAGE ${LANG_SPANISH}
        ${Break}
      ${Case} 0x55
        StrCpy $LANGUAGE ${LANG_BURMESE}
        ${Break}
      ${Case} 0x23
        StrCpy $LANGUAGE ${LANG_BELARUSIAN}
        ${Break}
      ${Case} 0x63
        StrCpy $LANGUAGE ${LANG_PASHTO}
        ${Break}
      ${Case} 0x8c
        StrCpy $LANGUAGE ${LANG_DARI}
        ${Break}
      ${Case} 0x5e
        StrCpy $LANGUAGE ${LANG_AMHARIC}
        ${Break}
      ${Case} 0x77
        StrCpy $LANGUAGE ${LANG_SOMALI}
        ${Break}
      ${Case} 0x73
        StrCpy $LANGUAGE ${LANG_TIGRINYA}
        ${Break}
      ${Case} 0x0c
        StrCpy $LANGUAGE ${LANG_FRENCH}
        ${Break}
    ${EndSwitch}
  ${EndIf}
  Pop $0
!macroend
