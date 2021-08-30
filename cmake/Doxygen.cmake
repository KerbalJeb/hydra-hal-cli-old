find_package(Doxygen)

if (DOXYGEN_FOUND)
  set(DOXYGEN_IN ${CMAKE_CURRENT_LIST_DIR}/../docs/config.doxygen)
  set(DOXYGEN_OUT ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)

  # request to configure the file
  configure_file(${DOXYGEN_IN} ${DOXYGEN_OUT} @ONLY)

  # note the option ALL which allows to build the docs together with the application
  add_custom_target( doc_doxygen ALL
                     COMMAND ${DOXYGEN_EXECUTABLE} "${DOXYGEN_OUT}"
                     WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
                     COMMENT "Generating API documentation with Doxygen"
                     VERBATIM )
else()
  message("Doxygen need to be installed to generate the doxygen documentation")
endif ()