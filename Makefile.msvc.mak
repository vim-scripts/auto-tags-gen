# =========================================================================
#     This makefile was generated by
#     Bakefile 0.2.9 (http://www.bakefile.org)
#     Do not modify, all changes will be overwritten!
# =========================================================================



# -------------------------------------------------------------------------
# These are configurable options:
# -------------------------------------------------------------------------

# C compiler 
CC = cl

# Standard flags for CC 
CFLAGS = 

# Standard preprocessor flags (common for CC and CXX) 
CPPFLAGS = 

# Standard linker flags 
LDFLAGS = 



# -------------------------------------------------------------------------
# Do not modify the rest of this file!
# -------------------------------------------------------------------------

### Variables: ###

AUTO_TAG_GEN_CFLAGS = /MD /DWIN32 /W4 /DBUILD_DLL /DBUILDING_DLL /D_WINDLL /TC /W4 \
	$(CPPFLAGS) $(CFLAGS)
AUTO_TAG_GEN_OBJECTS =  \
	auto_tag_gen_cmdline_ctags.obj

### Conditionally set variables: ###



### Targets: ###

all: auto_tag_gen.dll

clean: 
	-if exist .\*.obj del .\*.obj
	-if exist .\*.res del .\*.res
	-if exist .\*.pch del .\*.pch
	-if exist auto_tag_gen.dll del auto_tag_gen.dll
	-if exist auto_tag_gen.ilk del auto_tag_gen.ilk
	-if exist auto_tag_gen.pdb del auto_tag_gen.pdb
	-if exist auto_tag_gen.lib del auto_tag_gen.lib

auto_tag_gen.dll: $(AUTO_TAG_GEN_OBJECTS)
	link /DLL /NOLOGO /OUT:$@  $(LDFLAGS) @<<
	$(AUTO_TAG_GEN_OBJECTS)   user32.lib kernel32.lib shell32.lib gdi32.lib comctl32.lib ole32.lib /IMPLIB:auto_tag_gen.lib
<<
	mt.exe -manifest auto_tag_gen.dll.manifest -outputresource:auto_tag_gen.dll;2
	del auto_tag_gen.dll.manifest

auto_tag_gen_cmdline_ctags.obj: .\cmdline_ctags.c
	$(CC) /c /nologo /TC /Fo$@ $(AUTO_TAG_GEN_CFLAGS) .\cmdline_ctags.c

