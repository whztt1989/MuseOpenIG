set( APP_NAME openig-demo-a320 )

set( TARGET_SRC_FILES main.cpp )
set( TARGET_OTHER_FILES DataFiles/default.txt DataFiles/richcolorsdemo.txt DataFiles/openig.xml )

add_executable( ${APP_NAME} ${TARGET_SRC_FILES}
                ${TARGET_OTHER_FILES} )

target_link_libraries( ${APP_NAME}
    ${OSG_LIBRARIES}
    OpenIG-Engine
)

install(
    TARGETS ${APP_NAME}
    RUNTIME DESTINATION bin/openig-a320 COMPONENT openig
)

set_target_properties( ${APP_NAME} PROPERTIES PROJECT_LABEL "Application A320" )

SET(INSTALL_INCDIR include)
SET(INSTALL_BINDIR bin/openig-a320)
IF(WIN32)
    SET(INSTALL_LIBDIR bin)
    SET(INSTALL_ARCHIVEDIR lib)
ELSE()
    SET(INSTALL_LIBDIR ${CMAKE_INSTALL_LIBDIR})
    SET(INSTALL_ARCHIVEDIR ${CMAKE_INSTALL_LIBDIR})
ENDIF()

install(FILES ${CMAKE_CURRENT_LIST_DIR}/DataFiles/default.txt DESTINATION ${INSTALL_BINDIR})
install(FILES ${CMAKE_CURRENT_LIST_DIR}/DataFiles/richcolorsdemo.txt DESTINATION ${INSTALL_BINDIR})
install(FILES ${CMAKE_CURRENT_LIST_DIR}/DataFiles/flightpath.path DESTINATION ${INSTALL_BINDIR}/demo/)
install(FILES ${CMAKE_CURRENT_LIST_DIR}/DataFiles/openig.xml DESTINATION ${INSTALL_BINDIR}/igdata/)
install(FILES ${CMAKE_CURRENT_LIST_DIR}/DataFiles/OpenIG-Splash.jpg DESTINATION ${INSTALL_BINDIR}/igdata/)
