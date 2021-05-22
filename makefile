

compiler = g++
# dossier avec le code de la lib et on indique qu'on veut du statique
includeFlags = -Iinclude -DSFML_STATIC
# dossier ou trouver le lib à link
getLibDir = -Llib
# libs à link 
linkLibs = -lsfml-graphics-s -lsfml-window-s -lsfml-system-s -lopengl32 -lwinmm -lgdi32
# on colle tout ça
linkerFlags = $(getLibDir) $(linkLibs)

gameName = GAME
tmpFilePath = $(gameName).tmp
finalFilePath = bin/$(gameName).exe

# 1) on compile sans link
# 2) on link
# ça marche pas quand je le fais en une fois

game: src/main.cpp
	@echo Compiling ...
	@$(compiler) -c src/main.cpp $(includeFlags) -o $(tmpFilePath)
	@echo Success !
	@echo Linking ...
	@$(compiler) $(tmpFilePath) $(linkerFlags) -o $(finalFilePath)
	@echo Success !
	@del $(tmpFilePath)
	@echo Running $(gameName)
	@$(finalFilePath)


