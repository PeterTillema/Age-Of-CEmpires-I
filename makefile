ifeq ($(OS),Windows_NT)
SHELL = cmd.exe
NATIVEPATH = $(subst /,\,$(1))
COPY = xcopy /s /y
RM = del /f 2>nul
else
COPY = cp
RM = rm -f
endif

ASFLAGS   := -E -T -L -I $(call NATIVEPATH, gfx\bin)
CONVFLAGS := -x
ASSEMBLER := spasm
CONVHEX   := convhex
SRC       := aoce.asm
TARGET    := AOCE.bin
OUTPUTDIR := bin
CREATEDIR := mkdir
RELOCASM  := $(call NATIVEPATH, relocation_table*.asm)
 
all: $(OUTPUTDIR)/$(TARGET)
 
$(OUTPUTDIR)/$(TARGET): $(SRC)
	$(ASSEMBLER) $(ASFLAGS) $< $(call NATIVEPATH, $@)
	$(CONVHEX) $(CONVFLAGS) $(call NATIVEPATH, $(OUTPUTDIR)/$(TARGET))
	$(RM) $(RELOCASM) $(call NATIVEPATH, $(OUTPUTDIR)/$(TARGET))
 
.PHONY: all