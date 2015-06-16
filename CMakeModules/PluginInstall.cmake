SET(INSTALL_BINDIR bin/igplugins)
IF(WIN32)
    SET(INSTALL_LIBDIR bin/igplugins)
    SET(INSTALL_ARCHIVEDIR lib/igplugins)
ELSE()
    SET(INSTALL_LIBDIR ${CMAKE_INSTALL_LIBDIR}/igplugins)
    SET(INSTALL_ARCHIVEDIR ${CMAKE_INSTALL_LIBDIR}/igplugins)
ENDIF()

INSTALL(
    TARGETS ${LIB_NAME}
    EXPORT openig-targets
    RUNTIME DESTINATION ${INSTALL_BINDIR} COMPONENT libopenig
    LIBRARY DESTINATION ${INSTALL_LIBDIR} COMPONENT libopenig
    ARCHIVE DESTINATION ${INSTALL_ARCHIVEDIR} COMPONENT libopenig-dev
)


