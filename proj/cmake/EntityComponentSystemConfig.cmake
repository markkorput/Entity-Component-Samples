if( NOT TARGET EntityComponentSystem )
	get_filename_component( EntityComponentSystem_SOURCE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../src" ABSOLUTE )
	get_filename_component( entityx_SOURCE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../src/entityx" ABSOLUTE )

	get_filename_component( CINDER_PATH "${CMAKE_CURRENT_LIST_DIR}/../../../.." ABSOLUTE )

	FILE(GLOB EntityComponentSystem_SOURCES ${EntityComponentSystem_SOURCE_PATH}/soso/*.cpp)
	FILE(GLOB entityx_SOURCES
		${entityx_SOURCE_PATH}/entityx/Entity.cc
		${entityx_SOURCE_PATH}/entityx/Event.cc
		${entityx_SOURCE_PATH}/entityx/System.cc
		${entityx_SOURCE_PATH}/entityx/*/*.cc)

	add_library( EntityComponentSystem ${EntityComponentSystem_SOURCES} ${entityx_SOURCES})

	target_include_directories( EntityComponentSystem PUBLIC "${EntityComponentSystem_SOURCE_PATH}" )
	target_include_directories( EntityComponentSystem PUBLIC "${entityx_SOURCE_PATH}" )
	target_include_directories( EntityComponentSystem SYSTEM BEFORE PUBLIC "${CINDER_PATH}/include" )

	if( NOT TARGET cinder )
		    include( "${CINDER_PATH}/proj/cmake/configure.cmake" )
		    find_package( cinder REQUIRED PATHS
		        "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
		        "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}" )
	endif()
	target_link_libraries( EntityComponentSystem PRIVATE cinder )
endif()
