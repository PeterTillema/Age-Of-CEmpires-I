ifeq ($(OS),Windows_NT)
SHELL = cmd.exe
NATIVEPATH = $(subst /,\,$(1))
COPY = xcopy /s /y
RM = del /f 2>nul
else
COPY = cp
RM = rm -f
endif

FLAGS     := -E -T -L -I $(call NATIVEPATH,gfx\bin)
AS        := spasm
SRC       := aoce.asm
TARGET    := AOCE.bin
OUTPUTDIR := bin
CREATEDIR := mkdir
 
all: $(OUTPUTDIR)/$(TARGET)
 
$(OUTPUTDIR)/$(TARGET): $(SRC)
	$(AS) $(FLAGS) $< $(call NATIVEPATH,$@)
 
.PHONY: all