# - Find DirectSound includes and libraries
#
#   DSOUND_FOUND        - True if DSOUND_INCLUDE_DIR & DSOUND_LIBRARY are found
#   DSOUND_LIBRARIES    - Set when DSOUND_LIBRARY is found
#   DSOUND_INCLUDE_DIRS - Set when DSOUND_INCLUDE_DIR is found
#
#   DSOUND_INCLUDE_DIR - where to find dsound.h, etc.
#   DSOUND_LIBRARY     - the dsound library
#

if( ${CMAKE_CL_64} )
    SET (DIRECTX_ARCH "x64")
else()
    SET (DIRECTX_ARCH "x86")
endif()

find_path(DSOUND_INCLUDE_DIR
          NAMES dsound.h
          NO_DEFAULT_PATH
          PATHS 
          "${DXSDK_DIR}/include"
          "$ENV{DXSDK_DIR}/include"
          "$ENV{PROGRAMFILES}/Microsoft DirectX SDK/include"
          "$ENV{PROGRAMFILES}/Microsoft DirectX SDK (August 2008)/include"
          "$ENV{PROGRAMFILES}/Microsoft DirectX SDK (June 2010)/include"          
          DOC "The DirectSound include directory"
)

find_library(DSOUND_LIBRARY
             NAMES dsound
             NO_DEFAULT_PATH
             PATHS
             "${DXSDK_DIR}/Lib/${DIRECTX_ARCH}"
             "$ENV{DXSDK_DIR}/Lib/${DIRECTX_ARCH}"
             "$ENV{PROGRAMFILES}/Microsoft DirectX SDK/Lib/${DIRECTX_ARCH}"
             "$ENV{PROGRAMFILES}/Microsoft DirectX SDK (August 2008)/Lib/${DIRECTX_ARCH}"
             "$ENV{PROGRAMFILES}/Microsoft DirectX SDK (June 2010)/Lib/${DIRECTX_ARCH}"             
             DOC "The DirectSound library"
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(DSound
    REQUIRED_VARS DSOUND_LIBRARY DSOUND_INCLUDE_DIR
)

if(DSOUND_FOUND)
    set(DSOUND_LIBRARIES ${DSOUND_LIBRARY})
    set(DSOUND_INCLUDE_DIRS ${DSOUND_INCLUDE_DIR})
endif()

mark_as_advanced(DSOUND_INCLUDE_DIR DSOUND_LIBRARY)
